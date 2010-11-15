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
;;; end-of-input:
;;;
;;; end-of-input <- [eof]
;;;
(define (end-of-input)
  (set! genturfahi-eof (genturfahi* (nunjavni-fanmo)))
  (end-of-input-test genturfahi-eof))

(define (end-of-input-peg)
  (set! genturfahi-eof
        (begin (eval (call-with-input-file "end-of-input.peg" genturfahi-peg))
               (genturfahi-bootstrap*)))
  (end-of-input-test genturfahi-eof))

(define (end-of-input-test genturfahi-eof)
  ; The end of file only matches when we're at the end of
  ; the parse input.
  ;
  (test '(#\nul "") (genturfahi-eof ""))

  ; it doesn't match if here are any characters left.
  ;
  (test '(#f "a") (genturfahi-eof "a"))
  (test '(#f "b") (genturfahi-eof "b"))
  (test '(#f "c") (genturfahi-eof "c"))

  ; even if those remaining characters are the sentinel. 
  ;
  (test `(#f ,(make-string 1 #\nul)) (genturfahi-eof (make-string 1 #\nul)))
  0)

(test-group "end-of-input"
  (end-of-input))

(test-group "end-of-input (PEG)"
  (end-of-input-peg))
