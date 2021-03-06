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
;;; execute code on syntax tree.
;;;
;;; gerna <- a b c
;;; a     <- ,#\a
;;; b     <- ,"b"
;;; c     <- [c]
;;;
(define (test-samselpla-samselpla b #!key a c)
  (string-append a b c))

(define (test-samselpla-valsi valsi)
  valsi)

(define (test-samselpla-lerfu lerfu)
  (make-string 1 lerfu))

(define (samselpla)
  (let ((genturfahi-samselpla
    (letrec ((gerna (nunjavni-morji
               ; concatenate the strings
               (nunjavni-samselpla
                 test-samselpla-samselpla
                 (nunjavni-je
                   (list (nunjavni-cmene
                           (lambda (porsi mapti namapti)
                             (a porsi mapti namapti))
                           cmene: "a")
                         (lambda (porsi mapti namapti)
                           (b porsi mapti namapti))
                         (nunjavni-cmene
                           (lambda (porsi mapti namapti)
                             (c porsi mapti namapti))
                           cmene: "c"))
                   porjahe: #t))))
             (a (nunjavni-morji
               ; convert each character to a string.
               (nunjavni-samselpla test-samselpla-lerfu
                 (nunjavni-lerfu #\a nastura: #f porjahe: #t))))
             (b (nunjavni-morji
               (nunjavni-samselpla test-samselpla-valsi
                 (nunjavni-valsi "b" nastura: #f porjahe: #t))))
             (c (nunjavni-morji
               (nunjavni-samselpla test-samselpla-lerfu
                 (nunjavni-char-set (char-set #\c) porjahe: #t)))))
      (genturfahi* gerna))))
    (samselpla-test genturfahi-samselpla)))

(define (samselpla-peg)
  (let* ((samselpla (call-with-input-file "samselpla.peg" genturfahi-peg))
         (genturfahi-samselpla (genturfahi* (eval samselpla))))
    (samselpla-test genturfahi-samselpla)))

(define (samselpla-test genturfahi-samselpla)
  ; The code runs only after a a syntax tree is successfully
  ; generated.
  ;
  (genturfahi-samselpla "abc")

  (test '("abc" "") (genturfahi-samselpla "abc"))

  ; It doesn't run at all if we fail to parse.
  ;
  (test '(#f "d") (genturfahi-samselpla "d"))

  ; Even if the parse partially matches before failing.
  ;
  (test '(#f "a") (genturfahi-samselpla "a"))
  (test '(#f "ab") (genturfahi-samselpla "ab"))

  ; But if we don't parse all of the input, that
  ; is a valid parse.
  ;
  (test '("abc" "a") (genturfahi-samselpla "abca"))
  (test '("abc" "b") (genturfahi-samselpla "abcb"))
  (test '("abc" "c") (genturfahi-samselpla "abcc"))
  0)

(test-group "samselpla"
  (samselpla))

(test-group "samselpla (PEG)"
  (samselpla-peg))
