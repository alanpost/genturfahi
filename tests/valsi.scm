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
;;; terminal:
;;;
;;; abc <- "abc"
;;;
(define (valsi)
  (set! genturfahi-valsi
        (genturfahi* (nunjavni-valsi "abc")))

  ; match the only word this parser matches.
  ;
  (test '("abc" "") (genturfahi-valsi "abc"))

  ; There is no rule to match any other words,
  ; so they don't match.
  ;
  (test '(#f "a") (genturfahi-valsi "a"))
  (test '(#f "ab") (genturfahi-valsi "ab"))
  (test '(#f "abd") (genturfahi-valsi "abd"))

  ; there is no rule for the emtpy
  ; string, no match
  ;
  (test '(#f "") (genturfahi-valsi ""))

  ; there is no rule for the end-of-file
  ; These match, but they don't parse the
  ; whole buffer!
  ;
  ; this rule won't even match two "abc"
  ; only one.
  ;
  (test '("abc" "a") (genturfahi-valsi "abca"))
  (test '("abc" "ab") (genturfahi-valsi "abcab"))
  (test '("abc" "abc") (genturfahi-valsi "abcabc"))
  (test '("abc" "b") (genturfahi-valsi "abcb"))
  (test '("abc" "c") (genturfahi-valsi "abcc"))

  ; later words that would match
  ; don't if there is no rule to match
  ; earlier words.
  ;
  (test '(#f "dabc") (genturfahi-valsi "dabc"))
  0)

(test-group "valsi"
  (valsi))