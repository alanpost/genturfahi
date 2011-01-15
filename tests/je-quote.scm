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
;;; je <- ( abc / xyz ) `xyz -> test-je-quote-samselpla
;;; abc  <- a b `c           -> test-je-quote-rodalerfu
;;; a    <- ,#\a             -> test-je-quote-lerfu
;;; b    <- ,#\b             -> test-je-quote-lerfu
;;; c    <- ,#\c             -> test-je-quote-lerfu
;;; xyz  <- x y `z           -> test-je-quote-rodalerfu
;;; x    <- ,#\x             -> test-je-quote-lerfu
;;; y    <- ,#\y             -> test-je-quote-lerfu
;;; z    <- ,#\z             -> test-je-quote-lerfu
;;;

(define (test-je-quote-samselpla abc-or-xyz)
  abc-or-xyz)

(define (test-je-quote-rodalerfu pamoi remoi)
  `(,pamoi ,remoi))

(define (test-je-quote-lerfu lerfu)
  lerfu)

(define (je-quote)
  (let ((genturfahi-je-quote
    (letrec ((gerna
               (nunjavni-morji
                 (nunjavni-samselpla
                   test-je-quote-samselpla
                   (nunjavni-je
                     (nunjavni-jonai
                       (lambda (porsi mapti namapti)
                         (abc porsi mapti namapti))
                       (lambda (porsi mapti namapti)
                         (xyz porsi mapti namapti)))
                     (nunjavni-nastura
                       (lambda (porsi mapti namapti)
                         (xyz porsi mapti namapti)))))))
             (abc (nunjavni-morji
                    (nunjavni-samselpla
                      test-je-quote-rodalerfu
                      (nunjavni-je
                        (lambda (porsi mapti namapti)
                          (a porsi mapti namapti))
                        (lambda (porsi mapti namapti)
                          (b porsi mapti namapti))
                        (nunjavni-nastura
                          (lambda (porsi mapti namapti)
                            (c porsi mapti namapti)))))))
             (a   (nunjavni-morji
                    (nunjavni-samselpla
                      test-je-quote-lerfu
                      (nunjavni-lerfu #\a nastura: #f))))
             (b   (nunjavni-morji
                    (nunjavni-samselpla
                      test-je-quote-lerfu
                      (nunjavni-lerfu #\b nastura: #f))))
             (c   (nunjavni-morji
                    (nunjavni-samselpla
                      test-je-quote-lerfu
                      (nunjavni-lerfu #\c nastura: #f))))
             (xyz (nunjavni-morji
                    (nunjavni-samselpla
                      test-je-quote-rodalerfu
                      (nunjavni-je
                        (lambda (porsi mapti namapti)
                          (x porsi mapti namapti))
                        (lambda (porsi mapti namapti)
                          (y porsi mapti namapti))
                        (nunjavni-nastura
                          (lambda (porsi mapti namapti)
                            (z porsi mapti namapti)))))))
             (x   (nunjavni-morji
                    (nunjavni-samselpla
                      test-je-quote-lerfu
                      (nunjavni-lerfu #\x nastura: #f))))
             (y   (nunjavni-morji
                    (nunjavni-samselpla
                      test-je-quote-lerfu
                      (nunjavni-lerfu #\y nastura: #f))))
             (z   (nunjavni-morji
                    (nunjavni-samselpla
                      test-je-quote-lerfu
                      (nunjavni-lerfu #\z nastura: #f)))))
      (genturfahi* gerna))))
    (je-quote-test genturfahi-je-quote)))

(define (je-quote-peg)
  (let* ((samselpla (call-with-input-file "je-quote.peg" genturfahi-peg))
         (genturfahi-je-quote (genturfahi* (eval samselpla))))
    (je-quote-test genturfahi-je-quote)))

(define (je-quote-test genturfahi-je-quote)
  ; matches each lerfu in sequence 
  ;
  (test '((#\a #\b) "") (genturfahi-je-quote "abcxyz"))
  (test '((#\x #\y) "") (genturfahi-je-quote "xyzxyz"))
  0)

(test-group "je-quote"
  (je-quote))

(test-group "je-quote (PEG)"
  (je-quote-peg))
