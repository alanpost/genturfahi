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
;;; ordered sequence
;;;
;;; je   <- ( a b `c / x y `z ) `x -> test-je-quote-samselpla
;;; a    <- ,#\a                   -> test-je-quote-lerfu
;;; b    <- ,#\b                   -> test-je-quote-lerfu
;;; c    <- ,#\c                   -> test-je-quote-lerfu
;;; x    <- ,#\x                   -> test-je-quote-lerfu
;;; y    <- ,#\y                   -> test-je-quote-lerfu
;;; z    <- ,#\z                   -> test-je-quote-lerfu
;;;

(define (test-je-quote-samselpla pamoi remoi)
  `(,pamoi ,remoi))

(define (test-je-quote-lerfu lerfu)
  lerfu)

(define (je-quote)
  (let ((genturfahi-je-quote
    (letrec ((gerna
      (let ()
        (define je-7
          (nunjavni-secuxna
            (lambda () "je")
            (lambda (porsi zvati mapti namapti)
              (je-8 porsi zvati mapti namapti))))
        (define a-1
          (nunjavni-secuxna
            (lambda () "a")
            (lambda (porsi zvati mapti namapti)
              (a-9 porsi zvati mapti namapti))))
        (define b-2
          (nunjavni-secuxna
            (lambda () "b")
            (lambda (porsi zvati mapti namapti)
              (b-10 porsi zvati mapti namapti))))
        (define c-3
          (nunjavni-secuxna
            (lambda () "c")
            (lambda (porsi zvati mapti namapti)
              (c-11 porsi zvati mapti namapti))))
        (define x-4
          (nunjavni-secuxna
            (lambda () "x")
            (lambda (porsi zvati mapti namapti)
              (x-12 porsi zvati mapti namapti))))
        (define y-5
          (nunjavni-secuxna
            (lambda () "y")
            (lambda (porsi zvati mapti namapti)
              (y-13 porsi zvati mapti namapti))))
        (define z-6
          (nunjavni-secuxna
            (lambda () "z")
            (lambda (porsi zvati mapti namapti)
              (z-14 porsi zvati mapti namapti))))
        (define je-8
          (nunjavni-morji
            (morji-nunjavni-samselpla
              test-je-quote-samselpla
              (morji-nunjavni-je
                (list (morji-nunjavni-jonai
                        (list (morji-nunjavni-je
                                (list a-1 b-2 (morji-nunjavni-nastura c-3))
                                porjahe:
                                #t)
                              (morji-nunjavni-je
                                (list x-4 y-5 (morji-nunjavni-nastura z-6))
                                porjahe:
                                #t))
                        porsumti:
                        #t
                        porjahe:
                        #t)
                      (morji-nunjavni-nastura x-4 porjahe: #t))
                porsumti:
                #t
                porjahe:
                #t))))
        (define a-9
          (nunjavni-morji
            (morji-nunjavni-samselpla
              test-je-quote-lerfu
              (morji-nunjavni-lerfu #\a nastura: #f porjahe: #t))))
        (define b-10
          (nunjavni-morji
            (morji-nunjavni-samselpla
              test-je-quote-lerfu
              (morji-nunjavni-lerfu #\b nastura: #f porjahe: #t))))
        (define c-11
          (nunjavni-morji
            (morji-nunjavni-samselpla
              test-je-quote-lerfu
              (morji-nunjavni-lerfu #\c nastura: #f porjahe: #t))))
        (define x-12
          (nunjavni-morji
            (morji-nunjavni-samselpla
              test-je-quote-lerfu
              (morji-nunjavni-lerfu #\x nastura: #f porjahe: #t))))
        (define y-13
          (nunjavni-morji
            (morji-nunjavni-samselpla
              test-je-quote-lerfu
              (morji-nunjavni-lerfu #\y nastura: #f porjahe: #t))))
        (define z-14
          (nunjavni-morji
            (morji-nunjavni-samselpla
              test-je-quote-lerfu
              (morji-nunjavni-lerfu #\z nastura: #f porjahe: #t))))
        (tolmohi-nunjavni)
        je-7)))
          (genturfahi* gerna))))
    (je-quote-test genturfahi-je-quote)))

(define (je-quote-peg)
  (let* ((samselpla (call-with-input-file "je-quote.peg" genturfahi-peg))
         (genturfahi-je-quote (genturfahi* (eval samselpla))))
    (je-quote-test genturfahi-je-quote)))

(define (je-quote-test genturfahi-je-quote)
  ; matches each lerfu in sequence 
  ;
  (test '((#\a #\b) "") (genturfahi-je-quote "abcx"))
  (test '((#\x #\y) "") (genturfahi-je-quote "xyzx"))
  0)

(test-group "je-quote"
  (je-quote))

(test-group "je-quote (PEG)"
  (je-quote-peg))
