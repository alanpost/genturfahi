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
;;; lerfu-porsi
;;;
(define-record-type lerfu-porsi
  (make-lerfu-porsi zva poi)
  lerfu-porsi?
  ; the location within |poi|.
  (zva lerfu-porsi-zva)
  ; the lerfu porsi
  (poi lerfu-porsi-poi))


;; open a string as a lerfu-porsi
;;
(define (make-lerfu-porsi-string lefpoi)
  ;; Append a #\nul to the end of the string as a sentinel.
  (let ((poi (string-append lefpoi (make-string 1 #\nul))))
    (make-lerfu-porsi 0 poi)))


;; open a port as a lerfu-porsi
;;
;; This procedure uses |call-with-input-string|,
;; |call-with-output-string| and |copy-port|, all
;; of which are (Chicken Scheme) extensions to
;; R5RS ports and srfi-6.
;;
(define (make-lerfu-porsi-port iport)
  (define (port->string oport)
    (define (eof->string nport)
      ; copy a #\nul to the end of the string as a sentinel.
      (copy-port nport oport))

    ; copy the input port to a string
    (copy-port iport oport)

    ; append the sentinel
    (call-with-input-string (make-string 1 #\nul) eof->string)

    ; copy the string from the port
    (get-output-string oport))

  (make-lerfu-porsi 0 (call-with-output-string port->string)))


;; return the remaining characters in the parse input.
;;
(define (lerfu-porsi-string porsi)
  (let ((poi (lerfu-porsi-poi porsi)))
    (string-copy poi
                 (lerfu-porsi-zva porsi)
                 ; skip the sentinel
                 (- (string-length poi) 1))))


;; return a new lerfu-porsi with the position advanced one
;; lerfu.
;;
(define (make-lerfu-porsi-pabalvi-lerfu porsi)
  (let ((zva (lerfu-porsi-zva porsi))
        (poi (lerfu-porsi-poi porsi)))
    ; create a new lerfu-porsi incrementing |zva| by |1|.
    (make-lerfu-porsi (+ zva 1) poi)))


;; return a new lerfu-porsi with the position advanced by
;; the length of the string.
;;
(define (make-lerfu-porsi-pabalvi-valsi porsi nilcla)
  (let ((zva (lerfu-porsi-zva porsi))
        (poi (lerfu-porsi-poi porsi)))
    ; create a new lerfu-porsi incrementing |zva| by
    ; |nilcla|
    (make-lerfu-porsi (+ zva nilcla) poi)))


;; convert a lerfu-porsi to a string.
;;
(define (lerfu-porsi->string porsi)
  (format "{se zvati:~a porsi:~s}"
          (lerfu-porsi-zva porsi)
          (lerfu-porsi-poi porsi)))


;; return the character at the current position in this
;; |lerfu-porsi|.
;;
(define (lerfu-porsi-lerfu porsi)
  (let ((zva (lerfu-porsi-zva porsi))
        (poi (lerfu-porsi-poi porsi)))
  (string-ref poi zva)))


;; return #t if this |lerfu-porsi| is EOF
;;
(define (lerfu-porsi-fanmo? porsi)
  (eq? (+ (lerfu-porsi-zva porsi) 1)
       (string-length (lerfu-porsi-poi porsi))))
