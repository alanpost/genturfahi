;;;;
;;;; genturfahi - lo la .ckim. ke pe'a jajgau ratcu ke'e genturfa'i
;;;;            `-> A Scheme packrat parser.
;;;;
;;;; Copyright (c) 2010 ".alyn.post." <alyn.post@lodockikumazvati.org>
;;;;
;;;; Permission to use, copy, modify, and/or distribute this software for any
;;;; purpose with or without fee is hereby granted, provided that the above
;;;; copyright notice and this permission notice appear in all copies.
;;;;
;;;; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;;;; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;;;; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;;;; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;;;; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;;;; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;;;; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
;;;;

;;;
;;; ordered sequence: e_1 e_2
;;;
;;; je <- #\a #\b #\c
;;;
(define (je)
  (let ((genturfahi-je
    (genturfahi* (nunjavni-je (nunjavni-lerfu #\a)
                              (nunjavni-lerfu #\b)
                              (nunjavni-lerfu #\c)))))
    (je-test genturfahi-je)))

(define (je-peg)
  (let* ((samselpla (call-with-input-file "je.peg" genturfahi-peg))
         (genturfahi-je (genturfahi* (eval samselpla))))
    (je-test genturfahi-je)))

(define (je-test genturfahi-je)
  ; matches each lerfu in sequence 
  ;
  (test '((#\a #\b #\c) "") (genturfahi-je "abc"))

  ; matches the first rule (#\a), but not the second or
  ; third (#\b and #\c), so this match fails.
  ;
  (test '(#f "a") (genturfahi-je "a"))
  (test '(#f "ac") (genturfahi-je "ac"))

  ; matches the first two rules (#\a and #\b), but not
  ; the third one.
  ;
  (test '(#f "ab") (genturfahi-je "ab"))
  (test '(#f "abd") (genturfahi-je "abd"))

  ; "abc" is the only correct sequence.  Every other
  ; combination of #\a, #\b, and #\c does not match.
  ;
  (test '(#f "acb") (genturfahi-je "acb"))
  (test '(#f "bac") (genturfahi-je "bac"))
  (test '(#f "bca") (genturfahi-je "bca"))
  (test '(#f "cab") (genturfahi-je "cab"))
  (test '(#f "cba") (genturfahi-je "cba"))

  ; there is no rule for #\d, no match
  ;
  (test '(#f "d") (genturfahi-je "d"))

  ; there is no rule for the emtpy
  ; string, no match
  ;
  (test '(#f "") (genturfahi-je ""))

  ; there is no rule for the end-of-file
  ; These match, but they don't parse the
  ; whole buffer!
  ;
  (test '((#\a #\b #\c) "a") (genturfahi-je "abca"))
  (test '((#\a #\b #\c) "b") (genturfahi-je "abcb"))
  (test '((#\a #\b #\c) "c") (genturfahi-je "abcc"))

  ; later characters that would match
  ; don't if there is no rule to match
  ; earlier characters.
  ;
  (test '(#f "dabc") (genturfahi-je "dabc"))
  0)

(test-group "je"
  (je))

(test-group "je (PEG)"
  (je-peg))
