;;;;
;;;; genturfahi - lo la .ckim. ke pe'a jajgau ratcu ke'e genturfa'i
;;;;            `-> A Scheme packrat parser.
;;;;
;;;; Copyright (c) 2011 ".alyn.post." <alyn.post@lodockikumazvati.org>
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
;;; utf8
;;;
;;; gerna <- #\« "¿?" (!#\∞ .)* [∞]* #\»
;;;
(define (test-utf8 #!key valsi inf)
  (string-append "«¿?" (list->string valsi) inf "»"))

(define (utf8-hand)
  (let ((genturfahi-utf8
    (let ()
      (define gerna-1
        (nunjavni-secuxna
          (lambda () 'gerna)
          (lambda (porsi mapti namapti)
            (gerna-2 porsi mapti namapti))))
      (define gerna-2
        (nunjavni-morji
          (morji-nunjavni-samselpla
            test-utf8
            (morji-nunjavni-je
              (list (morji-nunjavni-lerfu #\« porjahe: #t)
                    (morji-nunjavni-valsi "¿?" porjahe: #t)
                    (morji-nunjavni-*
                      (morji-nunjavni-je
                        (list (morji-nunjavni-!
                                (morji-nunjavni-lerfu #\∞)
                                porjahe:
                                #t)
                              (morji-nunjavni-!
                                (morji-nunjavni-lerfu #\»)
                                porjahe:
                                #t)
                              (morji-nunjavni-. porjahe: #t))
                        porsumti:
                        #t
                        porjahe:
                        #t)
                      cmene:
                      "valsi"
                      porsumti:
                      #t
                      porjahe:
                      #t)
                    (morji-nunjavni-char-set-*
                      (char-set #\∞)
                      cmene:
                      "inf"
                      porjahe:
                      #t)
                    (morji-nunjavni-lerfu #\» porjahe: #t))
              porsumti:
              #t
              porjahe:
              #t))))
      (tolmohi-nunjavni)
      (genturfahi* gerna-1))))
  (utf8-test genturfahi-utf8)))

(define (utf8-peg)
  (let* ((samselpla (call-with-input-file "utf8.peg" genturfahi-peg))
         (genturfahi-utf8 (genturfahi* (eval samselpla))))
    (utf8-test genturfahi-utf8)))

(define (utf8-test genturfahi-utf8)
  (test '(#f         "") (genturfahi-utf8 ""))
  (test '("«¿?»"     "") (genturfahi-utf8 "«¿?»"))
  (test '("«¿?∞»"    "") (genturfahi-utf8 "«¿?∞»"))
  (test '("«¿?∞∞»"   "") (genturfahi-utf8 "«¿?∞∞»"))
  (test '("«¿?∞∞∞»"  "") (genturfahi-utf8 "«¿?∞∞∞»"))
  (test '("«¿?a»"   "")  (genturfahi-utf8 "«¿?a»"))
  (test '("«¿?abc»" "")  (genturfahi-utf8 "«¿?abc»"))
  (test '("«¿?a∞»"   "") (genturfahi-utf8 "«¿?a∞»"))
  (test '("«¿?abc∞»" "") (genturfahi-utf8 "«¿?abc∞»"))
  0)

(test-group "utf8"
  (utf8-hand))

;(test-group "utf8 (PEG)"
;  (utf8-peg))
