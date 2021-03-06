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

(define (string-escape-peg)
  (let* ((samselpla (call-with-input-file "string-escape.peg" genturfahi-peg))
         (genturfahi-string-escape
           ;
           ; set a non-#\nul sentinel character, as this grammar
           ; has a nul in it, and the sentinel character must
           ; be a character that does not appear in a valid parse.
           ;
           (genturfahi (eval samselpla) sentinel: #\a)))
    (string-escape-test genturfahi-string-escape)))

(define (string-escape-test genturfahi-string-escape)
  (test '(#\\
          #\\
          #\[
          #\] 
          "“"
          "”"
          "\""
          "‘"
          "’"
          "'"
          #\return
          #\return
          #\return
          #\newline
          #\newline
          #\newline
          #\page
          #\page
          #\page
          #\newline
          #\newline
          #\newline
          #\nul
          #\nul
          #\nul
          #\space
          #\tab
          #\tab
          #\tab)
        (genturfahi-string-escape
           "\\\\[]“”\"‘’'\r\r\r\n\n\n\f\f\f\n\n\n\x00\x00\x00 \t\t\t")))

(test-group "string escape (PEG)"
  (string-escape-peg))
