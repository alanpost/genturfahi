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
;;; not-predicate: !e
;;;
;;; not-predicate <- !#\a
;;;
(define (not-predicate)
  (set! genturfahi-not-predicate
        (genturfahi* (nunjavni-! (nunjavni-lerfu #\a))))
  (not-predicate-test genturfahi-not-predicate))

(define (not-predicate-peg)
  (set! genturfahi-not-predicate
        (begin (eval (call-with-input-file "not-predicate.peg" genturfahi-peg))
               (genturfahi-bootstrap*)))
  (not-predicate-test genturfahi-not-predicate))

(define (not-predicate-test genturfahi-not-predicate)
  ; this not-predicate matches everything *but* \#a.
  ; not-predicate never advances the input.
  ;
  ; on match, we return the empty string.
  ;
  (test '(#f "a") (genturfahi-not-predicate "a"))
  (test '("" "b") (genturfahi-not-predicate "b"))
  (test '("" "c") (genturfahi-not-predicate "c"))

  ; we match the empty string (because the empty string
  ; isn't #\a.)
  ;
  (test '("" "") (genturfahi-not-predicate ""))

  ; there is no rule for the end-of-file
  ; These don't parse the whole buffer!
  ;
  (test '(#f "aa") (genturfahi-not-predicate "aa"))
  (test '(#f "ab") (genturfahi-not-predicate "ab"))
  (test '(#f "ac") (genturfahi-not-predicate "ac"))
  (test '("" "ba") (genturfahi-not-predicate "ba"))
  (test '("" "bb") (genturfahi-not-predicate "bb"))
  (test '("" "bc") (genturfahi-not-predicate "bc"))
  (test '("" "ca") (genturfahi-not-predicate "ca"))
  (test '("" "cb") (genturfahi-not-predicate "cb"))
  (test '("" "cc") (genturfahi-not-predicate "cc"))
  0)

(test-group "not-predicate"
  (not-predicate))

(test-group "not-predicate (PEG)"
  (not-predicate-peg))
