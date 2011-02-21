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

(define (toljuhi-girzu)
  (let* ((samselpla (call-with-input-file "toljuhi-girzu.peg" genturfahi-peg))
         (genturfahi-toljuhi-girzu (genturfahi* (eval samselpla))))
    (toljuhi-girzu-test genturfahi-toljuhi-girzu)))

(define (toljuhi-girzu-test genturfahi-toljuhi-girzu)
  ; Test the grouping operator when it includes elements
  ; that do not modify the parse tree.
  ;
  (test '(() "") (genturfahi-toljuhi-girzu ""))
  (test '(() "") (genturfahi-toljuhi-girzu "b"))
  (test '(() "") (genturfahi-toljuhi-girzu "bb"))
  (test '(() "") (genturfahi-toljuhi-girzu "bbb"))

  (test '((#\a) "") (genturfahi-toljuhi-girzu "a"))
  (test '((#\a) "") (genturfahi-toljuhi-girzu "ab"))
  (test '((#\a) "") (genturfahi-toljuhi-girzu "abb"))
  (test '((#\a) "") (genturfahi-toljuhi-girzu "abbb"))
  (test '((#\a) "") (genturfahi-toljuhi-girzu "ba"))
  (test '((#\a) "") (genturfahi-toljuhi-girzu "bba"))
  (test '((#\a) "") (genturfahi-toljuhi-girzu "bbba"))

  (test '((#\a #\a) "") (genturfahi-toljuhi-girzu "aa"))
  (test '((#\a #\a) "") (genturfahi-toljuhi-girzu "baa"))
  (test '((#\a #\a) "") (genturfahi-toljuhi-girzu "aba"))
  (test '((#\a #\a) "") (genturfahi-toljuhi-girzu "aab"))
  (test '((#\a #\a) "") (genturfahi-toljuhi-girzu "abab"))
  (test '((#\a #\a) "") (genturfahi-toljuhi-girzu "abba"))
  (test '((#\a #\a) "") (genturfahi-toljuhi-girzu "baab"))
  (test '((#\a #\a) "") (genturfahi-toljuhi-girzu "baba"))

  (test '((#\a #\a #\a) "") (genturfahi-toljuhi-girzu "aaa"))
  0)

(test-group "tolju'i girzu"
  (toljuhi-girzu))
