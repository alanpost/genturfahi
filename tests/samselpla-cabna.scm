;;;;
;;;; genturfahi - lo la .ckim. ke pe'a jajgau ratcu ke'e genturfa'i
;;;;            `-> A Scheme packrat parser.
;;;;
;;;; Copyright (c) 2011 ".alyn.post." <alyn.post@lodockikumazvati.org>
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
;;; execute code during parse
;;;
;;; gerna <- ab ab
;;; ab    <- [ab]
;;;
(define (test-samselpla-samselpla-cabna pamoi remoi)
  (if (char=? pamoi remoi)
      (string pamoi remoi)
      (secuxna-nonmatch-token)))

(define (samselpla-cabna-peg)
  (let* ((samselpla-cabna (call-with-input-file "samselpla-cabna.peg"
                                                genturfahi-peg))
         (genturfahi-samselpla-cabna (genturfahi* (eval samselpla-cabna))))
    (samselpla-cabna-test genturfahi-samselpla-cabna)))

(define (samselpla-cabna-test genturfahi-samselpla-cabna)
  ; The code runs while a syntax tree is being generated.
  ;
  (test '("aa" "") (genturfahi-samselpla-cabna "aa"))
  (test '(#f "ab") (genturfahi-samselpla-cabna "ab"))
  (test '("bb" "") (genturfahi-samselpla-cabna "bb"))
  (test '(#f "ba") (genturfahi-samselpla-cabna "ba"))
  0)

(test-group "samselpla cabna (PEG)"
  (samselpla-cabna-peg))
