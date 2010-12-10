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
;;; empty-list:
;;;
;;; empty-list <- ()
;;;
(define (empty-list)
  (let ((genturfahi-empty-list (genturfahi* (nunjavni-nil))))
    (empty-list-test genturfahi-empty-list)))

(define (empty-list-peg)
  (let* ((samselpla (call-with-input-file "empty-list.peg" genturfahi-peg))
         (genturfahi-empty-list (genturfahi* (eval samselpla))))
    (empty-list-test genturfahi-empty-list)))

(define (empty-list-test genturfahi-empty-list)
  ; the empty string is zero characters long, so
  ; it always matches.
  ;
  (test '(() "") (genturfahi-empty-list ""))
  (test '(() "a") (genturfahi-empty-list "a"))
  (test '(() "b") (genturfahi-empty-list "b"))
  (test '(() "c") (genturfahi-empty-list "c"))
  (test '(() "abc") (genturfahi-empty-list "abc"))
  0)

(test-group "empty-list"
  (empty-list))

(test-group "empty-list (PEG)"
  (empty-list-peg))
