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
;;; ordered-choice: e_1 / e_2
;;;
;;; jonai <- ,#\a / ,#\b / ,#\c
;;;
(define (jonai)
  (let ((genturfahi-jonai
    (genturfahi* (nunjavni-jonai (nunjavni-lerfu #\a nastura: #f)
                                 (nunjavni-lerfu #\b nastura: #f)
                                 (nunjavni-lerfu #\c nastura: #f)))))
    (jonai-test genturfahi-jonai)))

(define (jonai-peg)
  (let* ((samselpla (call-with-input-file "jonai.peg" genturfahi-peg))
         (genturfahi-jonai (genturfahi* (eval samselpla))))
    (jonai-test genturfahi-jonai)))

(define (jonai-test genturfahi-jonai)
  ; matches (nunjavni-jonai (nunjavni-lerfu #\a) ...)
  ;
  (test '(#\a "") (genturfahi-jonai "a"))

  ; matches (nunjavni-jonai ... (nunjavni-lerfu #\b) ...)
  ;
  (test '(#\b "") (genturfahi-jonai "b"))

  ; matches (nunjavni-jonai ... (nunjavni-lerfu #\c))
  ;
  (test '(#\c "") (genturfahi-jonai "c"))

  ; there is no rule for #\d, no match
  ;
  (test '(#f "d") (genturfahi-jonai "d"))

  ; there is no rule for the emtpy
  ; string, no match
  ;
  (test '(#f "") (genturfahi-jonai ""))

  ; there is no rule for the end-of-file
  ; These match, but they don't parse the
  ; whole buffer!
  ;
  (test '(#\a "a") (genturfahi-jonai "aa"))
  (test '(#\a "b") (genturfahi-jonai "ab"))
  (test '(#\a "c") (genturfahi-jonai "ac"))

  ; later characters that would match
  ; don't if there is no rule to match
  ; earlier characters.
  ;
  ; none of these match.
  ;
  (test '(#f "da") (genturfahi-jonai "da"))
  (test '(#f "db") (genturfahi-jonai "db"))
  (test '(#f "dc") (genturfahi-jonai "dc"))
  0)

(test-group "jonai"
  (jonai))

(test-group "jonai (PEG)"
  (jonai-peg))
