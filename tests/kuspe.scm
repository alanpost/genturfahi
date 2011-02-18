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

(define (kuspe-peg)
  (let* ((samselpla (call-with-input-file "kuspe.peg" genturfahi-peg))
         (genturfahi-kuspe (genturfahi* (eval samselpla))))
    (kuspe-test genturfahi-kuspe)))

(define (kuspe-test genturfahi-kuspe)
  (test '(("1-to-3: " (#\a)) "")          (genturfahi-kuspe "1-to-3: a"))
  (test '(("1-to-3: " (#\a #\a)) "")      (genturfahi-kuspe "1-to-3: aa"))
  (test '(("1-to-3: " (#\a #\a #\a)) "")  (genturfahi-kuspe "1-to-3: aaa"))
  (test '(("1-to-3: " (#\a #\a #\a)) "a") (genturfahi-kuspe "1-to-3: aaaa"))

  (test '(("1-to-3: " "b") "")    (genturfahi-kuspe "1-to-3: b"))
  (test '(("1-to-3: " "bb") "")   (genturfahi-kuspe "1-to-3: bb"))
  (test '(("1-to-3: " "bbb") "")  (genturfahi-kuspe "1-to-3: bbb"))
  (test '(("1-to-3: " "bbb") "b") (genturfahi-kuspe "1-to-3: bbbb"))


  (test '(#f "2-to-3: a")                 (genturfahi-kuspe "2-to-3: a"))
  (test '(("2-to-3: " (#\a #\a)) "")      (genturfahi-kuspe "2-to-3: aa"))
  (test '(("2-to-3: " (#\a #\a #\a)) "")  (genturfahi-kuspe "2-to-3: aaa"))
  (test '(("2-to-3: " (#\a #\a #\a)) "a") (genturfahi-kuspe "2-to-3: aaaa"))

  (test '(#f "2-to-3: b")         (genturfahi-kuspe "2-to-3: b"))
  (test '(("2-to-3: " "bb") "")   (genturfahi-kuspe "2-to-3: bb"))
  (test '(("2-to-3: " "bbb") "")  (genturfahi-kuspe "2-to-3: bbb"))
  (test '(("2-to-3: " "bbb") "b") (genturfahi-kuspe "2-to-3: bbbb"))


  (test '(#f "1: ")          (genturfahi-kuspe "1: "))
  (test '(("1: " (#\a)) "")  (genturfahi-kuspe "1: a"))
  (test '(("1: " (#\a)) "a") (genturfahi-kuspe "1: aa"))

  (test '(#f "1: ")        (genturfahi-kuspe "1: "))
  (test '(("1: " "b") "")  (genturfahi-kuspe "1: b"))
  (test '(("1: " "b") "b") (genturfahi-kuspe "1: bb"))


  (test '(#f "2: ")              (genturfahi-kuspe "2: "))
  (test '(#f "2: a")             (genturfahi-kuspe "2: a"))
  (test '(("2: " (#\a #\a)) "")  (genturfahi-kuspe "2: aa"))
  (test '(("2: " (#\a #\a)) "a") (genturfahi-kuspe "2: aaa"))

  (test '(#f "2: ")         (genturfahi-kuspe "2: "))
  (test '(#f "2: b")        (genturfahi-kuspe "2: b"))
  (test '(("2: " "bb") "")  (genturfahi-kuspe "2: bb"))
  (test '(("2: " "bb") "b") (genturfahi-kuspe "2: bbb"))


  (test '(#f "3: ")                  (genturfahi-kuspe "3: "))
  (test '(#f "3: a")                 (genturfahi-kuspe "3: a"))
  (test '(#f "3: aa")                (genturfahi-kuspe "3: aa"))
  (test '(("3: " (#\a #\a #\a)) "")  (genturfahi-kuspe "3: aaa"))
  (test '(("3: " (#\a #\a #\a)) "a") (genturfahi-kuspe "3: aaaa"))

  (test '(#f "3: ")          (genturfahi-kuspe "3: "))
  (test '(#f "3: b")         (genturfahi-kuspe "3: b"))
  (test '(#f "3: bb")        (genturfahi-kuspe "3: bb"))
  (test '(("3: " "bbb") "")  (genturfahi-kuspe "3: bbb"))
  (test '(("3: " "bbb") "b") (genturfahi-kuspe "3: bbbb"))


  (test '(("1-or-more: " (#\a)) "")         (genturfahi-kuspe "1-or-more: a"))
  (test '(("1-or-more: " (#\a #\a)) "")     (genturfahi-kuspe "1-or-more: aa"))
  (test '(("1-or-more: " (#\a #\a #\a)) "") (genturfahi-kuspe "1-or-more: aaa"))

  (test '(("1-or-more: " "b") "")   (genturfahi-kuspe "1-or-more: b"))
  (test '(("1-or-more: " "bb") "")  (genturfahi-kuspe "1-or-more: bb"))
  (test '(("1-or-more: " "bbb") "") (genturfahi-kuspe "1-or-more: bbb"))


  (test '(#f "2-or-more: a")                (genturfahi-kuspe "2-or-more: a"))
  (test '(("2-or-more: " (#\a #\a)) "")     (genturfahi-kuspe "2-or-more: aa"))
  (test '(("2-or-more: " (#\a #\a #\a)) "") (genturfahi-kuspe "2-or-more: aaa"))
  (test '(("2-or-more: " (#\a #\a #\a #\a)) "")
                                     (genturfahi-kuspe "2-or-more: aaaa"))

  (test '(#f "2-or-more: b")         (genturfahi-kuspe "2-or-more: b"))
  (test '(("2-or-more: " "bb") "")   (genturfahi-kuspe "2-or-more: bb"))
  (test '(("2-or-more: " "bbb") "")  (genturfahi-kuspe "2-or-more: bbb"))
  (test '(("2-or-more: " "bbbb") "") (genturfahi-kuspe "2-or-more: bbbb"))

  (test '(#f "3-or-more: a")                (genturfahi-kuspe "3-or-more: a"))
  (test '(#f "3-or-more: aa")               (genturfahi-kuspe "3-or-more: aa"))
  (test '(("3-or-more: " (#\a #\a #\a)) "") (genturfahi-kuspe "3-or-more: aaa"))
  (test '(("3-or-more: " (#\a #\a #\a #\a)) "")
                                     (genturfahi-kuspe "3-or-more: aaaa"))
  (test '(("3-or-more: " (#\a #\a #\a #\a #\a)) "")
                                     (genturfahi-kuspe "3-or-more: aaaaa"))

  (test '(#f "3-or-more: b")          (genturfahi-kuspe "3-or-more: b"))
  (test '(#f "3-or-more: bb")         (genturfahi-kuspe "3-or-more: bb"))
  (test '(("3-or-more: " "bbb") "")   (genturfahi-kuspe "3-or-more: bbb"))
  (test '(("3-or-more: " "bbbb") "")  (genturfahi-kuspe "3-or-more: bbbb"))
  (test '(("3-or-more: " "bbbbb") "") (genturfahi-kuspe "3-or-more: bbbbb"))

  (test '(("zero-to-1: " ()) "")     (genturfahi-kuspe "zero-to-1: "))
  (test '(("zero-to-1: " (#\a)) "")  (genturfahi-kuspe "zero-to-1: a"))
  (test '(("zero-to-1: " (#\a)) "a") (genturfahi-kuspe "zero-to-1: aa"))

  (test '(("zero-to-1-b: " "") "")   (genturfahi-kuspe "zero-to-1-b: "))
  (test '(("zero-to-1-b: " "b") "")  (genturfahi-kuspe "zero-to-1-b: b"))
  (test '(("zero-to-1-b: " "b") "b") (genturfahi-kuspe "zero-to-1-b: bb"))

  (test '(("zero-to-2: " ()) "")         (genturfahi-kuspe "zero-to-2: "))
  (test '(("zero-to-2: " (#\a)) "")      (genturfahi-kuspe "zero-to-2: a"))
  (test '(("zero-to-2: " (#\a #\a)) "")  (genturfahi-kuspe "zero-to-2: aa"))
  (test '(("zero-to-2: " (#\a #\a)) "a") (genturfahi-kuspe "zero-to-2: aaa"))

  (test '(("zero-to-2-b: " "") "")    (genturfahi-kuspe "zero-to-2-b: "))
  (test '(("zero-to-2-b: " "b") "")   (genturfahi-kuspe "zero-to-2-b: b"))
  (test '(("zero-to-2-b: " "bb") "")  (genturfahi-kuspe "zero-to-2-b: bb"))
  (test '(("zero-to-2-b: " "bb") "b") (genturfahi-kuspe "zero-to-2-b: bbb"))

  (test '(("zero-to-3: " ()) "")       (genturfahi-kuspe "zero-to-3: "))
  (test '(("zero-to-3: " (#\a)) "")    (genturfahi-kuspe "zero-to-3: a"))
  (test '(("zero-to-3: " (#\a #\a)) "")
                                       (genturfahi-kuspe "zero-to-3: aa"))
  (test '(("zero-to-3: " (#\a #\a #\a)) "")
                                       (genturfahi-kuspe "zero-to-3: aaa"))
  (test '(("zero-to-3: " (#\a #\a #\a)) "a")
                                       (genturfahi-kuspe "zero-to-3: aaaa"))

  (test '(("zero-to-3-b: " "") "")     (genturfahi-kuspe "zero-to-3-b: "))
  (test '(("zero-to-3-b: " "b") "")    (genturfahi-kuspe "zero-to-3-b: b"))
  (test '(("zero-to-3-b: " "bb") "")   (genturfahi-kuspe "zero-to-3-b: bb"))
  (test '(("zero-to-3-b: " "bbb") "")  (genturfahi-kuspe "zero-to-3-b: bbb"))
  (test '(("zero-to-3-b: " "bbb") "b") (genturfahi-kuspe "zero-to-3-b: bbbb"))


  (test '(("zero-or-more: " ()) "")    (genturfahi-kuspe "zero-or-more: "))
  (test '(("zero-or-more: " (#\a)) "") (genturfahi-kuspe "zero-or-more: a"))
  (test '(("zero-or-more: " (#\a #\a)) "")
                                       (genturfahi-kuspe "zero-or-more: aa"))
  (test '(("zero-or-more: " (#\a #\a #\a)) "")
                                       (genturfahi-kuspe "zero-or-more: aaa"))

  (test '(("zero-or-more-b: " "") "") (genturfahi-kuspe "zero-or-more-b: "))
  (test '(("zero-or-more-b: " "b") "")
                                      (genturfahi-kuspe "zero-or-more-b: b"))
  (test '(("zero-or-more-b: " "bb") "")
                                      (genturfahi-kuspe "zero-or-more-b: bb"))
  (test '(("zero-or-more-b: " "bbb") "")
                                      (genturfahi-kuspe "zero-or-more-b: bbb"))


  (test '(("zero-or-more-2: " ()) "")
                                  (genturfahi-kuspe "zero-or-more-2: "))
  (test '(("zero-or-more-2: " (#\a)) "")
                                  (genturfahi-kuspe "zero-or-more-2: a"))
  (test '(("zero-or-more-2: " (#\a #\a)) "")
                                  (genturfahi-kuspe "zero-or-more-2: aa"))
  (test '(("zero-or-more-2: " (#\a #\a #\a)) "")
                                  (genturfahi-kuspe "zero-or-more-2: aaa"))

  (test '(("zero-or-more-2-b: " "") "")
                                  (genturfahi-kuspe "zero-or-more-2-b: "))
  (test '(("zero-or-more-2-b: " "b") "")
                                  (genturfahi-kuspe "zero-or-more-2-b: b"))
  (test '(("zero-or-more-2-b: " "bb") "")
                                  (genturfahi-kuspe "zero-or-more-2-b: bb"))
  (test '(("zero-or-more-2-b: " "bbb") "")
                                  (genturfahi-kuspe "zero-or-more-2-b: bbb")))

(test-group "kuspe (PEG)"
  (kuspe-peg))
