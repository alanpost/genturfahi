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

; for splicing a grouped operator into a list
; that otherwise contains non-tree modifying
; operations.
;
(define-record-type javni-girzu
  (make-javni-girzu val)
  javni-girzu?
  (val javni-girzu-val))

(define (javni-nastura? javni)
  (eq? secuxna-nastura javni))

(define (javni-nunvalsi-pa-val nunvalsi)
  (javni-rodavalsi-pa-val (nunvalsi)))

(define (javni-nunvalsi-suhore-val nunvalsi)
  (javni-rodavalsi-suhore-val (nunvalsi)))

(define (javni-rodanunvalsi-pa-val nunvalsi)
  (javni-rodavalsi-pa-val (map (lambda (nunvalsi) (nunvalsi)) nunvalsi)))

(define (javni-nunvalsi-pa-val-filter nunvalsi)
  (javni-rodavalsi-pa-val-filter (nunvalsi)))

(define (javni-rodavalsi-pa-val valsi)
  (let ((val (if (javni-valsi? valsi)
                 (javni-valsi-val valsi)
                 (map javni-rodavalsi-pa-val valsi))))
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

(define (javni-rodavalsi-suhore-val valsi)
  (let ((val (if (javni-valsi? valsi)
                 (let ((val (javni-valsi-val valsi)))
                   (if (list? val) val (list val)))
                 (map javni-rodavalsi-pa-val valsi))))
    (call-with-values

      ; remove predicate javni-valsi from the list.
      ;
      (lambda () (partition javni-nastura? val))

      (lambda (nastura jalge)
        (define (vejmina val)
          (if (javni-girzu? val)
              (javni-girzu-val val)
              `(,val)))

        ; splice any group operators and append other
        ; lists to create the result.
        ;
        (append-map vejmina jalge)))))

(define (javni-rodavalsi-pa-val-filter valsi)
  (define (vejmina val)
    (if (javni-girzu? val)
        (javni-girzu-val val)
        `(,val)))

  (define (girzu valsi)
    (let ((val (javni-girzu-val valsi)))
      (if (null? (cdr val))
          (car val)
          val)))

  (let ((val (javni-rodavalsi-pa-val valsi)))
           ; if the only result was a predicate marker, return the empty
           ; list instead.
           ;
    (cond ((javni-nastura? val) '())
           ; if we have a javni-girzu, fetch it's value.
           ;
          ((javni-girzu?   val) (girzu val))
          ((list?          val) (append-map vejmina val))
          (else                 val))))

(define (javni-valsi->string valsi)
  (format "{cmene:~a valsi:~s}"
          (javni-valsi-cme valsi)
          (javni-valsi-val valsi)))
