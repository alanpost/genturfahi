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
;;; nunvalsi - valsi generators
;;;

;; merge a single nunvalsi with or without a cmene
;;
(define (venunjmina-nunvalsi cmene)
  (if cmene
      (lambda (nunvalsi)
        (vejmina-nunvalsi cmene nunvalsi))
      (lambda (nunvalsi)
        (vejmina-nunvalsi-nacmene nunvalsi))))

(define (vejmina-nunvalsi cmene nunvalsi)
  (lambda ()
    (make-javni-valsi cmene (javni-nunvalsi-val nunvalsi))))

(define (vejmina-nunvalsi-nacmene nunvalsi)
  nunvalsi)


;; merge multiple nunvalsi with or without a cmene
;;
(define (venunjmina-rodanunvalsi cmene)
  (if cmene
      (lambda (rodanunvalsi)
        (apply vejmina-rodanunvalsi cmene rodanunvalsi))
      (lambda (rodanunvalsi)
        (apply vejmina-rodanunvalsi-nacmene rodanunvalsi))))


;; with a cmene, the list of results is associated with a single
;; javni-valsi.
;;
(define (vejmina-rodanunvalsi cmene . rodanunvalsi)
  (lambda ()
    (make-javni-valsi cmene (map javni-nunvalsi-val rodanunvalsi))))

;; with no cmene, return a list of results
;;
(define (vejmina-rodanunvalsi-nacmene . rodanunvalsi)
  (lambda ()
    (map (lambda (nunvalsi) (nunvalsi)) rodanunvalsi)))
