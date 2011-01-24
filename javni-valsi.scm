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
  (val javni-valsi-val*))

(define (javni-nastura? javni)
  (eq? secuxna-nastura javni))

(define (javni-valsi-val javni-valsi)
  (let ((val (javni-valsi-val* javni-valsi)))
    (if (javni-nastura? val)
        '()
        val)))

(define (javni-nunvalsi-val* nunvalsi)
  (javni-valsi-val* (nunvalsi)))

(define (javni-nunvalsi-val nunvalsi)
  (javni-valsi-val (nunvalsi)))

(define (javni-rodanunvalsi-val rodanunvalsi)
  (javni-rodavalsi-val (map (lambda (nunvalsi) (nunvalsi)) rodanunvalsi)))

(define (javni-rodanunvalsi-je-val rodanunvalsi)
  (javni-rodavalsi-je-val (map (lambda (nunvalsi) (nunvalsi)) rodanunvalsi)))

(define (javni-rodavalsi-val rodavalsi)
  (define (vejmina javni-valsi)
    (if (list? javni-valsi)
        (append-map vejmina javni-valsi)
        `(,javni-valsi)))

  (let* ((rodavalsi (append-map vejmina rodavalsi))
         (rodaval   (map javni-valsi-val* rodavalsi)))
    (call-with-values
      ; remove non-structure elements
      (lambda () (partition javni-nastura? rodaval))

      (lambda (nastura jalge)
        (if (null? jalge)
            secuxna-nastura
            jalge)))))

;; A routine used by the nunjavni-je procedure.  It returns
;; a single element if there is only one nastura in the result
;; list.
;;
(define (javni-rodavalsi-je-val rodavalsi)
  (define (vejmina javni-valsi)
    (if (list? javni-valsi)
        (append-map vejmina javni-valsi)
        `(,javni-valsi)))

  (let* ((rodavalsi (append-map vejmina rodavalsi))
         (rodaval   (map javni-valsi-val* rodavalsi)))
    (call-with-values
      ; remove non-structure elements
      (lambda () (partition javni-nastura? rodaval))

      (lambda (nastura jalge)
        ; if we *only* have nastura elements, return
        ; a secuxna-nastura token.
        ;
        ; if there is only one element in the list,
        ; assume the others were secuxna-nastura and
        ; convert the list to a single element.
        ;
        ; otherwise, return the result list.
        ;
        (if (null? jalge)
            secuxna-nastura
            (if (null? (cdr jalge))
                (car jalge)
                jalge))))))

;; A routine used by the nunjavni-samselpla procedure.  It returns
;; a null list rather than a |secuxna-nastura| procedure.
;;
(define (javni-rodavalsi-samselpla-val rodavalsi)
  (define (vejmina javni-valsi)
    (if (list? javni-valsi)
        (append-map vejmina javni-valsi)
        `(,javni-valsi)))

  (let* ((rodavalsi (append-map vejmina rodavalsi))
         (rodaval   (map javni-valsi-val* rodavalsi)))
    (call-with-values
      ; remove non-structure elements
      (lambda () (partition javni-nastura? rodaval))

      (lambda (nastura jalge)
        jalge))))

(define (javni-valsi->string valsi)
  (format "{cmene:~a valsi:~s}"
          (javni-valsi-cme valsi)
          (javni-valsi-val* valsi)))
