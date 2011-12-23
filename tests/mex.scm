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
    (letrec ((gerna
      (let ()
      (define expr-4
        (nunjavni-secuxna
          (lambda () "expr")
          (lambda (porsi mapti namapti)
            (expr-5 porsi mapti namapti))))
      (define mulexp-1
        (nunjavni-secuxna
          (lambda () "mulexp")
          (lambda (porsi mapti namapti)
            (mulexp-6 porsi mapti namapti))))
      (define simple-2
        (nunjavni-secuxna
          (lambda () "simple")
          (lambda (porsi mapti namapti)
            (simple-7 porsi mapti namapti))))
      (define digits-3
        (nunjavni-secuxna
          (lambda () "digits")
          (lambda (porsi mapti namapti)
            (digits-8 porsi mapti namapti))))
      (define expr-5
        (nunjavni-morji
          (morji-nunjavni-jonai
            (list (morji-nunjavni-samselpla
                    test-samselpla-+
                    (morji-nunjavni-je
                      (list (morji-nunjavni-cmene mulexp-1 cmene: "a")
                            (morji-nunjavni-lerfu #\+)
                            (morji-nunjavni-cmene mulexp-1 cmene: "b"))
                      porjahe:
                      #t))
                  mulexp-1))))
      (define mulexp-6
        (nunjavni-morji
          (morji-nunjavni-jonai
            (list (morji-nunjavni-samselpla
                    test-samselpla-*
                    (morji-nunjavni-je
                      (list (morji-nunjavni-cmene simple-2 cmene: "a")
                            (morji-nunjavni-lerfu #\*)
                            (morji-nunjavni-cmene simple-2 cmene: "b"))
                      porjahe:
                      #t))
                  simple-2))))
      (define simple-7
        (nunjavni-morji
          (morji-nunjavni-jonai
            (list digits-3
                  (morji-nunjavni-samselpla
                    test-samselpla-simple
                    (morji-nunjavni-je
                      (list (morji-nunjavni-lerfu #\()
                            (morji-nunjavni-cmene expr-4 cmene: "expr")
                            (morji-nunjavni-lerfu #\)))
                      porjahe:
                      #t))))))
      (define digits-8
        (nunjavni-morji
          (morji-nunjavni-samselpla
            test-samselpla-digits
            (morji-nunjavni-char-set-+ char-set:digit cmene: "x" porjahe: #t))))
      (tolmohi-nunjavni)
      (nunjavni-secuxna (lambda () "expr") expr-5))))
    (genturfahi gerna))))
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
