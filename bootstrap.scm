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
(use genturfahi)
(use extras)

(include "samselpla.scm")

;
;XXX should those grammar rules that take a single rule run an
;    implicit nunjavni-je when given more than one rule?  Will the
;    compiler use such a feature?
;

(let ((genturfahi-bootstrap
  (letrec
    ((cfari     (nunjavni-morji
                  (nunjavni-samselpla (samselpla-cfari gerna)
                    (nunjavni-je
                      (nunjavni-cmene gerna (nunjavni-naselci gerna))
                      (nunjavni-naselci FAhO)))))
     (gerna     (nunjavni-morji
                  (nunjavni-* (nunjavni-naselci totoi))))
     (totoi     (nunjavni-morji
                  (nunjavni-samselpla (samselpla-totoi)
                    (nunjavni-je
                      (nunjavni-naselci SEMICOLON)
                      (nunjavni-*
                        (nunjavni-je
                          (nunjavni-! (nunjavni-naselci CRLF))
                          (nunjavni-.)))
                      (nunjavni-jonai
                        (nunjavni-naselci CRLF)
                        (nunjavni-& (nunjavni-naselci FAhO)))))))
     ; XXX: is this rule so fast that it shouldn't memoize?
     (SEMICOLON (nunjavni-morji
                  (nunjavni-lerfu #\;)))
     (CR        (nunjavni-morji
                  (nunjavni-lerfu #\newline)))
     (LF        (nunjavni-morji
                  (nunjavni-lerfu #\linefeed)))
     (CRLF      (nunjavni-morji
                  (nunjavni-jonai
                    (nunjavni-je
                      (nunjavni-naselci CR)
                      (nunjavni-naselci LF))
                    (nunjavni-naselci CR)
                    (nunjavni-naselci LF))))
     (FAhO      (nunjavni-morji
                  (nunjavni-fanmo))))
    (genturfahi* cfari))))

  (pretty-print (call-with-input-file "genturfahi.peg" (lambda (port)
  (genturfahi-bootstrap port)))))
