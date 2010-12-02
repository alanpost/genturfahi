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
  (let ()
    (define (cfari porsi mapti namapti) (cfari* porsi mapti namapti))
    (define (cfari-samselpla porsi mapti namapti)
      (cfari-samselpla* porsi mapti namapti))
    (define (gerna porsi mapti namapti) (gerna* porsi mapti namapti))
    (define (smuni porsi mapti namapti) (smuni* porsi mapti namapti))
    (define (naselci porsi mapti namapti) (naselci* porsi mapti namapti))
    (define (javni porsi mapti namapti) (javni* porsi mapti namapti))
    (define (jonai porsi mapti namapti) (jonai* porsi mapti namapti))
    (define (je porsi mapti namapti) (je* porsi mapti namapti))
    (define (pajavni porsi mapti namapti) (pajavni* porsi mapti namapti))
    (define (optional porsi mapti namapti) (optional* porsi mapti namapti))
    (define (repetition0 porsi mapti namapti)
      (repetition0* porsi mapti namapti))
    (define (repetition1 porsi mapti namapti)
      (repetition1* porsi mapti namapti))
    (define (and-predicate porsi mapti namapti)
      (and-predicate* porsi mapti namapti))
    (define (end-of-input porsi mapti namapti)
      (end-of-input* porsi mapti namapti))
    (define (not-predicate porsi mapti namapti)
      (not-predicate* porsi mapti namapti))
    (define (cmene-sumti porsi mapti namapti)
      (cmene-sumti* porsi mapti namapti))
    (define (selci-javni porsi mapti namapti)
      (selci-javni* porsi mapti namapti))
    (define (selci-naselci porsi mapti namapti)
      (selci-naselci* porsi mapti namapti))
    (define (lerfu-selci porsi mapti namapti)
      (lerfu-selci* porsi mapti namapti))
    (define (lerfu-cmene porsi mapti namapti)
      (lerfu-cmene* porsi mapti namapti))
    (define (valsi-selci porsi mapti namapti)
      (valsi-selci* porsi mapti namapti))
    (define (valsi-lerfu porsi mapti namapti)
      (valsi-lerfu* porsi mapti namapti))
    (define (klesi-selci porsi mapti namapti)
      (klesi-selci* porsi mapti namapti))
    (define (klesi-lerfu porsi mapti namapti)
      (klesi-lerfu* porsi mapti namapti))
    (define (klesi-cmene porsi mapti namapti)
      (klesi-cmene* porsi mapti namapti))
    (define (denpabu porsi mapti namapti) (denpabu* porsi mapti namapti))
    (define (samselpla porsi mapti namapti) (samselpla* porsi mapti namapti))
    (define (girzu-javni porsi mapti namapti)
      (girzu-javni* porsi mapti namapti))
    (define (canlu porsi mapti namapti) (canlu* porsi mapti namapti))
    (define (canlubu porsi mapti namapti) (canlubu* porsi mapti namapti))
    (define (totoi porsi mapti namapti) (totoi* porsi mapti namapti))
    (define (CR porsi mapti namapti) (CR* porsi mapti namapti))
    (define (LF porsi mapti namapti) (LF* porsi mapti namapti))
    (define (CRLF porsi mapti namapti) (CRLF* porsi mapti namapti))
    (define (FAhO porsi mapti namapti) (FAhO* porsi mapti namapti))
    (define cfari*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-cfari
          (morji-nunjavni-je
            canlu
            (morji-nunjavni-* cfari-samselpla cmene: "samselpla")
            canlu
            (morji-nunjavni-cmene gerna cmene: "gerna")
            FAhO))))
    (define cfari-samselpla*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-cfari-samselpla
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\{)
            canlu
            (morji-nunjavni-+
              (morji-nunjavni-samselpla
                samselpla-samselpla-lerfu
                (morji-nunjavni-je
                  (morji-nunjavni-! (morji-nunjavni-lerfu #\}))
                  (morji-nunjavni-. cmene: "lerfu")))
              cmene:
              "rodalerfu")
            (morji-nunjavni-lerfu #\})
            canlu))))
    (define gerna* (nunjavni-morji (morji-nunjavni-* smuni)))
    (define smuni*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-smuni
          (morji-nunjavni-je
            (morji-nunjavni-cmene naselci cmene: "naselci")
            (morji-nunjavni-valsi "<-")
            canlu
            (morji-nunjavni-cmene javni cmene: "javni")))))
    (define naselci*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-naselci
          (morji-nunjavni-je
            (morji-nunjavni-char-set
              (char-set-union
                char-set:letter
                (char-set #\_)
                (char-set #\\)
                (char-set #\-))
              cmene:
              "cfari")
            (morji-nunjavni-char-set-*
              (char-set-union
                char-set:letter+digit
                (char-set #\_)
                (char-set #\\)
                (char-set #\-))
              cmene:
              "fanmo")
            canlu))))
    (define javni* (nunjavni-morji (morji-nunjavni-jonai jonai je)))
    (define jonai*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-jonai
          (morji-nunjavni-je
            (morji-nunjavni-cmene je cmene: "cfari")
            (morji-nunjavni-+
              (morji-nunjavni-samselpla
                samselpla-jonai-je
                (morji-nunjavni-je
                  (morji-nunjavni-lerfu #\/)
                  canlu
                  (morji-nunjavni-cmene je cmene: "je")))
              cmene:
              "fanmo")))))
    (define je*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-je
          (morji-nunjavni-je
            (morji-nunjavni-+ pajavni cmene: "rodajavni")
            (morji-nunjavni-? cmene-sumti cmene: "cmene")
            (morji-nunjavni-? samselpla cmene: "samselpla")))))
    (define pajavni*
      (nunjavni-morji
        (morji-nunjavni-jonai
          optional
          repetition0
          repetition1
          and-predicate
          end-of-input
          not-predicate
          (morji-nunjavni-samselpla
            samselpla-pajavni-cmene
            (morji-nunjavni-je
              (morji-nunjavni-? cmene-sumti cmene: "cmene")
              (morji-nunjavni-cmene selci-javni cmene: "javni"))))))
    (define optional*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-?
          (morji-nunjavni-je
            (morji-nunjavni-? cmene-sumti cmene: "cmene")
            (morji-nunjavni-cmene selci-javni cmene: "javni")
            (morji-nunjavni-lerfu #\?)
            canlu))))
    (define repetition0*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-*
          (morji-nunjavni-je
            (morji-nunjavni-? cmene-sumti cmene: "cmene")
            (morji-nunjavni-cmene selci-javni cmene: "javni")
            (morji-nunjavni-lerfu #\*)
            canlu))))
    (define repetition1*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-+
          (morji-nunjavni-je
            (morji-nunjavni-? cmene-sumti cmene: "cmene")
            (morji-nunjavni-cmene selci-javni cmene: "javni")
            (morji-nunjavni-lerfu #\+)
            canlu))))
    (define and-predicate*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-&
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\&)
            canlu
            (morji-nunjavni-cmene selci-javni cmene: "javni")))))
    (define end-of-input*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-fanmo
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\!)
            canlu
            (morji-nunjavni-lerfu #\.)
            canlu))))
    (define not-predicate*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-!
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\!)
            canlu
            (morji-nunjavni-cmene selci-javni cmene: "javni")))))
    (define cmene-sumti*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-cmene-sumti
          (morji-nunjavni-je
            (morji-nunjavni-valsi "#:")
            (morji-nunjavni-char-set
              (char-set-union
                char-set:letter
                (char-set #\_)
                (char-set #\\)
                (char-set #\-))
              cmene:
              "cfari")
            (morji-nunjavni-char-set-*
              (char-set-union
                char-set:letter+digit
                (char-set #\_)
                (char-set #\\)
                (char-set #\-))
              cmene:
              "fanmo")
            canlu))))
    (define selci-javni*
      (nunjavni-morji
        (morji-nunjavni-jonai
          selci-naselci
          lerfu-selci
          valsi-selci
          klesi-selci
          denpabu
          girzu-javni)))
    (define selci-naselci*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-selci-naselci
          (morji-nunjavni-je
            (morji-nunjavni-cmene naselci cmene: "naselci")
            (morji-nunjavni-! (morji-nunjavni-valsi "<-"))))))
    (define lerfu-selci*
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-lerfu-selci
            (morji-nunjavni-je
              (morji-nunjavni-valsi "#\\")
              (morji-nunjavni-cmene lerfu-cmene cmene: "lerfu")
              canlu))
          (morji-nunjavni-samselpla
            samselpla-lerfu-selci
            (morji-nunjavni-je
              (morji-nunjavni-valsi "#\\")
              (morji-nunjavni-. cmene: "lerfu")
              canlu)))))
    (define lerfu-cmene*
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-lerfu-space
            (morji-nunjavni-valsi "space"))
          (morji-nunjavni-samselpla
            samselpla-lerfu-return
            (morji-nunjavni-valsi "return"))
          (morji-nunjavni-samselpla
            samselpla-lerfu-linefeed
            (morji-nunjavni-valsi "linefeed"))
          (morji-nunjavni-samselpla
            samselpla-lerfu-newline
            (morji-nunjavni-valsi "newline"))
          (morji-nunjavni-samselpla
            samselpla-lerfu-return
            (morji-nunjavni-valsi "return"))
          (morji-nunjavni-samselpla
            samselpla-lerfu-tab
            (morji-nunjavni-valsi "tab")))))
    (define valsi-selci*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-valsi-selci
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\")
            (morji-nunjavni-*
              (morji-nunjavni-samselpla
                samselpla-valsi-selci-lerfu
                (morji-nunjavni-je
                  (morji-nunjavni-! (morji-nunjavni-lerfu #\"))
                  (morji-nunjavni-cmene valsi-lerfu cmene: "lerfu")))
              cmene:
              "valsi-lerfu")
            (morji-nunjavni-lerfu #\")
            canlu))))
    (define valsi-lerfu*
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-valsi-newline
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\\)
              (morji-nunjavni-lerfu #\n)))
          (morji-nunjavni-samselpla
            samselpla-valsi-linefeed
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\\)
              (morji-nunjavni-lerfu #\r)))
          (morji-nunjavni-samselpla
            samselpla-valsi-tab
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\\)
              (morji-nunjavni-lerfu #\t)))
          (morji-nunjavni-samselpla
            samselpla-valsi-backslash
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\\)
              (morji-nunjavni-lerfu #\\)))
          (morji-nunjavni-samselpla
            samselpla-valsi-single-quote
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\\)
              (morji-nunjavni-lerfu #\')))
          (morji-nunjavni-samselpla
            samselpla-valsi-double-quote
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\\)
              (morji-nunjavni-lerfu #\")))
          (morji-nunjavni-samselpla
            samselpla-valsi-lerfu
            (morji-nunjavni-je
              (morji-nunjavni-! (morji-nunjavni-lerfu #\\))
              (morji-nunjavni-. cmene: "lerfu"))))))
    (define klesi-selci*
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-klesi-selci-*
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\[)
              (morji-nunjavni-+ klesi-lerfu cmene: "klesi-lerfu")
              (morji-nunjavni-valsi "]*")
              canlu))
          (morji-nunjavni-samselpla
            samselpla-klesi-selci-+
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\[)
              (morji-nunjavni-+ klesi-lerfu cmene: "klesi-lerfu")
              (morji-nunjavni-valsi "]+")
              canlu))
          (morji-nunjavni-samselpla
            samselpla-klesi-selci
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\[)
              (morji-nunjavni-+ klesi-lerfu cmene: "klesi-lerfu")
              (morji-nunjavni-lerfu #\])
              canlu)))))
    (define klesi-lerfu*
      (nunjavni-morji
        (morji-nunjavni-jonai
          klesi-cmene
          (morji-nunjavni-samselpla
            samselpla-klesi-lerfu
            (morji-nunjavni-je
              (morji-nunjavni-! (morji-nunjavni-lerfu #\]))
              (morji-nunjavni-. cmene: "klesi-lerfu"))))))
    (define klesi-cmene*
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-alnum
            (morji-nunjavni-valsi "[:alnum:]"))
          (morji-nunjavni-samselpla
            samselpla-alpha
            (morji-nunjavni-valsi "[:alpha:]"))
          (morji-nunjavni-samselpla
            samselpla-ascii
            (morji-nunjavni-valsi "[:ascii:]"))
          (morji-nunjavni-samselpla
            samselpla-blank
            (morji-nunjavni-valsi "[:blank:]"))
          (morji-nunjavni-samselpla
            samselpla-cntrl
            (morji-nunjavni-valsi "[:cntrl:]"))
          (morji-nunjavni-samselpla
            samselpla-digit
            (morji-nunjavni-valsi "[:digit:]"))
          (morji-nunjavni-samselpla
            samselpla-graph
            (morji-nunjavni-valsi "[:graph:]"))
          (morji-nunjavni-samselpla
            samselpla-lower
            (morji-nunjavni-valsi "[:lower:]"))
          (morji-nunjavni-samselpla
            samselpla-odigit
            (morji-nunjavni-valsi "[:odigit:]"))
          (morji-nunjavni-samselpla
            samselpla-print
            (morji-nunjavni-valsi "[:print:]"))
          (morji-nunjavni-samselpla
            samselpla-punct
            (morji-nunjavni-valsi "[:punct:]"))
          (morji-nunjavni-samselpla
            samselpla-space
            (morji-nunjavni-valsi "[:space:]"))
          (morji-nunjavni-samselpla
            samselpla-upper
            (morji-nunjavni-valsi "[:upper:]"))
          (morji-nunjavni-samselpla
            samselpla-xdigit
            (morji-nunjavni-valsi "[:xdigit:]"))
          (morji-nunjavni-samselpla
            samselpla-^alnum
            (morji-nunjavni-valsi "[:^alnum:]"))
          (morji-nunjavni-samselpla
            samselpla-^alpha
            (morji-nunjavni-valsi "[:^alpha:]"))
          (morji-nunjavni-samselpla
            samselpla-^ascii
            (morji-nunjavni-valsi "[:^ascii:]"))
          (morji-nunjavni-samselpla
            samselpla-^blank
            (morji-nunjavni-valsi "[:^blank:]"))
          (morji-nunjavni-samselpla
            samselpla-^cntrl
            (morji-nunjavni-valsi "[:^cntrl:]"))
          (morji-nunjavni-samselpla
            samselpla-^digit
            (morji-nunjavni-valsi "[:^digit:]"))
          (morji-nunjavni-samselpla
            samselpla-^graph
            (morji-nunjavni-valsi "[:^graph:]"))
          (morji-nunjavni-samselpla
            samselpla-^lower
            (morji-nunjavni-valsi "[:^lower:]"))
          (morji-nunjavni-samselpla
            samselpla-^odigit
            (morji-nunjavni-valsi "[:^odigit:]"))
          (morji-nunjavni-samselpla
            samselpla-^print
            (morji-nunjavni-valsi "[:^print:]"))
          (morji-nunjavni-samselpla
            samselpla-^punct
            (morji-nunjavni-valsi "[:^punct:]"))
          (morji-nunjavni-samselpla
            samselpla-^space
            (morji-nunjavni-valsi "[:^space:]"))
          (morji-nunjavni-samselpla
            samselpla-^upper
            (morji-nunjavni-valsi "[:^upper:]"))
          (morji-nunjavni-samselpla
            samselpla-^xdigit
            (morji-nunjavni-valsi "[:^xdigit:]")))))
    (define denpabu*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-denpabu
          (morji-nunjavni-je (morji-nunjavni-lerfu #\.) canlu))))
    (define samselpla*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-samselpla
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\{)
            canlu
            (morji-nunjavni-+
              (morji-nunjavni-samselpla
                samselpla-samselpla-lerfu
                (morji-nunjavni-je
                  (morji-nunjavni-! (morji-nunjavni-lerfu #\}))
                  (morji-nunjavni-. cmene: "lerfu")))
              cmene:
              "rodalerfu")
            (morji-nunjavni-lerfu #\})
            canlu))))
    (define girzu-javni*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-girzu-javni
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\()
            canlu
            (morji-nunjavni-cmene javni cmene: "javni")
            (morji-nunjavni-lerfu #\))
            canlu))))
    (define canlu*
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-canlu
          (morji-nunjavni-* (morji-nunjavni-jonai canlubu totoi)))))
    (define canlubu*
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-lerfu #\space)
          (morji-nunjavni-lerfu #\tab)
          CR
          LF)))
    (define totoi*
      (nunjavni-morji
        (morji-nunjavni-je
          (morji-nunjavni-lerfu #\;)
          (morji-nunjavni-*
            (morji-nunjavni-je (morji-nunjavni-! CRLF) (morji-nunjavni-.)))
          (morji-nunjavni-jonai CRLF (morji-nunjavni-& FAhO)))))
    (define CR* (nunjavni-morji (morji-nunjavni-lerfu #\return)))
    (define LF* (nunjavni-morji (morji-nunjavni-lerfu #\newline)))
    (define CRLF*
      (nunjavni-morji (morji-nunjavni-jonai (morji-nunjavni-je CR LF) CR LF)))
    (define FAhO* (nunjavni-morji (morji-nunjavni-fanmo)))
    (tolmohi-nunjavni)
    cfari*))
