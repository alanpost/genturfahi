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
;;; zero-or-more: e*
;;;
;;; a <- \#a*
;;;
(define (zero-or-more)
  (set! genturfahi-zero-or-more
        (genturfahi* (nunjavni-* (nunjavni-lerfu #\a))))

  ; match the only character this parser matches.
  ; notice that it returns a list of characters,
  ; even if it only matches a single character.
  ;
  (test '((#\a) "") (genturfahi-zero-or-more "a"))

  ; though the rule matches even when the character isn't present
  ; the empty list indicates no characters matched.
  ;
  (test '(() "") (genturfahi-zero-or-more ""))

  ; We match as many #\a as we can.
  ;
  (test '((#\a #\a) "") (genturfahi-zero-or-more "aa"))
  (test '((#\a #\a #\a) "") (genturfahi-zero-or-more "aaa"))

  ; There is no rule to match any other character,
  ; but since this rule matches zero-or-more, it
  ; succeeds in matching zero #\a.
  ;
  (test '(() "b") (genturfahi-zero-or-more "b"))
  (test '(() "c") (genturfahi-zero-or-more "c"))

  ; As well, it will match all #\a before ending
  ; the parse.  These match, but they don't parse
  ; the whole buffer!
  ;
  (test '((#\a) "b") (genturfahi-zero-or-more "ab"))
  (test '((#\a) "c") (genturfahi-zero-or-more "ac"))

  (test '((#\a #\a) "b") (genturfahi-zero-or-more "aab"))
  (test '((#\a #\a) "c") (genturfahi-zero-or-more "aac"))

  (test '((#\a #\a #\a) "b") (genturfahi-zero-or-more "aaab"))
  (test '((#\a #\a #\a) "c") (genturfahi-zero-or-more "aaac"))

  ; later characters that would match don't if there is no rule
  ; to match earlier characters.  This rule matches the empty
  ; list, but can't access the #\a later in the parse input.
  ;
  (test '(() "da") (genturfahi-zero-or-more "da"))
  (test '(() "daa") (genturfahi-zero-or-more "daa"))
  (test '(() "daaa") (genturfahi-zero-or-more "daaa"))
  0)

(zero-or-more)
