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

;; open a string as a lerfu-porsi
;;
(define (make-lerfu-porsi-string lefpoi)
  ;; Append a #\nul to the end of the string as a sentinel.
  (string-append lefpoi (make-string 1 #\nul)))


;; open a port as a lerfu-porsi
;;
;; This procedure uses |copy-octet-port-to-octet-port|,
;; which must be defined in a *-platform.scm file.
;;
(define (make-lerfu-porsi-port iport)
  (define (port->string oport)
    ; copy the input port to a string
    (copy-octet-port-to-octet-port iport oport)

    ; copy a #\nul to the end of the string as a sentinel.
    (write-char #\nul oport)

    ; copy the string from the port
    (get-output-string oport))

  (port->string (open-output-string)))


;; return the remaining characters in the parse input.
;;
(define (lerfu-porsi-string porsi zvati)
  (string-copy porsi
               zvati
               ; skip the sentinel
               (fx- (string-length porsi) 1)))


;; return #t if this |lerfu-porsi| is EOF
;;
(define (lerfu-porsi-fanmo? porsi zvati)
  (eq? (fx+ zvati 1) (string-length porsi)))
