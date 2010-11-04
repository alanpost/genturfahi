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
;;; dot expression: match any single character.
;;;
;;; dot <- .
;;;
(define (dot)
  (set! genturfahi-.
        (genturfahi* (nunjavni-.)))

  (test '(#\a "") (genturfahi-. "a"))
  (test '(#\b "") (genturfahi-. "b"))
  (test '(#\c "") (genturfahi-. "c"))

  (test '(#\a "bc") (genturfahi-. "abc"))
  (test '(#\b "ca") (genturfahi-. "bca"))
  (test '(#\c "ab") (genturfahi-. "cab"))

  (test '(#f "") (genturfahi-. ""))
  0)

(test-group "dot"
  (dot))
