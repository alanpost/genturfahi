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
;;; character classes:
;;;
;;; gerna <- (digit / alpha)* `FAhO
;;; digit <- [:digit:]+
;;; alpha <- [:alpha:]+
;;; FAhO  <- !.
;;;
(define (lerfu-klesi)
  (let ((genturfahi-lerfu-klesi
    (letrec ((gerna
      (let ()
        (define gerna-4
          (nunjavni-secuxna
            (lambda () "gerna")
            (lambda (porsi mapti namapti)
              (gerna-5 porsi mapti namapti))))
        (define digit-1
          (nunjavni-secuxna
            (lambda () "digit")
            (lambda (porsi mapti namapti)
              (digit-6 porsi mapti namapti))))
        (define alpha-2
          (nunjavni-secuxna
            (lambda () "alpha")
            (lambda (porsi mapti namapti)
              (alpha-7 porsi mapti namapti))))
        (define FAhO-3
          (nunjavni-secuxna
            (lambda () "FAhO")
            (lambda (porsi mapti namapti)
              (FAhO-8 porsi mapti namapti))))
        (define gerna-5
          (nunjavni-morji
            (morji-nunjavni-je
              (list (morji-nunjavni-*
                      (morji-nunjavni-jonai
                        (list (morji-nunjavni-porjahe digit-1)
                              (morji-nunjavni-porjahe alpha-2))
                        porsumti:
                        #t
                        porjahe:
                        #t)
                      porsumti:
                      #t
                      porjahe:
                      #t)
                    (morji-nunjavni-porjahe FAhO-3))
              porsumti:
              #t)))
        (define digit-6
          (nunjavni-morji (morji-nunjavni-char-set-+ char-set:digit)))
        (define alpha-7
          (nunjavni-morji (morji-nunjavni-char-set-+ char-set:letter)))
        (define FAhO-8 (morji-nunjavni-fanmo))
        (tolmohi-nunjavni)
        gerna-4)))
      (genturfahi* gerna))))
    (lerfu-klesi-test genturfahi-lerfu-klesi)))

(define (lerfu-klesi-read)
  (let* ((samselpla
          (call-with-input-file "lerfu-klesi.peg" genturfahi-peg))
         (port
          (with-output-to-string (lambda () (write samselpla))))
         (genturfahi-lerfu-klesi
          (genturfahi* (eval (call-with-input-string port read)))))
    (lerfu-klesi-test genturfahi-lerfu-klesi)))

(define (lerfu-klesi-peg)
  (let* ((samselpla
         (call-with-input-file "lerfu-klesi.peg" genturfahi-peg))
         (genturfahi-lerfu-klesi
          (genturfahi* (eval samselpla))))
    (lerfu-klesi-test genturfahi-lerfu-klesi)))

(define (lerfu-klesi-test genturfahi-lerfu-klesi)
  (test '(("a") "") (genturfahi-lerfu-klesi "a"))
  (test '(("b") "") (genturfahi-lerfu-klesi "b"))
  (test '(("c") "") (genturfahi-lerfu-klesi "c"))
  (test '(("x") "") (genturfahi-lerfu-klesi "x"))
  (test '(("y") "") (genturfahi-lerfu-klesi "y"))
  (test '(("z") "") (genturfahi-lerfu-klesi "z"))

  (test '(("A") "") (genturfahi-lerfu-klesi "A"))
  (test '(("B") "") (genturfahi-lerfu-klesi "B"))
  (test '(("C") "") (genturfahi-lerfu-klesi "C"))
  (test '(("X") "") (genturfahi-lerfu-klesi "X"))
  (test '(("Y") "") (genturfahi-lerfu-klesi "Y"))
  (test '(("Z") "") (genturfahi-lerfu-klesi "Z"))

  (test '(("0") "") (genturfahi-lerfu-klesi "0"))
  (test '(("1") "") (genturfahi-lerfu-klesi "1"))
  (test '(("2") "") (genturfahi-lerfu-klesi "2"))
  (test '(("3") "") (genturfahi-lerfu-klesi "3"))
  (test '(("4") "") (genturfahi-lerfu-klesi "4"))
  (test '(("5") "") (genturfahi-lerfu-klesi "5"))
  (test '(("6") "") (genturfahi-lerfu-klesi "6"))
  (test '(("7") "") (genturfahi-lerfu-klesi "7"))
  (test '(("8") "") (genturfahi-lerfu-klesi "8"))
  (test '(("9") "") (genturfahi-lerfu-klesi "9"))

  (test '(("0123456789")   "") (genturfahi-lerfu-klesi "0123456789"))
  (test '(("abcxyzABCXYZ") "") (genturfahi-lerfu-klesi "abcxyzABCXYZ"))

  (test '(("abcxyzABCXYZ"
           "0123456789")   "") (genturfahi-lerfu-klesi
                                 "abcxyzABCXYZ0123456789"))

  (test '(("abc" "123" "XYZ")    "") (genturfahi-lerfu-klesi "abc123XYZ"))

  (test '(() "") (genturfahi-lerfu-klesi ""))
  0)

(test-group "lerfu-klesi"
  (lerfu-klesi))

(test-group "lerfu-klesi (read)"
  (lerfu-klesi-read))

(test-group "lerfu-klesi (PEG)"
  (lerfu-klesi-peg))
