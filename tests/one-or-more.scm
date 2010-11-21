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
;;; one-or-more: e+
;;;
;;; one-or-more <- #\a+
;;;
(define (one-or-more)
  (let ((genturfahi-one-or-more
    (genturfahi* (nunjavni-+ (nunjavni-lerfu #\a)))))
    (one-or-more-test genturfahi-one-or-more)))

(define (one-or-more-peg)
  (let* ((samselpla (call-with-input-file "one-or-more.peg" genturfahi-peg))
         (genturfahi-one-or-more (genturfahi* (eval samselpla))))
    (one-or-more-test genturfahi-one-or-more)))

(define (one-or-more-test genturfahi-one-or-more)
  ; match the only character this parser matches.
  ; notice that it returns a list of characters,
  ; even if it only matches a single character.
  ;
  (test '((#\a) "") (genturfahi-one-or-more "a"))

  ; We match as many #\a as we can.
  ;
  (test '((#\a #\a) "") (genturfahi-one-or-more "aa"))
  (test '((#\a #\a #\a) "") (genturfahi-one-or-more "aaa"))

  ; but we don't match zero #\a.
  ;
  (test '(#f "") (genturfahi-one-or-more ""))
  (test '(#f "b") (genturfahi-one-or-more "b"))
  (test '(#f "c") (genturfahi-one-or-more "c"))

  ; As well, it will match all #\a before ending
  ; the parse.  These match, but they don't parse
  ; the whole buffer!
  ;
  (test '((#\a) "b") (genturfahi-one-or-more "ab"))
  (test '((#\a) "c") (genturfahi-one-or-more "ac"))

  (test '((#\a #\a) "b") (genturfahi-one-or-more "aab"))
  (test '((#\a #\a) "c") (genturfahi-one-or-more "aac"))

  (test '((#\a #\a #\a) "b") (genturfahi-one-or-more "aaab"))
  (test '((#\a #\a #\a) "c") (genturfahi-one-or-more "aaac"))

  ; later characters that would match don't if there is no rule
  ; to match earlier characters.  These rules don't match, as
  ; the input does not begin with #\a.
  ;
  (test '(#f "da") (genturfahi-one-or-more "da"))
  (test '(#f "daa") (genturfahi-one-or-more "daa"))
  (test '(#f "daaa") (genturfahi-one-or-more "daaa"))
  0)

(test-group "one-or-more"
  (one-or-more))

(test-group "one-or-more (PEG)"
  (one-or-more-peg))
