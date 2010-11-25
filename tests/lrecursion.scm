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
;;; left-recursion:
;;;
;;; empty-string <- ""
;;; expr  <- expr #\+ term
;;;          / term
;;; term  <- [[:digit:]]+
;;;
(define (test-lrecursion-+ #!key x y)
  (+ x y))

(define (test-lrecursion-term #!key x)
  (string->number x))

(define (left-recursion)
  (let* ((samselpla (call-with-input-file "lrecursion.peg" genturfahi-peg))
         (genturfahi-left-recursion (genturfahi* (eval samselpla))))
    (left-recursion-test genturfahi-left-recursion)))

(define (left-recursion-test genturfahi-lrecursion)
  ; I currently only support detection and failure of left recursive
  ; grammar.  These tests demonstrate that.
  ;
  (test '(#f "")       (genturfahi-lrecursion ""))
  (test '(#f "a")      (genturfahi-lrecursion "a"))
  (test '(#f "abc")    (genturfahi-lrecursion "abc"))
  (test '(#f "a+")     (genturfahi-lrecursion "a+"))
  (test '(#f "a+b+c")  (genturfahi-lrecursion "a+b+c"))
  (test '(1  "")       (genturfahi-lrecursion "1"))
  (test '(1  "+")      (genturfahi-lrecursion "1+"))
  (test '(1  "+2")     (genturfahi-lrecursion "1+2"))
  (test '(1  "+2+")    (genturfahi-lrecursion "1+2+"))
  (test '(1  "+2+3")   (genturfahi-lrecursion "1+2+3"))
  0)

(test-group "left recursion"
  (left-recursion))
