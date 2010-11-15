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
;;; optional: e?
;;;
;;; optional <- #\a?
;;;
(define (optional?)
  (set! genturfahi-optional
        (genturfahi* (nunjavni-? (nunjavni-lerfu #\a))))
  (optional?-test genturfahi-optional))

(define (optional?-peg)
  (set! genturfahi-optional
        (begin (eval (call-with-input-file "optional.peg" genturfahi-peg))
               (genturfahi-bootstrap*)))
  (optional?-test genturfahi-optional))

(define (optional?-test genturfahi-optional)
  ; match the only character this parser matches.
  ;
  (test '(#\a "") (genturfahi-optional "a"))

  ; There is no rule to match any other character,
  ; but since this rule is optional, the empty string
  ; is returned.
  ;
  (test '("" "b") (genturfahi-optional "b"))
  (test '("" "c") (genturfahi-optional "c"))

  ; there is no rule for the emtpy string, but the
  ; optional rule matches anyway.
  ;
  (test '("" "") (genturfahi-optional ""))

  ; there is no rule for the end-of-file
  ; These match, but they don't parse the
  ; whole buffer!
  ;
  ; this rule won't even match two #\a,
  ; only zero or one.
  ;
  (test '(#\a "a") (genturfahi-optional "aa"))
  (test '(#\a "b") (genturfahi-optional "ab"))
  (test '(#\a "c") (genturfahi-optional "ac"))

  ; later characters that would match don't if there
  ; is no rule to match earlier characters.  We match
  ; zero #\a at the beginning of the parser input and
  ; return.
  ;
  (test '("" "da") (genturfahi-optional "da"))
  0)

(test-group "optional?"
  (optional?))

(test-group "optional? (PEG)"
  (optional?-peg))
