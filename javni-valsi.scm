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

(define (javni-rodanunvalsi-val nunvalsi)
  (javni-rodavalsi-val (map (lambda (nunvalsi) (nunvalsi)) nunvalsi)))

(define (javni-nunvalsi-val-filter nunvalsi)
  (javni-rodavalsi-val-filter (nunvalsi)))

(define (javni-rodavalsi-val valsi)
  (let ((val (if (javni-valsi? valsi)
                 (javni-valsi-val valsi)
                 (map javni-rodavalsi-val valsi))))
    (if (not (list? val))
        val
        (call-with-values

          ; remove predicate javni-valsi from the list.
          ;
          (lambda () (partition javni-nastura? val))

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
            (if (null? nastura)
                jalge
                (if (null? jalge)
                    secuxna-nastura
                    (if (null? (cdr jalge))
                        (car jalge)
                        jalge))))))))

(define (javni-rodavalsi-val-filter valsi)
  ; if the only result was a predicate marker, return the empty
  ; list instead.
  ;
  (let ((val (javni-rodavalsi-val valsi)))
    (if (javni-nastura? val)
        '()
        val)))

(define (javni-valsi->string valsi)
  (format "{cmene:~a valsi:~s}"
          (javni-valsi-cme valsi)
          (javni-valsi-val valsi)))
