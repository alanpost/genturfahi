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
;;; This example appeared in chicken gazette #5 as the example for
;;; the packrat parser module:
;;;
;;;  http://gazette.call-cc.org/issues/5.html
;;;
;;; It is here ported to genturfa'i.
;;;
;;; expr   <- mulexp + mulexp
;;;         / mulexp
;;; mulexp <- simple * simple
;;;         / simple
;;; simple <- digits
;;;         / #\( expr #\)
;;; digits <- [:digit:]+

(define (test-samselpla-+ #!key a b)
  (+ a b))

(define (test-samselpla-* #!key a b)
  (* a b))

(define (test-samselpla-simple #!key expr)
  expr)

(define (test-samselpla-digits #!key x)
  (string->number x))

(define (mex)
  (let ((genturfahi-mex
    (letrec
      ((expr   (nunjavni-morji
                 (nunjavni-jonai
                   (nunjavni-samselpla
                     test-samselpla-+
                     (nunjavni-je
                       (nunjavni-cmene
                         (lambda (porsi mapti namapti)
                           (mulexp porsi mapti namapti))
                         cmene: "a")
                       (nunjavni-lerfu #\+)
                       (nunjavni-cmene
                         (lambda (porsi mapti namapti)
                           (mulexp porsi mapti namapti))
                         cmene: "b")))
                   (lambda (porsi mapti namapti)
                     (mulexp porsi mapti namapti)))))
       (mulexp (nunjavni-morji
                 (nunjavni-jonai
                   (nunjavni-samselpla
                     test-samselpla-*
                     (nunjavni-je
                       (nunjavni-cmene
                         (lambda (porsi mapti namapti)
                           (simple porsi mapti namapti))
                         cmene: "a")
                       (nunjavni-lerfu #\*)
                       (nunjavni-cmene
                         (lambda (porsi mapti namapti)
                           (simple porsi mapti namapti))
                         cmene: "b")))
                   (lambda (porsi mapti namapti)
                     (simple porsi mapti namapti)))))
       (simple (nunjavni-morji
                 (nunjavni-jonai
                   (lambda (porsi mapti namapti)
                     (digits porsi mapti namapti))
                   (nunjavni-samselpla
                     test-samselpla-simple
                     (nunjavni-je
                       (nunjavni-lerfu #\()
                       (nunjavni-cmene
                         (lambda (porsi mapti namapti)
                           (expr porsi mapti namapti))
                         cmene: "expr")
                       (nunjavni-lerfu #\)))))))
       (digits (nunjavni-morji
                 (nunjavni-samselpla
                   test-samselpla-digits
                   (nunjavni-char-set-+ char-set:digit cmene: "x")))))
      (genturfahi expr))))
  (mex-test genturfahi-mex)))

(define (mex-read)
  (let* ((samselpla
          (call-with-input-file "mex.peg" genturfahi-peg))
         (port
          (with-output-to-string (lambda () (write samselpla))))
         (genturfahi-mex
          (genturfahi (eval (call-with-input-string port read)))))
    (mex-test genturfahi-mex)))

(define (mex-peg)
  (let* ((samselpla
         (call-with-input-file "mex.peg" genturfahi-peg))
         (genturfahi-mex
          (genturfahi (eval samselpla))))
    (mex-test genturfahi-mex)))

(define (mex-test genturfahi-mex)
    (test 2  (genturfahi-mex "2"))
    (test 22 (genturfahi-mex "22"))
    (test 4  (genturfahi-mex "2*2"))
    (test 4  (genturfahi-mex "2+2"))
    (test 16 (genturfahi-mex "2+2*7"))
    (test 28 (genturfahi-mex "(2+2)*7"))
    (test 42 (genturfahi-mex "3*4+5*6"))
    0)

(test-group "mex"
  (mex))

(test-group "mex (read)"
  (mex-read))

(test-group "mex (PEG)"
  (mex-peg))
