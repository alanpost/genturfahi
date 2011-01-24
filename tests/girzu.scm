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
;;; grouping tree equivalence.
;;;
(define (girzu)
  (let* ((samselpla (call-with-input-file "girzu.peg" genturfahi-peg))
         (genturfahi-girzu (genturfahi* (eval samselpla))))
    (girzu-test genturfahi-girzu)))

(define (girzu-test genturfahi-girzu)
  ; I currently only support detection and failure of left recursive
  ; grammar.  These tests demonstrate that.
  ;
  (test '(((#\a #\b #\c)
           (#\a #\b #\c)
           (#\a #\b #\c)) "")
         (genturfahi-girzu "abcabcabc"))
  0)

(test-group "left recursion"
  (girzu))
