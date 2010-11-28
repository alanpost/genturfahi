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

(define genturfahi-peg-gerna
  (letrec ((cfari (nunjavni-morji
                    (nunjavni-samselpla
                      samselpla-cfari
                      (nunjavni-je
                        (lambda (porsi mapti namapti)
                          (canlu porsi mapti namapti))
                        (nunjavni-*
                          (lambda (porsi mapti namapti)
                            (cfari-samselpla porsi mapti namapti)))
                        (lambda (porsi mapti namapti)
                          (canlu porsi mapti namapti))
                        (nunjavni-cmene
                          (lambda (porsi mapti namapti)
                            (gerna porsi mapti namapti))
                          cmene:
                          "gerna")
                        (lambda (porsi mapti namapti)
                          (FAhO porsi mapti namapti))))))
           (cfari-samselpla
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-cfari-samselpla
                 (nunjavni-je
                   (nunjavni-lerfu #\{)
                   (lambda (porsi mapti namapti) (canlu porsi mapti namapti))
                   (nunjavni-+
                     (nunjavni-samselpla
                       samselpla-samselpla-lerfu
                       (nunjavni-je
                         (nunjavni-! (nunjavni-lerfu #\}))
                         (nunjavni-. cmene: "lerfu")))
                     cmene:
                     "rodalerfu")
                   (nunjavni-lerfu #\})
                   (lambda (porsi mapti namapti)
                     (canlu porsi mapti namapti))))))
           (gerna (nunjavni-morji
                    (nunjavni-samselpla
                      samselpla-gerna
                      (nunjavni-*
                        (lambda (porsi mapti namapti)
                          (smuni porsi mapti namapti))
                        cmene:
                        "smuni"))))
           (smuni (nunjavni-morji
                    (nunjavni-samselpla
                      samselpla-smuni
                      (nunjavni-je
                        (nunjavni-cmene
                          (lambda (porsi mapti namapti)
                            (naselci porsi mapti namapti))
                          cmene:
                          "naselci")
                        (nunjavni-valsi "<-")
                        (lambda (porsi mapti namapti)
                          (canlu porsi mapti namapti))
                        (nunjavni-cmene
                          (lambda (porsi mapti namapti)
                            (javni porsi mapti namapti))
                          cmene:
                          "javni")))))
           (naselci
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-naselci
                 (nunjavni-je
                   (nunjavni-re "[[:alpha:]_\\-]" cmene: "cfari")
                   (nunjavni-re "[[:alnum:]_\\-]*" cmene: "fanmo")
                   (lambda (porsi mapti namapti)
                     (canlu porsi mapti namapti))))))
           (javni (nunjavni-morji
                    (nunjavni-jonai
                      (lambda (porsi mapti namapti)
                        (jonai porsi mapti namapti))
                      (lambda (porsi mapti namapti)
                        (je porsi mapti namapti)))))
           (jonai (nunjavni-morji
                    (nunjavni-samselpla
                      samselpla-jonai
                      (nunjavni-je
                        (nunjavni-cmene
                          (lambda (porsi mapti namapti)
                            (je porsi mapti namapti))
                          cmene:
                          "cfari")
                        (nunjavni-+
                          (nunjavni-samselpla
                            samselpla-jonai-je
                            (nunjavni-je
                              (nunjavni-lerfu #\/)
                              (lambda (porsi mapti namapti)
                                (canlu porsi mapti namapti))
                              (nunjavni-cmene
                                (lambda (porsi mapti namapti)
                                  (je porsi mapti namapti))
                                cmene:
                                "je")))
                          cmene:
                          "fanmo")))))
           (je (nunjavni-morji
                 (nunjavni-samselpla
                   samselpla-je
                   (nunjavni-je
                     (nunjavni-+
                       (lambda (porsi mapti namapti)
                         (pajavni porsi mapti namapti))
                       cmene:
                       "rodajavni")
                     (nunjavni-?
                       (lambda (porsi mapti namapti)
                         (cmene-sumti porsi mapti namapti))
                       cmene:
                       "cmene")
                     (nunjavni-?
                       (lambda (porsi mapti namapti)
                         (samselpla porsi mapti namapti))
                       cmene:
                       "samselpla")))))
           (pajavni
             (nunjavni-morji
               (nunjavni-jonai
                 (lambda (porsi mapti namapti) (optional porsi mapti namapti))
                 (lambda (porsi mapti namapti)
                   (repetition0 porsi mapti namapti))
                 (lambda (porsi mapti namapti)
                   (repetition1 porsi mapti namapti))
                 (lambda (porsi mapti namapti)
                   (and-predicate porsi mapti namapti))
                 (lambda (porsi mapti namapti)
                   (end-of-input porsi mapti namapti))
                 (lambda (porsi mapti namapti)
                   (not-predicate porsi mapti namapti))
                 (nunjavni-samselpla
                   samselpla-pajavni-cmene
                   (nunjavni-je
                     (nunjavni-?
                       (lambda (porsi mapti namapti)
                         (cmene-sumti porsi mapti namapti))
                       cmene:
                       "cmene")
                     (nunjavni-cmene
                       (lambda (porsi mapti namapti)
                         (selci-javni porsi mapti namapti))
                       cmene:
                       "javni"))))))
           (optional
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-?
                 (nunjavni-je
                   (nunjavni-?
                     (lambda (porsi mapti namapti)
                       (cmene-sumti porsi mapti namapti))
                     cmene:
                     "cmene")
                   (nunjavni-cmene
                     (lambda (porsi mapti namapti)
                       (selci-javni porsi mapti namapti))
                     cmene:
                     "javni")
                   (nunjavni-lerfu #\?)
                   (lambda (porsi mapti namapti)
                     (canlu porsi mapti namapti))))))
           (repetition0
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-*
                 (nunjavni-je
                   (nunjavni-?
                     (lambda (porsi mapti namapti)
                       (cmene-sumti porsi mapti namapti))
                     cmene:
                     "cmene")
                   (nunjavni-cmene
                     (lambda (porsi mapti namapti)
                       (selci-javni porsi mapti namapti))
                     cmene:
                     "javni")
                   (nunjavni-lerfu #\*)
                   (lambda (porsi mapti namapti)
                     (canlu porsi mapti namapti))))))
           (repetition1
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-+
                 (nunjavni-je
                   (nunjavni-?
                     (lambda (porsi mapti namapti)
                       (cmene-sumti porsi mapti namapti))
                     cmene:
                     "cmene")
                   (nunjavni-cmene
                     (lambda (porsi mapti namapti)
                       (selci-javni porsi mapti namapti))
                     cmene:
                     "javni")
                   (nunjavni-lerfu #\+)
                   (lambda (porsi mapti namapti)
                     (canlu porsi mapti namapti))))))
           (and-predicate
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-&
                 (nunjavni-je
                   (nunjavni-lerfu #\&)
                   (lambda (porsi mapti namapti) (canlu porsi mapti namapti))
                   (nunjavni-cmene
                     (lambda (porsi mapti namapti)
                       (selci-javni porsi mapti namapti))
                     cmene:
                     "javni")))))
           (end-of-input
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-fanmo
                 (nunjavni-je
                   (nunjavni-lerfu #\!)
                   (lambda (porsi mapti namapti) (canlu porsi mapti namapti))
                   (nunjavni-lerfu #\.)
                   (lambda (porsi mapti namapti)
                     (canlu porsi mapti namapti))))))
           (not-predicate
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-!
                 (nunjavni-je
                   (nunjavni-lerfu #\!)
                   (lambda (porsi mapti namapti) (canlu porsi mapti namapti))
                   (nunjavni-cmene
                     (lambda (porsi mapti namapti)
                       (selci-javni porsi mapti namapti))
                     cmene:
                     "javni")))))
           (cmene-sumti
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-cmene-sumti
                 (nunjavni-je
                   (nunjavni-valsi "#:")
                   (nunjavni-re "[[:alpha:]_\\-]" cmene: "cfari")
                   (nunjavni-re "[[:alnum:]_\\-]*" cmene: "fanmo")
                   (lambda (porsi mapti namapti)
                     (canlu porsi mapti namapti))))))
           (selci-javni
             (nunjavni-morji
               (nunjavni-jonai
                 (lambda (porsi mapti namapti)
                   (selci-naselci porsi mapti namapti))
                 (lambda (porsi mapti namapti)
                   (lerfu-selci porsi mapti namapti))
                 (lambda (porsi mapti namapti)
                   (valsi-selci porsi mapti namapti))
                 (lambda (porsi mapti namapti)
                   (klesi-selci porsi mapti namapti))
                 (lambda (porsi mapti namapti) (denpabu porsi mapti namapti))
                 (lambda (porsi mapti namapti)
                   (girzu-javni porsi mapti namapti)))))
           (selci-naselci
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-selci-naselci
                 (nunjavni-je
                   (nunjavni-cmene
                     (lambda (porsi mapti namapti)
                       (naselci porsi mapti namapti))
                     cmene:
                     "naselci")
                   (nunjavni-! (nunjavni-valsi "<-"))))))
           (lerfu-selci
             (nunjavni-morji
               (nunjavni-jonai
                 (nunjavni-samselpla
                   samselpla-lerfu-selci
                   (nunjavni-je
                     (nunjavni-valsi "#\\")
                     (nunjavni-cmene
                       (lambda (porsi mapti namapti)
                         (lerfu-cmene porsi mapti namapti))
                       cmene:
                       "lerfu")
                     (lambda (porsi mapti namapti)
                       (canlu porsi mapti namapti))))
                 (nunjavni-samselpla
                   samselpla-lerfu-selci
                   (nunjavni-je
                     (nunjavni-valsi "#\\")
                     (nunjavni-. cmene: "lerfu")
                     (lambda (porsi mapti namapti)
                       (canlu porsi mapti namapti)))))))
           (lerfu-cmene
             (nunjavni-morji
               (nunjavni-jonai
                 (nunjavni-samselpla
                   samselpla-lerfu-space
                   (nunjavni-valsi "space"))
                 (nunjavni-samselpla
                   samselpla-lerfu-return
                   (nunjavni-valsi "return"))
                 (nunjavni-samselpla
                   samselpla-lerfu-linefeed
                   (nunjavni-valsi "linefeed"))
                 (nunjavni-samselpla
                   samselpla-lerfu-newline
                   (nunjavni-valsi "newline"))
                 (nunjavni-samselpla
                   samselpla-lerfu-return
                   (nunjavni-valsi "return"))
                 (nunjavni-samselpla
                   samselpla-lerfu-tab
                   (nunjavni-valsi "tab")))))
           (valsi-selci
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-valsi-selci
                 (nunjavni-je
                   (nunjavni-lerfu #\")
                   (nunjavni-*
                     (nunjavni-samselpla
                       samselpla-valsi-selci-lerfu
                       (nunjavni-je
                         (nunjavni-! (nunjavni-lerfu #\"))
                         (nunjavni-cmene
                           (lambda (porsi mapti namapti)
                             (valsi-lerfu porsi mapti namapti))
                           cmene:
                           "lerfu")))
                     cmene:
                     "valsi-lerfu")
                   (nunjavni-lerfu #\")
                   (lambda (porsi mapti namapti)
                     (canlu porsi mapti namapti))))))
           (valsi-lerfu
             (nunjavni-morji
               (nunjavni-jonai
                 (nunjavni-samselpla
                   samselpla-valsi-newline
                   (nunjavni-je (nunjavni-lerfu #\\) (nunjavni-lerfu #\n)))
                 (nunjavni-samselpla
                   samselpla-valsi-linefeed
                   (nunjavni-je (nunjavni-lerfu #\\) (nunjavni-lerfu #\r)))
                 (nunjavni-samselpla
                   samselpla-valsi-tab
                   (nunjavni-je (nunjavni-lerfu #\\) (nunjavni-lerfu #\t)))
                 (nunjavni-samselpla
                   samselpla-valsi-backslash
                   (nunjavni-je (nunjavni-lerfu #\\) (nunjavni-lerfu #\\)))
                 (nunjavni-samselpla
                   samselpla-valsi-single-quote
                   (nunjavni-je (nunjavni-lerfu #\\) (nunjavni-lerfu #\')))
                 (nunjavni-samselpla
                   samselpla-valsi-double-quote
                   (nunjavni-je (nunjavni-lerfu #\\) (nunjavni-lerfu #\")))
                 (nunjavni-samselpla
                   samselpla-valsi-lerfu
                   (nunjavni-je
                     (nunjavni-! (nunjavni-lerfu #\\))
                     (nunjavni-. cmene: "lerfu"))))))
           (klesi-selci
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-klesi-selci
                 (nunjavni-je
                   (nunjavni-lerfu #\[)
                   (nunjavni-+
                     (lambda (porsi mapti namapti)
                       (klesi-lerfu porsi mapti namapti))
                     cmene:
                     "klesi-lerfu")
                   (nunjavni-lerfu #\])
                   (nunjavni-?
                     (nunjavni-jonai (nunjavni-valsi "*") (nunjavni-valsi "+"))
                     cmene:
                     "repeat")
                   (lambda (porsi mapti namapti)
                     (canlu porsi mapti namapti))))))
           (klesi-lerfu
             (nunjavni-morji
               (nunjavni-jonai
                 (lambda (porsi mapti namapti)
                   (klesi-cmene porsi mapti namapti))
                 (nunjavni-samselpla
                   samselpla-klesi-lerfu
                   (nunjavni-je
                     (nunjavni-! (nunjavni-lerfu #\]))
                     (nunjavni-. cmene: "klesi-lerfu"))))))
           (klesi-cmene
             (nunjavni-morji
               (nunjavni-jonai
                 (nunjavni-valsi "[:alnum:]")
                 (nunjavni-valsi "[:alpha:]")
                 (nunjavni-valsi "[:ascii:]")
                 (nunjavni-valsi "[:blank:]")
                 (nunjavni-valsi "[:cntrl:]")
                 (nunjavni-valsi "[:digit:]")
                 (nunjavni-valsi "[:graph:]")
                 (nunjavni-valsi "[:lower:]")
                 (nunjavni-samselpla
                   samselpla-odigit
                   (nunjavni-valsi "[:odigit:]"))
                 (nunjavni-valsi "[:print:]")
                 (nunjavni-valsi "[:punct:]")
                 (nunjavni-valsi "[:space:]")
                 (nunjavni-valsi "[:upper:]")
                 (nunjavni-valsi "[:word:]")
                 (nunjavni-valsi "[:xdigit:]")
                 (nunjavni-valsi "[:^alnum:]")
                 (nunjavni-valsi "[:^alpha:]")
                 (nunjavni-valsi "[:^ascii:]")
                 (nunjavni-valsi "[:^blank:]")
                 (nunjavni-valsi "[:^cntrl:]")
                 (nunjavni-valsi "[:^digit:]")
                 (nunjavni-valsi "[:^graph:]")
                 (nunjavni-valsi "[:^lower:]")
                 (nunjavni-samselpla
                   samselpla-^odigit
                   (nunjavni-valsi "[:^odigit:]"))
                 (nunjavni-valsi "[:^print:]")
                 (nunjavni-valsi "[:^punct:]")
                 (nunjavni-valsi "[:^space:]")
                 (nunjavni-valsi "[:^upper:]")
                 (nunjavni-valsi "[:^word:]")
                 (nunjavni-valsi "[:^xdigit:]"))))
           (denpabu
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-denpabu
                 (nunjavni-je
                   (nunjavni-lerfu #\.)
                   (lambda (porsi mapti namapti)
                     (canlu porsi mapti namapti))))))
           (samselpla
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-samselpla
                 (nunjavni-je
                   (nunjavni-lerfu #\{)
                   (lambda (porsi mapti namapti) (canlu porsi mapti namapti))
                   (nunjavni-+
                     (nunjavni-samselpla
                       samselpla-samselpla-lerfu
                       (nunjavni-je
                         (nunjavni-! (nunjavni-lerfu #\}))
                         (nunjavni-. cmene: "lerfu")))
                     cmene:
                     "rodalerfu")
                   (nunjavni-lerfu #\})
                   (lambda (porsi mapti namapti)
                     (canlu porsi mapti namapti))))))
           (girzu-javni
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-girzu-javni
                 (nunjavni-je
                   (nunjavni-lerfu #\()
                   (lambda (porsi mapti namapti) (canlu porsi mapti namapti))
                   (nunjavni-cmene
                     (lambda (porsi mapti namapti) (javni porsi mapti namapti))
                     cmene:
                     "javni")
                   (nunjavni-lerfu #\))
                   (lambda (porsi mapti namapti)
                     (canlu porsi mapti namapti))))))
           (canlu (nunjavni-morji
                    (nunjavni-samselpla
                      samselpla-canlu
                      (nunjavni-*
                        (nunjavni-jonai
                          (lambda (porsi mapti namapti)
                            (canlubu porsi mapti namapti))
                          (lambda (porsi mapti namapti)
                            (totoi porsi mapti namapti)))))))
           (canlubu
             (nunjavni-morji
               (nunjavni-jonai
                 (nunjavni-lerfu #\space)
                 (nunjavni-lerfu #\tab)
                 (lambda (porsi mapti namapti) (CR porsi mapti namapti))
                 (lambda (porsi mapti namapti) (LF porsi mapti namapti)))))
           (totoi (nunjavni-morji
                    (nunjavni-je
                      (nunjavni-lerfu #\;)
                      (nunjavni-*
                        (nunjavni-je
                          (nunjavni-!
                            (lambda (porsi mapti namapti)
                              (CRLF porsi mapti namapti)))
                          (nunjavni-.)))
                      (nunjavni-jonai
                        (lambda (porsi mapti namapti)
                          (CRLF porsi mapti namapti))
                        (nunjavni-&
                          (lambda (porsi mapti namapti)
                            (FAhO porsi mapti namapti)))))))
           (CR (nunjavni-morji (nunjavni-lerfu #\return)))
           (LF (nunjavni-morji (nunjavni-lerfu #\newline)))
           (CRLF (nunjavni-morji
                   (nunjavni-jonai
                     (nunjavni-je
                       (lambda (porsi mapti namapti) (CR porsi mapti namapti))
                       (lambda (porsi mapti namapti) (LF porsi mapti namapti)))
                     (lambda (porsi mapti namapti) (CR porsi mapti namapti))
                     (lambda (porsi mapti namapti) (LF porsi mapti namapti)))))
           (FAhO (nunjavni-morji (nunjavni-fanmo))))
    cfari))
