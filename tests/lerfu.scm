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
;;; terminal:
;;;
;;; lerfu <- #\a
;;;
(define (lerfu)
  (let ((genturfahi-lerfu (genturfahi* (nunjavni-lerfu #\a))))
    (lerfu-test genturfahi-lerfu)))

(define (lerfu-peg)
  (let* ((samselpla (call-with-input-file "lerfu.peg" genturfahi-peg))
         (genturfahi-lerfu (genturfahi* (eval samselpla))))
    (lerfu-test genturfahi-lerfu)))

(define (lerfu-test genturfahi-lerfu)
  ; match the only character this parser matches.
  ;
  (test '(#\a "") (genturfahi-lerfu "a"))

  ; There is no rule to match any other character,
  ; so they don't match.
  ;
  (test '(#f "b") (genturfahi-lerfu "b"))
  (test '(#f "c") (genturfahi-lerfu "c"))

  ; there is no rule for the emtpy
  ; string, no match
  ;
  (test '(#f "") (genturfahi-lerfu ""))

  ; there is no rule for the end-of-file
  ; These match, but they don't parse the
  ; whole buffer!
  ;
  ; this rule won't even match two #\a,
  ; only one.
  ;
  (test '(#\a "a") (genturfahi-lerfu "aa"))
  (test '(#\a "b") (genturfahi-lerfu "ab"))
  (test '(#\a "c") (genturfahi-lerfu "ac"))

  ; later characters that would match
  ; don't if there is no rule to match
  ; earlier characters.
  ;
  (test '(#f "da") (genturfahi-lerfu "da"))
  0)

(test-group "lerfu"
  (lerfu))

(test-group "lerfu (PEG)"
  (lerfu-peg))
