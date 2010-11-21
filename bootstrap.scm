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
;;; PEG grammar paser
;;;
(define genturfahi-peg
  (letrec
    ((cfari          (nunjavni-morji
                       (nunjavni-samselpla
                         (lambda (#!key gerna) (samselpla-cfari gerna))
                         (nunjavni-je
                           (nunjavni-naselci canlu)
                           (nunjavni-cmene
                             (nunjavni-naselci gerna)
                             cmene: 'gerna:)
                           (nunjavni-naselci FAhO)))))

     (gerna          (nunjavni-morji
                       (nunjavni-samselpla
                         ;; can we get rid of key?
                         (lambda (#!key smuni) (samselpla-gerna smuni))
                           (nunjavni-*
                             (nunjavni-naselci smuni)
                             cmene: 'smuni:))))

     (smuni          (nunjavni-morji
                       (nunjavni-samselpla
                         (lambda (#!key naselci javni samselpla)
                           (samselpla-smuni naselci javni samselpla))
                         (nunjavni-je
                           (nunjavni-cmene
                             (nunjavni-naselci naselci)
                             cmene: 'naselci:)
                           (nunjavni-valsi "<-")
                           (nunjavni-naselci canlu)
                           (nunjavni-cmene
                             (nunjavni-naselci javni)
                             cmene: 'javni:)
                           (nunjavni-?
                             (nunjavni-naselci samselpla)
                             cmene: 'samselpla:)))))

     (naselci        (nunjavni-morji
                       (nunjavni-samselpla
                         (lambda (#!key cfari fanmo)
                           (samselpla-naselci cfari fanmo))
                         (nunjavni-je
                           (nunjavni-re "[a-zA-Z_\\-]" cmene: 'cfari:)
                           (nunjavni-re "[a-zA-Z0-9_\\-]*" cmene: 'fanmo:)
                           (nunjavni-naselci canlu)))))

     (javni          (nunjavni-morji
                       (nunjavni-jonai
                         (nunjavni-naselci jonai)
                         (nunjavni-naselci je))))

     (jonai          (nunjavni-morji
                       (nunjavni-samselpla
                         (lambda (#!key cfari fanmo)
                           (apply samselpla-jonai cfari fanmo))
                         (nunjavni-je
                           (nunjavni-cmene
                             (nunjavni-naselci je)
                             cmene: 'cfari:)
                           (nunjavni-+
                             (nunjavni-samselpla
                               ; this could be an ignore rule, if
                               ; we don't require keys.
                               (lambda (#!key porsi-javni) porsi-javni)
                               (nunjavni-je
                                 (nunjavni-lerfu #\/)
                                 (nunjavni-naselci canlu)
                                 (nunjavni-cmene
                                   (nunjavni-naselci je)
                                   cmene: 'porsi-javni:)))
                             cmene: 'fanmo:)))))
     (je             (nunjavni-morji
                       ; XXX: could have implied tag.
                       (nunjavni-samselpla
                         (lambda (#!key rodajavni)
                           (apply samselpla-je rodajavni))
                         (nunjavni-+
                           (nunjavni-naselci unary_rule)
                           cmene: 'rodajavni:))))

     (unary_rule     (nunjavni-morji
                       (nunjavni-jonai
                         (nunjavni-naselci optional)
                         (nunjavni-naselci repetition0)
                         (nunjavni-naselci repetition1)
                         (nunjavni-naselci and-predicate)
                         (nunjavni-naselci end-of-input)
                         (nunjavni-naselci not-predicate)
                         (nunjavni-naselci selci-javni))))

     (optional       (nunjavni-morji
                       (nunjavni-samselpla
                         (lambda (#!key cmene selci-javni)
                           (samselpla-? cmene selci-javni))
                         (nunjavni-je
                           (nunjavni-?
                             (nunjavni-naselci cmene-sumti)
                             cmene: 'cmene:)
                           (nunjavni-cmene
                             (nunjavni-naselci selci-javni)
                             cmene: 'selci-javni:)
                           (nunjavni-lerfu #\?)
                           (nunjavni-naselci canlu)))))
     (repetition0    (nunjavni-morji
                       (nunjavni-samselpla
                         (lambda (#!key cmene selci-javni)
                           (samselpla-* cmene selci-javni))
                         (nunjavni-je
                           (nunjavni-?
                             (nunjavni-naselci cmene-sumti)
                             cmene: 'cmene:)
                           (nunjavni-cmene
                             (nunjavni-naselci selci-javni)
                             cmene: 'selci-javni:)
                           (nunjavni-lerfu #\*)
                           (nunjavni-naselci canlu)))))
     (repetition1    (nunjavni-morji
                       (nunjavni-samselpla
                         (lambda (#!key cmene selci-javni)
                           (samselpla-+ cmene selci-javni))
                         (nunjavni-je
                           (nunjavni-?
                             (nunjavni-naselci cmene-sumti)
                             cmene: 'cmene:)
                           (nunjavni-cmene
                             (nunjavni-naselci selci-javni)
                             cmene: 'selci-javni:)
                           (nunjavni-lerfu #\+)
                           (nunjavni-naselci canlu)))))
     (and-predicate  (nunjavni-morji
                       (nunjavni-samselpla
                         (lambda (#!key selci-javni)
                           (samselpla-& selci-javni))
                         (nunjavni-je
                           (nunjavni-lerfu #\&)
                           (nunjavni-naselci canlu)
                           (nunjavni-cmene
                             (nunjavni-naselci selci-javni)
                             cmene: 'selci-javni:)))))
     (end-of-input   (nunjavni-morji
                       (nunjavni-samselpla
                         (lambda ()
                           (samselpla-fanmo))
                         (nunjavni-je
                           (nunjavni-lerfu #\!)
                           (nunjavni-naselci canlu)
                           (nunjavni-lerfu #\.)
                           (nunjavni-naselci canlu)))))
     (not-predicate  (nunjavni-morji
                       (nunjavni-samselpla
                         (lambda (#!key selci-javni)
                           (samselpla-! selci-javni))
                         (nunjavni-je
                           (nunjavni-lerfu #\!)
                           (nunjavni-naselci canlu)
                           (nunjavni-cmene
                             (nunjavni-naselci selci-javni)
                             cmene: 'selci-javni:)))))

     (cmene-sumti    (nunjavni-morji
                       (nunjavni-samselpla
                         samselpla-cmene-sumti
                         (nunjavni-je
                           (nunjavni-lerfu #\#)
                           (nunjavni-re "[A-Za-z_-]" cmene: 'cfari:)
                           (nunjavni-re "[A-Za-z0-9_-]*" cmene: 'fanmo:)
                           (nunjavni-lerfu #\:)
                           (nunjavni-naselci canlu)))))

     (selci-javni    (nunjavni-morji
                       (nunjavni-jonai
                         (nunjavni-naselci selci-naselci)
                         (nunjavni-naselci lerfu-selci)
                         (nunjavni-naselci valsi-selci)
                         (nunjavni-naselci klesi-selci)
                         (nunjavni-naselci denpabu)
                         (nunjavni-naselci girzu-javni))))

     (selci-naselci  (nunjavni-morji
                       (nunjavni-samselpla
                         (lambda (#!key naselci)
                           (samselpla-selci-naselci #f naselci))
                         (nunjavni-je
                           (nunjavni-cmene
                             (nunjavni-naselci naselci)
                             cmene: 'naselci:)
                           (nunjavni-! (nunjavni-valsi "<-"))))))

     (lerfu-selci    (nunjavni-morji
                       (nunjavni-samselpla
                         (lambda (#!key lerfu)
                           (samselpla-lerfu-selci lerfu))
                         (nunjavni-jonai
                           (nunjavni-je
                             (nunjavni-valsi "#\\")
                             (nunjavni-cmene
                               (nunjavni-naselci lerfu-cmene)
                               cmene: 'lerfu:)
                             (nunjavni-naselci canlu))
                           (nunjavni-je
                             (nunjavni-valsi "#\\")
                             (nunjavni-. cmene: 'lerfu:)
                             (nunjavni-naselci canlu))))))

     (lerfu-cmene    (nunjavni-morji
                       (nunjavni-jonai
                         (nunjavni-samselpla
                           (lambda () #\space)
                           (nunjavni-valsi "space"))
                         (nunjavni-samselpla
                           (lambda () #\linefeed)
                           (nunjavni-valsi "linefeed"))
                         (nunjavni-samselpla
                           (lambda () #\newline)
                           (nunjavni-valsi "newline"))
                         (nunjavni-samselpla
                           (lambda () #\return)
                           (nunjavni-valsi "return"))
                         (nunjavni-samselpla
                           (lambda () #\tab)
                           (nunjavni-valsi "tab")))))

     (valsi-selci    (nunjavni-morji
                       (nunjavni-samselpla
                         (lambda (#!key valsi-lerfu)
                           (samselpla-valsi-selci
                             (apply string-append valsi-lerfu)))
                         (nunjavni-je
                           (nunjavni-lerfu #\")
                             (nunjavni-*
                               (nunjavni-samselpla
                                 (lambda (#!key valsi-lerfu)
                                   valsi-lerfu)
                                 (nunjavni-je
                                   (nunjavni-! (nunjavni-lerfu #\"))
                                   (nunjavni-cmene
                                     (nunjavni-naselci valsi-lerfu)
                                     cmene: 'valsi-lerfu:)))
                               cmene: 'valsi-lerfu:)
                             (nunjavni-lerfu #\")
                             (nunjavni-naselci canlu)))))

     (valsi-lerfu    (nunjavni-morji
                       (nunjavni-jonai
                         (nunjavni-valsi "\\n")
                         (nunjavni-valsi "\\r")
                         (nunjavni-valsi "\\t")
                         (nunjavni-valsi "\\\\")
                         (nunjavni-valsi "\\\'")
                         (nunjavni-valsi "\\\"")
                         (nunjavni-samselpla
                           ; XXX: here we could ignore the !, but
                           ;      we'd also like to ignore the je
                           ;      that goes with it.
                           (lambda (#!key lerfu) (make-string 1 lerfu))
                           (nunjavni-je
                             (nunjavni-! (nunjavni-lerfu #\\))
                             (nunjavni-. cmene: 'lerfu:))))))

     (klesi-selci    (nunjavni-morji
                       (nunjavni-samselpla
                         (lambda (#!key klesi-lerfu repeat)
                           (samselpla-klesi-selci
                             (string-append
                               "["
                               (apply
                                 (lambda (klesi-lerfu)
                                   (string-append "[" klesi-lerfu "]"))
                                 klesi-lerfu)
                               "]"
                               repeat)))
                         (nunjavni-je
                           (nunjavni-lerfu #\[)
                           (nunjavni-+
                             (nunjavni-naselci klesi-lerfu)
                             cmene: 'klesi-lerfu:)

                           (nunjavni-lerfu #\])
                           (nunjavni-?
                             (nunjavni-jonai
                               (nunjavni-valsi "*")
                               (nunjavni-valsi "+"))
                             cmene: 'repeat:)
                           (nunjavni-naselci canlu)))))

     (klesi-lerfu    (nunjavni-morji
                       (nunjavni-jonai
                         (nunjavni-naselci klesi-cmene)
                         (nunjavni-samselpla
                           (lambda (#!key klesi-lerfu)
                             (string klesi-lerfu))
                           (nunjavni-je
                             (nunjavni-! (nunjavni-lerfu #\]))
                             (nunjavni-. cmene: 'klesi-lerfu:))))))

     (klesi-cmene    (nunjavni-morji
                       (nunjavni-jonai
                         (nunjavni-valsi ":alnum:")
                         (nunjavni-valsi ":alpha:")
                         (nunjavni-valsi ":ascii:")
                         (nunjavni-valsi ":blank:")
                         (nunjavni-valsi ":cntrl:")
                         (nunjavni-valsi ":digit:")
                         (nunjavni-valsi ":graph:")
                         (nunjavni-valsi ":lower:")
                         (nunjavni-samselpla
                           (lambda () "0-7")
                           (nunjavni-valsi ":odigit:"))
                         (nunjavni-valsi ":print:")
                         (nunjavni-valsi ":punct:")
                         (nunjavni-valsi ":space:")
                         (nunjavni-valsi ":upper:")
                         (nunjavni-valsi ":word:")
                         (nunjavni-valsi ":xdigit:"))))

     (denpabu        (nunjavni-morji
                       (nunjavni-samselpla
                         (lambda ()
                           (samselpla-denpabu))
                         (nunjavni-je
                           (nunjavni-lerfu #\.)
                           (nunjavni-naselci canlu)))))

     (samselpla      (nunjavni-morji
                       (nunjavni-samselpla
                         (lambda (#!key samselpla) samselpla)
                         (nunjavni-je
                           (nunjavni-lerfu #\{)
                           (nunjavni-naselci canlu)
                           (nunjavni-samselpla
                             (lambda (#!key samselpla-lerfu)
                               (apply string samselpla-lerfu))
                             (nunjavni-*
                               (nunjavni-samselpla
                                 (lambda (#!key lerfu) lerfu)
                                 (nunjavni-je
                                   (nunjavni-!
                                     (nunjavni-lerfu #\}))
                                   (nunjavni-. cmene: 'lerfu:)))
                               cmene: 'samselpla-lerfu:)
                             cmene: 'samselpla:)
                           (nunjavni-lerfu #\})
                           (nunjavni-naselci canlu)))))

     (girzu-javni    (nunjavni-morji
                       (nunjavni-samselpla
                         (lambda (#!key javni)
                           javni)
                         (nunjavni-je
                           (nunjavni-lerfu #\()
                           (nunjavni-naselci canlu)
                           (nunjavni-cmene
                             (nunjavni-naselci javni)
                             cmene: 'javni:)
                           (nunjavni-lerfu #\))
                           (nunjavni-naselci canlu)))))

     (canlu          (nunjavni-morji
                       (nunjavni-samselpla
                         (lambda () (samselpla-canlu))
                         (nunjavni-*
                           (nunjavni-jonai
                             (nunjavni-naselci canlubu)
                             (nunjavni-naselci totoi))))))

     (canlubu        (nunjavni-morji
                       (nunjavni-jonai
                         (nunjavni-lerfu #\space)
                         (nunjavni-lerfu #\tab)
                         (nunjavni-naselci CR)
                         (nunjavni-naselci LF))))
     (totoi          (nunjavni-morji
                       (nunjavni-je
                         (nunjavni-lerfu #\;)
                         (nunjavni-*
                           (nunjavni-je
                             (nunjavni-! (nunjavni-naselci CRLF))
                             (nunjavni-.)))
                         (nunjavni-jonai
                           (nunjavni-naselci CRLF)
                           (nunjavni-& (nunjavni-naselci FAhO))))))

     ; XXX: is this rule so fast that it shouldn't memoize?
     (CR             (nunjavni-morji
                       (nunjavni-lerfu #\return)))
     (LF             (nunjavni-morji
                       (nunjavni-lerfu #\linefeed)))
     (CRLF           (nunjavni-morji
                       (nunjavni-jonai
                         (nunjavni-je
                           (nunjavni-naselci CR)
                           (nunjavni-naselci LF))
                         (nunjavni-naselci CR)
                         (nunjavni-naselci LF))))
     (FAhO           (nunjavni-morji
                       (nunjavni-fanmo))))
    (genturfahi cfari)))
