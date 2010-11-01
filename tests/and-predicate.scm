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
;;; and-predicate: &e
;;;
;;; a <- &\#a
;;;
(define (and-predicate)
  (set! genturfahi-and-predicate
        (genturfahi* (nunjavni-& (nunjavni-lerfu #\a))))

  ; the and-predicate matches as normal, but does not advance
  ; the input.
  ;
  (test '(#\a "a") (genturfahi-and-predicate "a"))

  ; It behaves like all other rules when there is no match,
  ; indicating no match.
  ;
  (test '(#f "b") (genturfahi-and-predicate "b"))
  (test '(#f "c") (genturfahi-and-predicate "c"))

  ; there is no rule for the emtpy
  ; string, no match
  ;
  (test '(#f "") (genturfahi-and-predicate ""))

  ; there is no rule for the end-of-file
  ; These match, but they don't parse the
  ; whole buffer!
  ;
  ; this rule won't even match two #\a,
  ; only one.
  ;
  (test '(#\a "aa") (genturfahi-and-predicate "aa"))
  (test '(#\a "ab") (genturfahi-and-predicate "ab"))
  (test '(#\a "ac") (genturfahi-and-predicate "ac"))

  ; later characters that would match
  ; don't if there is no rule to match
  ; earlier characters.
  ;
  (test '(#f "da") (genturfahi-and-predicate "da"))
  0)

(test-group "and-predicate"
  (and-predicate))
