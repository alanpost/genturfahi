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
;;; ordered choice with non-terminals
;;; this test is identical to the ordered choice file, though the
;;; grammar differs.
;;;
;;; jonai <- a / b / c
;;; a     <- !#\e !#\i !#\o !#\u ,#\a
;;; b     <- &#\b ,#\b
;;; c     <- &#\c ,#\c
;;;
(define (jonai-naselci)
  (let ((genturfahi-jonai-naselci
    (letrec ((gerna
               (nunjavni-morji
                 (nunjavni-jonai (lambda (porsi mapti namapti)
                                   (a porsi mapti namapti))
                                 (lambda (porsi mapti namapti)
                                   (b porsi mapti namapti))
                                 (lambda (porsi mapti namapti)
                                   (c porsi mapti namapti)))))
             (a (nunjavni-morji
                  (nunjavni-je
                    (nunjavni-! (nunjavni-lerfu #\e))
                    (nunjavni-! (nunjavni-lerfu #\i))
                    (nunjavni-! (nunjavni-lerfu #\o))
                    (nunjavni-! (nunjavni-lerfu #\u))
                    (nunjavni-lerfu #\a nastura: #f))))
             (b (nunjavni-morji
                  (nunjavni-je
                    (nunjavni-& (nunjavni-lerfu #\b))
                    (nunjavni-lerfu #\b nastura: #f))))
             (c (nunjavni-morji
                  (nunjavni-je
                    (nunjavni-& (nunjavni-lerfu #\c))
                    (nunjavni-lerfu #\c nastura: #f)))))
      (genturfahi* gerna))))
    (jonai-naselci-test genturfahi-jonai-naselci)))

(define (jonai-naselci-peg)
  (let* ((samselpla (call-with-input-file "jonai-naselci.peg" genturfahi-peg))
         (genturfahi-jonai-naselci (genturfahi* (eval samselpla))))
    (jonai-naselci-test genturfahi-jonai-naselci)))

(define (jonai-naselci-test genturfahi-jonai-naselci)
  ; matches (nunjavni-jonai-naselci (nunjavni-lerfu #\a) ...)
  ;
  (test '(#\a "") (genturfahi-jonai-naselci "a"))

  ; matches (nunjavni-jonai-naselci ... (nunjavni-lerfu #\b) ...)
  ;
  (test '(#\b "") (genturfahi-jonai-naselci "b"))

  ; matches (nunjavni-jonai-naselci ... (nunjavni-lerfu #\c))
  ;
  (test '(#\c "") (genturfahi-jonai-naselci "c"))

  ; there is no rule for #\d, no match
  ;
  (test '(#f "d") (genturfahi-jonai-naselci "d"))

  ; there is no rule for the emtpy
  ; string, no match
  ;
  (test '(#f "") (genturfahi-jonai-naselci ""))

  ; there is no rule for the end-of-file
  ; These match, but they don't parse the
  ; whole buffer!
  ;
  (test '(#\a "a") (genturfahi-jonai-naselci "aa"))
  (test '(#\a "b") (genturfahi-jonai-naselci "ab"))
  (test '(#\a "c") (genturfahi-jonai-naselci "ac"))

  ; later characters that would match
  ; don't if there is no rule to match
  ; earlier characters.
  ;
  ; none of these match.
  ;
  (test '(#f "da") (genturfahi-jonai-naselci "da"))
  (test '(#f "db") (genturfahi-jonai-naselci "db"))
  (test '(#f "dc") (genturfahi-jonai-naselci "dc"))
  0)

(test-group "jonai naselci"
  (jonai-naselci))

(test-group "jonai naselci (PEG)"
  (jonai-naselci-peg))
