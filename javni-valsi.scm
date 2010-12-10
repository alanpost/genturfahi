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
;;; javni-valsi
;;;
(define-record-type javni-valsi
  (make-javni-valsi cme val)
  javni-valsi?
  (cme javni-valsi-cme)
  (val javni-valsi-val))

(define (javni-nastura? javni)
  (eq? secuxna-nastura javni))

(define (javni-nunvalsi-val nunvalsi)
  (javni-rodavalsi-val (nunvalsi)))

(define (javni-nunvalsi-val-filter nunvalsi)
  (javni-rodavalsi-val-filter (nunvalsi)))

(define (javni-rodavalsi-val valsi)
  (if (javni-valsi? valsi)
      (javni-valsi-val valsi)
      (call-with-values

        ; remove predicate javni-valsi from the list.
        ;
        (lambda () (partition javni-nastura? (map javni-rodavalsi-val valsi)))

        (lambda (nastura jalge)
          ; if there is only a single non-predicate element
          ; in a list that contained predicate elements, 
          ; return the single element rather than a list with
          ; that element.
          ;
          ; If all of the elements were predicate elements,
          ; return a predicate element.  (which will be removed
          ; later.)
          ;
          (if (pair? nastura)
              (if (pair? jalge)
                  (if (null? (cdr jalge))
                      (car jalge)
                      jalge)
                  secuxna-nastura)
              jalge)))))

(define (javni-rodavalsi-val-filter valsi)
  ; if the only result was a predicate marker, don't return it.
  ;
  (if (javni-valsi? valsi)
      (let ((val (javni-valsi-val valsi)))
        (if (javni-nastura? val)
            '()
            val))
      (remove javni-nastura? (map javni-rodavalsi-val valsi))))


(define (javni-valsi->string valsi)
  (format "{cmene:~a valsi:~s}"
          (javni-valsi-cme valsi)
          (javni-valsi-val valsi)))
