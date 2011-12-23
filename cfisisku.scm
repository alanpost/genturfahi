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
;;; debug - parser debugging
;;;

(define-values (cfisisku-datni nunjavni-cfisisku)
  (let ((stack '())
        (jalge '()))
    (values
      (lambda ()
        (if (null? jalge) jalge (car jalge)))

      (lambda (cmene javni)
        (define (javni-cfisisku porsi mapti namapti #!rest cmene-sumti)
          (define (push!)
            (set! stack (cons jalge stack))
            (set! jalge '()))

          (define (pop! maptixu)
            (set! jalge `(,@(car stack) (,cmene ,maptixu ,@jalge)))
            (set! stack (cdr stack)))

          (define (mapti-cfisisku porsi nunvalsi)
            (pop! "mapti")
            (mapti porsi nunvalsi))

          (define (namapti-cfisisku porsi)
            (pop! "namapti")
            (namapti porsi))

          (push!)
          (apply javni
                 porsi
                 mapti-cfisisku
                 namapti-cfisisku
                 cmene-sumti))

          javni-cfisisku))))
