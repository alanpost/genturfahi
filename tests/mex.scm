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
;;; This example appeared in chicken gazette #5 as the example for
;;; the packrat parser module:
;;;
;;;  http://gazette.call-cc.org/issues/5.html
;;;
;;; It is here ported to genturfa'i.
;;;
(define (mex)
  (set! javni-lerfu-0 (nunjavni-lerfu #\0))
  (set! javni-lerfu-1 (nunjavni-lerfu #\1))
  (set! javni-lerfu-2 (nunjavni-lerfu #\2))
  (set! javni-lerfu-3 (nunjavni-lerfu #\3))
  (set! javni-lerfu-4 (nunjavni-lerfu #\4))
  (set! javni-lerfu-5 (nunjavni-lerfu #\5))
  (set! javni-lerfu-6 (nunjavni-lerfu #\6))
  (set! javni-lerfu-7 (nunjavni-lerfu #\7))
  (set! javni-lerfu-8 (nunjavni-lerfu #\8))
  (set! javni-lerfu-9 (nunjavni-lerfu #\9))
  (set! javni-lerfu-+ (nunjavni-lerfu #\+))
  (set! javni-lerfu-* (nunjavni-lerfu #\*))
  (set! javni-lerfu-lparen (nunjavni-lerfu #\())
  (set! javni-lerfu-rparen (nunjavni-lerfu #\)))

  (let ((mex
    (letrec
      ((expr   (nunjavni-morji
                 (nunjavni-jonai
                   (nunjavni-samselpla (+ a b)
                     (nunjavni-je
                       (nunjavni-cmene a (nunjavni-naselci mulexp))
                       javni-lerfu-+
                       (nunjavni-cmene b (nunjavni-naselci mulexp))))
                   (nunjavni-naselci mulexp))))
       (mulexp (nunjavni-morji
                 (nunjavni-jonai
                   (nunjavni-samselpla (* a b)
                     (nunjavni-je
                       (nunjavni-cmene a (nunjavni-naselci simple))
                       javni-lerfu-*
                       (nunjavni-cmene b (nunjavni-naselci simple))))
                   (nunjavni-naselci simple))))
       (simple (nunjavni-morji
                 (nunjavni-jonai
                   (nunjavni-naselci num)
                   (nunjavni-samselpla a
                     (nunjavni-je
                       javni-lerfu-lparen
                       (nunjavni-cmene a (nunjavni-naselci expr))
                       javni-lerfu-rparen)))))
       (num    (nunjavni-morji
                 (nunjavni-samselpla (string->number (list->string a))
                   (nunjavni-cmene a (nunjavni-+ (nunjavni-naselci digit))))))
       (digit  (nunjavni-morji
                 (nunjavni-jonai
                   javni-lerfu-0
                   javni-lerfu-1
                   javni-lerfu-2
                   javni-lerfu-3
                   javni-lerfu-4
                   javni-lerfu-5
                   javni-lerfu-6
                   javni-lerfu-7
                   javni-lerfu-8
                   javni-lerfu-9))))
      (genturfahi expr))))

    (test 2  (mex "2"))
    (test 22 (mex "22"))
    (test 4  (mex "2*2"))
    (test 4  (mex "2+2"))
    (test 16 (mex "2+2*7"))
    (test 28 (mex "(2+2)*7"))
    (test 42 (mex "3*4+5*6")))
    0)

(mex)
