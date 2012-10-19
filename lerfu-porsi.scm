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
(define (make-lerfu-porsi-string lefpoi #!key (sentinel #\nul))
  ;; Append a #\nul to the end of the string as a sentinel.
  (string->list (string-append lefpoi (make-string 1 sentinel))))


;; open a port as a lerfu-porsi
;;
;; This procedure uses |copy-octet-port-to-octet-port|,
;; which must be defined in a *-platform.scm file.
;;
(define (make-lerfu-porsi-port iport #!key (sentinel #\nul))
  (define (port->string oport)
    ; copy the input port to a string
    (copy-octet-port-to-octet-port iport oport)

    ; copy a #\nul to the end of the string as a sentinel.
    (write-char sentinel oport)

    ; copy the string from the port
    (get-output-string oport))

  (string->list (port->string (open-output-string))))


;; return the remaining characters in the parse input.
;;
(define (lerfu-porsi-string porsi)
  ; skip the sentinel
  (list->string (drop-right porsi 1)))


;; return #t if this |lerfu-porsi| is EOF
;;
(define (lerfu-porsi-fanmo? porsi)
  (null? (cdr porsi)))

;; a version of span (from srfi-1) that has min/max values
;; and calls continuations rather than returning multiple
;; values.  |pred| also works on lists, rather than elements..
;;
;; basically, this is custom designed to solve a unique problem
;; with the range operator.
;;
(define (span-kuspe pred?
                    porsi
                    mapti
                    namapti
                    #!key (my 0)
                          (ny most-positive-fixnum)
                          (klani 0)
                          (cfari-porsi porsi)
                          (cfari (list '()))
                          (fanmo cfari))
  (if (and (fx< klani ny) (pred? porsi))
      (begin
        (set-cdr! fanmo (list (car porsi)))
        (span-kuspe pred?
                    (cdr porsi)
                    mapti
                    namapti
                    my: my
                    ny: ny
                    klani: (fx+ 1 klani)
                    cfari-porsi: cfari-porsi
                    cfari: cfari
                    fanmo: (cdr fanmo)))
      (if (fx>= klani my)
          (mapti porsi (cdr cfari))
          (namapti cfari-porsi))))
