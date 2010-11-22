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
;;; regular expression:
;;;
;;; gerna <- (digit / alpha)* FAhO
;;; digit <- [:digit:]+
;;; alpha <- [:alpha:]+
;;; FAhO  <- !.
;;;
(define (test-samselpla-re #!key gerna)
  gerna)

(define (re)
  (let ((genturfahi-re
    (letrec
      ((gerna (nunjavni-morji
                (nunjavni-samselpla
                  test-samselpla-re
                  (nunjavni-je
                    (nunjavni-*
                      (nunjavni-jonai
                        (nunjavni-naselci digit)
                        (nunjavni-naselci alpha))
                      cmene: "gerna")
                    (nunjavni-fanmo)))))
       (digit (nunjavni-morji
                (nunjavni-re "[0-9]+")))
       (alpha (nunjavni-morji
                (nunjavni-re "[A-Za-z]+")))
       (FAhO  (nunjavni-morji
                (nunjavni-fanmo))))
      (genturfahi* gerna))))
  (re-test genturfahi-re)))

(define (re-read)
  (let* ((samselpla
          (call-with-input-file "re.peg" genturfahi-peg))
         (port
          (with-output-to-string (lambda () (write samselpla))))
         (genturfahi-re
          (genturfahi* (eval (call-with-input-string port read)))))
    (re-test genturfahi-re)))

(define (re-peg)
  (let* ((samselpla
         (call-with-input-file "re.peg" genturfahi-peg))
         (genturfahi-re
          (genturfahi* (eval samselpla))))
    (re-test genturfahi-re)))

(define (re-test genturfahi-re)
  (test '(("a") "") (genturfahi-re "a"))
  (test '(("b") "") (genturfahi-re "b"))
  (test '(("c") "") (genturfahi-re "c"))
  (test '(("x") "") (genturfahi-re "x"))
  (test '(("y") "") (genturfahi-re "y"))
  (test '(("z") "") (genturfahi-re "z"))

  (test '(("A") "") (genturfahi-re "A"))
  (test '(("B") "") (genturfahi-re "B"))
  (test '(("C") "") (genturfahi-re "C"))
  (test '(("X") "") (genturfahi-re "X"))
  (test '(("Y") "") (genturfahi-re "Y"))
  (test '(("Z") "") (genturfahi-re "Z"))

  (test '(("0") "") (genturfahi-re "0"))
  (test '(("1") "") (genturfahi-re "1"))
  (test '(("2") "") (genturfahi-re "2"))
  (test '(("3") "") (genturfahi-re "3"))
  (test '(("4") "") (genturfahi-re "4"))
  (test '(("5") "") (genturfahi-re "5"))
  (test '(("6") "") (genturfahi-re "6"))
  (test '(("7") "") (genturfahi-re "7"))
  (test '(("8") "") (genturfahi-re "8"))
  (test '(("9") "") (genturfahi-re "9"))

  (test '(("0123456789")   "") (genturfahi-re "0123456789"))
  (test '(("abcxyzABCXYZ") "") (genturfahi-re "abcxyzABCXYZ"))

  (test '(("abcxyzABCXYZ"
           "0123456789")   "") (genturfahi-re "abcxyzABCXYZ0123456789"))

  (test '(("abc" "123" "XYZ")    "") (genturfahi-re "abc123XYZ"))

  (test '(() "") (genturfahi-re ""))
  0)

(test-group "re"
  (re))

(test-group "re (read)"
  (re-read))

(test-group "re (PEG)"
  (re-peg))
