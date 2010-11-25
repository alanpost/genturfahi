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
                        (nunjavni-naselci canlu)
                        (nunjavni-* (nunjavni-naselci cfari-samselpla))
                        (nunjavni-naselci canlu)
                        (nunjavni-naselci gerna cmene: "gerna")
                        (nunjavni-naselci FAhO)))))
           (cfari-samselpla
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-cfari-samselpla
                 (nunjavni-je
                   (nunjavni-lerfu #\{)
                   (nunjavni-naselci canlu)
                   (nunjavni-+
                     (nunjavni-samselpla
                       samselpla-samselpla-lerfu
                       (nunjavni-je
                         (nunjavni-! (nunjavni-lerfu #\}))
                         (nunjavni-. cmene: "lerfu")))
                     cmene:
                     "rodalerfu")
                   (nunjavni-lerfu #\})
                   (nunjavni-naselci canlu)))))
           (gerna (nunjavni-morji
                    (nunjavni-samselpla
                      samselpla-gerna
                      (nunjavni-* (nunjavni-naselci smuni) cmene: "smuni"))))
           (smuni (nunjavni-morji
                    (nunjavni-samselpla
                      samselpla-smuni
                      (nunjavni-je
                        (nunjavni-naselci naselci cmene: "naselci")
                        (nunjavni-valsi "<-")
                        (nunjavni-naselci canlu)
                        (nunjavni-naselci javni cmene: "javni")))))
           (naselci
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-naselci
                 (nunjavni-je
                   (nunjavni-re "[[:alpha:]_\\-]" cmene: "cfari")
                   (nunjavni-re "[[:alnum:]_\\-]*" cmene: "fanmo")
                   (nunjavni-naselci canlu)))))
           (javni (nunjavni-morji
                    (nunjavni-jonai
                      (nunjavni-naselci jonai)
                      (nunjavni-naselci je))))
           (jonai (nunjavni-morji
                    (nunjavni-samselpla
                      samselpla-jonai
                      (nunjavni-je
                        (nunjavni-naselci je cmene: "cfari")
                        (nunjavni-+
                          (nunjavni-samselpla
                            samselpla-jonai-je
                            (nunjavni-je
                              (nunjavni-lerfu #\/)
                              (nunjavni-naselci canlu)
                              (nunjavni-naselci je cmene: "je")))
                          cmene:
                          "fanmo")))))
           (je (nunjavni-morji
                 (nunjavni-samselpla
                   samselpla-je
                   (nunjavni-je
                     (nunjavni-+ (nunjavni-naselci pajavni) cmene: "rodajavni")
                     (nunjavni-? (nunjavni-naselci cmene-sumti) cmene: "cmene")
                     (nunjavni-?
                       (nunjavni-naselci samselpla)
                       cmene:
                       "samselpla")))))
           (pajavni
             (nunjavni-morji
               (nunjavni-jonai
                 (nunjavni-naselci optional)
                 (nunjavni-naselci repetition0)
                 (nunjavni-naselci repetition1)
                 (nunjavni-naselci and-predicate)
                 (nunjavni-naselci end-of-input)
                 (nunjavni-naselci not-predicate)
                 (nunjavni-samselpla
                   samselpla-pajavni-cmene
                   (nunjavni-je
                     (nunjavni-? (nunjavni-naselci cmene-sumti) cmene: "cmene")
                     (nunjavni-naselci selci-javni cmene: "javni"))))))
           (optional
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-?
                 (nunjavni-je
                   (nunjavni-? (nunjavni-naselci cmene-sumti) cmene: "cmene")
                   (nunjavni-naselci selci-javni cmene: "javni")
                   (nunjavni-lerfu #\?)
                   (nunjavni-naselci canlu)))))
           (repetition0
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-*
                 (nunjavni-je
                   (nunjavni-? (nunjavni-naselci cmene-sumti) cmene: "cmene")
                   (nunjavni-naselci selci-javni cmene: "javni")
                   (nunjavni-lerfu #\*)
                   (nunjavni-naselci canlu)))))
           (repetition1
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-+
                 (nunjavni-je
                   (nunjavni-? (nunjavni-naselci cmene-sumti) cmene: "cmene")
                   (nunjavni-naselci selci-javni cmene: "javni")
                   (nunjavni-lerfu #\+)
                   (nunjavni-naselci canlu)))))
           (and-predicate
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-&
                 (nunjavni-je
                   (nunjavni-lerfu #\&)
                   (nunjavni-naselci canlu)
                   (nunjavni-naselci selci-javni cmene: "javni")))))
           (end-of-input
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-fanmo
                 (nunjavni-je
                   (nunjavni-lerfu #\!)
                   (nunjavni-naselci canlu)
                   (nunjavni-lerfu #\.)
                   (nunjavni-naselci canlu)))))
           (not-predicate
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-!
                 (nunjavni-je
                   (nunjavni-lerfu #\!)
                   (nunjavni-naselci canlu)
                   (nunjavni-naselci selci-javni cmene: "javni")))))
           (cmene-sumti
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-cmene-sumti
                 (nunjavni-je
                   (nunjavni-valsi "#:")
                   (nunjavni-re "[[:alpha:]_\\-]" cmene: "cfari")
                   (nunjavni-re "[[:alnum:]_\\-]*" cmene: "fanmo")
                   (nunjavni-naselci canlu)))))
           (selci-javni
             (nunjavni-morji
               (nunjavni-jonai
                 (nunjavni-naselci selci-naselci)
                 (nunjavni-naselci lerfu-selci)
                 (nunjavni-naselci valsi-selci)
                 (nunjavni-naselci klesi-selci)
                 (nunjavni-naselci denpabu)
                 (nunjavni-naselci girzu-javni))))
           (selci-naselci
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-selci-naselci
                 (nunjavni-je
                   (nunjavni-naselci naselci cmene: "naselci")
                   (nunjavni-! (nunjavni-valsi "<-"))))))
           (lerfu-selci
             (nunjavni-morji
               (nunjavni-jonai
                 (nunjavni-samselpla
                   samselpla-lerfu-selci
                   (nunjavni-je
                     (nunjavni-valsi "#\\")
                     (nunjavni-naselci lerfu-cmene cmene: "lerfu")
                     (nunjavni-naselci canlu)))
                 (nunjavni-samselpla
                   samselpla-lerfu-selci
                   (nunjavni-je
                     (nunjavni-valsi "#\\")
                     (nunjavni-. cmene: "lerfu")
                     (nunjavni-naselci canlu))))))
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
                         (nunjavni-naselci valsi-lerfu cmene: "lerfu")))
                     cmene:
                     "valsi-lerfu")
                   (nunjavni-lerfu #\")
                   (nunjavni-naselci canlu)))))
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
                     (nunjavni-naselci klesi-lerfu)
                     cmene:
                     "klesi-lerfu")
                   (nunjavni-lerfu #\])
                   (nunjavni-?
                     (nunjavni-jonai (nunjavni-valsi "*") (nunjavni-valsi "+"))
                     cmene:
                     "repeat")
                   (nunjavni-naselci canlu)))))
           (klesi-lerfu
             (nunjavni-morji
               (nunjavni-jonai
                 (nunjavni-naselci klesi-cmene)
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
                 (nunjavni-je (nunjavni-lerfu #\.) (nunjavni-naselci canlu)))))
           (samselpla
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-samselpla
                 (nunjavni-je
                   (nunjavni-lerfu #\{)
                   (nunjavni-naselci canlu)
                   (nunjavni-+
                     (nunjavni-samselpla
                       samselpla-samselpla-lerfu
                       (nunjavni-je
                         (nunjavni-! (nunjavni-lerfu #\}))
                         (nunjavni-. cmene: "lerfu")))
                     cmene:
                     "rodalerfu")
                   (nunjavni-lerfu #\})
                   (nunjavni-naselci canlu)))))
           (girzu-javni
             (nunjavni-morji
               (nunjavni-samselpla
                 samselpla-girzu-javni
                 (nunjavni-je
                   (nunjavni-lerfu #\()
                   (nunjavni-naselci canlu)
                   (nunjavni-naselci javni cmene: "javni")
                   (nunjavni-lerfu #\))
                   (nunjavni-naselci canlu)))))
           (canlu (nunjavni-morji
                    (nunjavni-samselpla
                      samselpla-canlu
                      (nunjavni-*
                        (nunjavni-jonai
                          (nunjavni-naselci canlubu)
                          (nunjavni-naselci totoi))))))
           (canlubu
             (nunjavni-morji
               (nunjavni-jonai
                 (nunjavni-lerfu #\space)
                 (nunjavni-lerfu #\tab)
                 (nunjavni-naselci CR)
                 (nunjavni-naselci LF))))
           (totoi (nunjavni-morji
                    (nunjavni-je
                      (nunjavni-lerfu #\;)
                      (nunjavni-*
                        (nunjavni-je
                          (nunjavni-! (nunjavni-naselci CRLF))
                          (nunjavni-.)))
                      (nunjavni-jonai
                        (nunjavni-naselci CRLF)
                        (nunjavni-& (nunjavni-naselci FAhO))))))
           (CR (nunjavni-morji (nunjavni-lerfu #\return)))
           (LF (nunjavni-morji (nunjavni-lerfu #\newline)))
           (CRLF (nunjavni-morji
                   (nunjavni-jonai
                     (nunjavni-je (nunjavni-naselci CR) (nunjavni-naselci LF))
                     (nunjavni-naselci CR)
                     (nunjavni-naselci LF))))
           (FAhO (nunjavni-morji (nunjavni-fanmo))))
    cfari))
