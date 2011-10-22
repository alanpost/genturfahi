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
  (if (javni-nastura? javni-valsi)
      '()
      javni-valsi))

;; When we have multiple incoming valsi, but we're producing a
;; single valsi as a result.
;;
;; XXX: Ok, I have a difference between accepting an incoming
;;      list and that list being a group operator?  Or does this
;;      happen every time I accept a list when there are multiple
;;      incoming words?
;;
(define (javni-rodavalsi rodavalsi)
  (remove javni-nastura? rodavalsi))

;; A routine used by the nunjavni-je, nunjavni-jonai, and nunjavni-?
;; procedures.  It returns a single element if there is only one
;; nastura in the result list.
;;
(define (javni-rodavalsi-je rodavalsi)
  (let* ((jalge (remove javni-nastura? rodavalsi)))
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
            jalge))))

(define (javni-rodavalsi-* rodavalsi)
  (remove javni-nastura? (map javni-rodavalsi-je rodavalsi)))


;; A routine used by the nunjavni-samselpla procedure.  It returns
;; a null list rather than a |secuxna-nastura| procedure.
;;
(define (javni-rodavalsi-samselpla rodavalsi)
  (remove javni-nastura? rodavalsi))

(define (javni-valsi->string valsi)
  (format "{cmene:~a valsi:~s}"
          (javni-valsi-cme valsi)
          (javni-valsi-val* valsi)))
