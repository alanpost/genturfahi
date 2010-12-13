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
    (define (cfari-38 porsi mapti namapti) (cfari-39 porsi mapti namapti))
    (define (cfari-samselpla-2 porsi mapti namapti)
      (cfari-samselpla-40 porsi mapti namapti))
    (define (gerna-3 porsi mapti namapti) (gerna-41 porsi mapti namapti))
    (define (smuni-5 porsi mapti namapti) (smuni-42 porsi mapti namapti))
    (define (naselci-6 porsi mapti namapti) (naselci-43 porsi mapti namapti))
    (define (javni-7 porsi mapti namapti) (javni-44 porsi mapti namapti))
    (define (jonai-8 porsi mapti namapti) (jonai-45 porsi mapti namapti))
    (define (je-9 porsi mapti namapti) (je-46 porsi mapti namapti))
    (define (nastura-pajavni-10 porsi mapti namapti)
      (nastura-pajavni-47 porsi mapti namapti))
    (define (pajavni-13 porsi mapti namapti) (pajavni-48 porsi mapti namapti))
    (define (optional-14 porsi mapti namapti)
      (optional-49 porsi mapti namapti))
    (define (zero-or-more-15 porsi mapti namapti)
      (zero-or-more-50 porsi mapti namapti))
    (define (one-or-more-16 porsi mapti namapti)
      (one-or-more-51 porsi mapti namapti))
    (define (and-predicate-17 porsi mapti namapti)
      (and-predicate-52 porsi mapti namapti))
    (define (end-of-input-18 porsi mapti namapti)
      (end-of-input-53 porsi mapti namapti))
    (define (not-predicate-19 porsi mapti namapti)
      (not-predicate-54 porsi mapti namapti))
    (define (cmene-sumti-11 porsi mapti namapti)
      (cmene-sumti-55 porsi mapti namapti))
    (define (selci-javni-20 porsi mapti namapti)
      (selci-javni-56 porsi mapti namapti))
    (define (selci-naselci-21 porsi mapti namapti)
      (selci-naselci-57 porsi mapti namapti))
    (define (lerfu-selci-22 porsi mapti namapti)
      (lerfu-selci-58 porsi mapti namapti))
    (define (lerfu-cmene-27 porsi mapti namapti)
      (lerfu-cmene-59 porsi mapti namapti))
    (define (valsi-selci-23 porsi mapti namapti)
      (valsi-selci-60 porsi mapti namapti))
    (define (valsi-lerfu-28 porsi mapti namapti)
      (valsi-lerfu-61 porsi mapti namapti))
    (define (klesi-selci-24 porsi mapti namapti)
      (klesi-selci-62 porsi mapti namapti))
    (define (klesi-lerfu-29 porsi mapti namapti)
      (klesi-lerfu-63 porsi mapti namapti))
    (define (klesi-cmene-30 porsi mapti namapti)
      (klesi-cmene-64 porsi mapti namapti))
    (define (denpabu-25 porsi mapti namapti) (denpabu-65 porsi mapti namapti))
    (define (samselpla-12 porsi mapti namapti)
      (samselpla-66 porsi mapti namapti))
    (define (samselpla-xadni-31 porsi mapti namapti)
      (samselpla-xadni-67 porsi mapti namapti))
    (define (samselpla-cmene-32 porsi mapti namapti)
      (samselpla-cmene-68 porsi mapti namapti))
    (define (girzu-javni-26 porsi mapti namapti)
      (girzu-javni-69 porsi mapti namapti))
    (define (canlu-1 porsi mapti namapti) (canlu-70 porsi mapti namapti))
    (define (canlubu-33 porsi mapti namapti) (canlubu-71 porsi mapti namapti))
    (define (totoi-34 porsi mapti namapti) (totoi-72 porsi mapti namapti))
    (define (CR-35 porsi mapti namapti) (CR-73 porsi mapti namapti))
    (define (LF-36 porsi mapti namapti) (LF-74 porsi mapti namapti))
    (define (CRLF-37 porsi mapti namapti) (CRLF-75 porsi mapti namapti))
    (define (FAhO-4 porsi mapti namapti) (FAhO-76 porsi mapti namapti))
    (define cfari-39
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-cfari
          (morji-nunjavni-je
            canlu-1
            (morji-nunjavni-* cfari-samselpla-2 nastura: #t)
            canlu-1
            (morji-nunjavni-cmene gerna-3 cmene: "gerna")
            FAhO-4))))
    (define cfari-samselpla-40
      (nunjavni-morji
        (morji-nunjavni-samselpla-cabna
          samselpla-cfari-samselpla
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\{)
            canlu-1
            (morji-nunjavni-+
              (morji-nunjavni-je
                (morji-nunjavni-! (morji-nunjavni-lerfu #\}))
                (morji-nunjavni-.))
              cmene:
              "rodalerfu")
            (morji-nunjavni-lerfu #\})
            canlu-1))))
    (define gerna-41 (nunjavni-morji (morji-nunjavni-* smuni-5)))
    (define smuni-42
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-smuni
          (morji-nunjavni-je
            (morji-nunjavni-cmene naselci-6 cmene: "naselci")
            (morji-nunjavni-valsi "<-")
            canlu-1
            (morji-nunjavni-cmene javni-7 cmene: "javni")))))
    (define naselci-43
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-naselci
          (morji-nunjavni-je
            (morji-nunjavni-char-set
              (char-set-union
                char-set:letter+digit
                (char-set #\$)
                (char-set #\%)
                (char-set #\:)
                (char-set #\=)
                (char-set #\>)
                (char-set #\^)
                (char-set #\~)
                (char-set #\_)
                (char-set #\@))
              cmene:
              "cfari")
            (morji-nunjavni-char-set-*
              (char-set-union
                char-set:letter+digit
                (char-set #\$)
                (char-set #\%)
                (char-set #\:)
                (char-set #\=)
                (char-set #\>)
                (char-set #\^)
                (char-set #\~)
                (char-set #\_)
                (char-set #\@)
                (char-set #\.)
                (char-set #\!)
                (char-set #\&)
                (char-set #\/)
                (char-set #\\)
                (char-set #\-))
              cmene:
              "fanmo")
            canlu-1))))
    (define javni-44 (nunjavni-morji (morji-nunjavni-jonai jonai-8 je-9)))
    (define jonai-45
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-jonai
          (morji-nunjavni-je
            (morji-nunjavni-cmene je-9 cmene: "cfari")
            (morji-nunjavni-+
              (morji-nunjavni-je (morji-nunjavni-lerfu #\/) canlu-1 je-9)
              cmene:
              "fanmo")))))
    (define je-46
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-je
          (morji-nunjavni-je
            (morji-nunjavni-+ nastura-pajavni-10 cmene: "javni")
            (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
            (morji-nunjavni-? samselpla-12 cmene: "samselpla")))))
    (define nastura-pajavni-47
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-nastura-javni
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\`)
              canlu-1
              (morji-nunjavni-cmene pajavni-13 cmene: "javni")))
          pajavni-13)))
    (define pajavni-48
      (nunjavni-morji
        (morji-nunjavni-jonai
          optional-14
          zero-or-more-15
          one-or-more-16
          and-predicate-17
          end-of-input-18
          not-predicate-19
          (morji-nunjavni-samselpla
            samselpla-pajavni-cmene
            (morji-nunjavni-je
              (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
              (morji-nunjavni-cmene selci-javni-20 cmene: "javni"))))))
    (define optional-49
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-?
          (morji-nunjavni-je
            (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
            (morji-nunjavni-cmene selci-javni-20 cmene: "javni")
            (morji-nunjavni-lerfu #\?)
            canlu-1))))
    (define zero-or-more-50
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-*
          (morji-nunjavni-je
            (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
            (morji-nunjavni-cmene selci-javni-20 cmene: "javni")
            (morji-nunjavni-lerfu #\*)
            canlu-1))))
    (define one-or-more-51
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-+
          (morji-nunjavni-je
            (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
            (morji-nunjavni-cmene selci-javni-20 cmene: "javni")
            (morji-nunjavni-lerfu #\+)
            canlu-1))))
    (define and-predicate-52
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-&
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\&)
            canlu-1
            (morji-nunjavni-cmene selci-javni-20 cmene: "javni")))))
    (define end-of-input-53
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-fanmo
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\!)
            canlu-1
            (morji-nunjavni-lerfu #\.)
            canlu-1))))
    (define not-predicate-54
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-!
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\!)
            canlu-1
            (morji-nunjavni-cmene selci-javni-20 cmene: "javni")))))
    (define cmene-sumti-55
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-cmene-sumti
          (morji-nunjavni-je
            (morji-nunjavni-valsi "#:")
            (morji-nunjavni-char-set
              (char-set-union
                char-set:letter+digit
                (char-set #\$)
                (char-set #\%)
                (char-set #\:)
                (char-set #\=)
                (char-set #\>)
                (char-set #\^)
                (char-set #\~)
                (char-set #\_)
                (char-set #\@))
              cmene:
              "cfari")
            (morji-nunjavni-char-set-*
              (char-set-union
                char-set:letter+digit
                (char-set #\$)
                (char-set #\%)
                (char-set #\:)
                (char-set #\=)
                (char-set #\>)
                (char-set #\^)
                (char-set #\~)
                (char-set #\_)
                (char-set #\@)
                (char-set #\.)
                (char-set #\!)
                (char-set #\&)
                (char-set #\/)
                (char-set #\\)
                (char-set #\-))
              cmene:
              "fanmo")
            canlu-1))))
    (define selci-javni-56
      (nunjavni-morji
        (morji-nunjavni-jonai
          selci-naselci-21
          lerfu-selci-22
          valsi-selci-23
          klesi-selci-24
          denpabu-25
          girzu-javni-26)))
    (define selci-naselci-57
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-selci-naselci
          (morji-nunjavni-je
            (morji-nunjavni-cmene naselci-6 cmene: "naselci")
            (morji-nunjavni-! (morji-nunjavni-valsi "<-"))))))
    (define lerfu-selci-58
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-stura-lerfu-selci
            (morji-nunjavni-je
              (morji-nunjavni-valsi ",#\\")
              (morji-nunjavni-cmene lerfu-cmene-27 cmene: "lerfu")
              canlu-1))
          (morji-nunjavni-samselpla
            samselpla-stura-lerfu-selci
            (morji-nunjavni-je
              (morji-nunjavni-valsi ",#\\")
              (morji-nunjavni-. cmene: "lerfu")
              canlu-1))
          (morji-nunjavni-samselpla
            samselpla-lerfu-selci
            (morji-nunjavni-je
              (morji-nunjavni-valsi "#\\")
              (morji-nunjavni-cmene lerfu-cmene-27 cmene: "lerfu")
              canlu-1))
          (morji-nunjavni-samselpla
            samselpla-lerfu-selci
            (morji-nunjavni-je
              (morji-nunjavni-valsi "#\\")
              (morji-nunjavni-. cmene: "lerfu")
              canlu-1)))))
    (define lerfu-cmene-59
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
    (define valsi-selci-60
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-stura-empty-string
            (morji-nunjavni-je (morji-nunjavni-valsi ",\"\"") canlu-1))
          (morji-nunjavni-samselpla
            samselpla-empty-string
            (morji-nunjavni-je (morji-nunjavni-valsi "\"\"") canlu-1))
          (morji-nunjavni-samselpla
            samselpla-stura-valsi-selci
            (morji-nunjavni-je
              (morji-nunjavni-valsi ",\"")
              (morji-nunjavni-+
                (morji-nunjavni-je
                  (morji-nunjavni-! (morji-nunjavni-lerfu #\"))
                  valsi-lerfu-28)
                cmene:
                "valsi-lerfu")
              (morji-nunjavni-lerfu #\")
              canlu-1))
          (morji-nunjavni-samselpla
            samselpla-valsi-selci
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\")
              (morji-nunjavni-+
                (morji-nunjavni-je
                  (morji-nunjavni-! (morji-nunjavni-lerfu #\"))
                  valsi-lerfu-28)
                cmene:
                "valsi-lerfu")
              (morji-nunjavni-lerfu #\")
              canlu-1)))))
    (define valsi-lerfu-61
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
    (define klesi-selci-62
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-klesi-selci-*
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\[)
              (morji-nunjavni-+ klesi-lerfu-29 cmene: "klesi-lerfu")
              (morji-nunjavni-valsi "]*")
              canlu-1))
          (morji-nunjavni-samselpla
            samselpla-klesi-selci-+
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\[)
              (morji-nunjavni-+ klesi-lerfu-29 cmene: "klesi-lerfu")
              (morji-nunjavni-valsi "]+")
              canlu-1))
          (morji-nunjavni-samselpla
            samselpla-klesi-selci
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\[)
              (morji-nunjavni-+ klesi-lerfu-29 cmene: "klesi-lerfu")
              (morji-nunjavni-lerfu #\])
              canlu-1)))))
    (define klesi-lerfu-63
      (nunjavni-morji
        (morji-nunjavni-jonai
          klesi-cmene-30
          (morji-nunjavni-samselpla
            samselpla-klesi-lerfu
            (morji-nunjavni-je
              (morji-nunjavni-! (morji-nunjavni-lerfu #\]))
              (morji-nunjavni-. cmene: "klesi-lerfu"))))))
    (define klesi-cmene-64
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
    (define denpabu-65
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-denpabu
          (morji-nunjavni-je (morji-nunjavni-lerfu #\.) canlu-1))))
    (define samselpla-66
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-samselpla-balvi
            (morji-nunjavni-je
              (morji-nunjavni-valsi "->")
              canlu-1
              (morji-nunjavni-jonai samselpla-xadni-31 samselpla-cmene-32)))
          (morji-nunjavni-samselpla
            samselpla-samselpla-cabna
            (morji-nunjavni-je
              (morji-nunjavni-valsi "-|")
              canlu-1
              (morji-nunjavni-jonai samselpla-xadni-31 samselpla-cmene-32))))))
    (define samselpla-xadni-67
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-samselpla-xadni
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\{)
            canlu-1
            (morji-nunjavni-+
              (morji-nunjavni-je
                (morji-nunjavni-! (morji-nunjavni-lerfu #\}))
                (morji-nunjavni-.))
              cmene:
              "rodalerfu")
            (morji-nunjavni-lerfu #\})
            canlu-1))))
    (define samselpla-cmene-68
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-samselpla-cmene
          (morji-nunjavni-je
            (morji-nunjavni-char-set
              (char-set-union
                char-set:letter+digit
                (char-set #\$)
                (char-set #\%)
                (char-set #\:)
                (char-set #\=)
                (char-set #\>)
                (char-set #\^)
                (char-set #\~)
                (char-set #\_)
                (char-set #\@))
              cmene:
              "cfari")
            (morji-nunjavni-char-set-*
              (char-set-union
                char-set:letter+digit
                (char-set #\$)
                (char-set #\%)
                (char-set #\:)
                (char-set #\=)
                (char-set #\>)
                (char-set #\^)
                (char-set #\~)
                (char-set #\_)
                (char-set #\@)
                (char-set #\.)
                (char-set #\!)
                (char-set #\&)
                (char-set #\/)
                (char-set #\\)
                (char-set #\-))
              cmene:
              "fanmo")
            canlu-1))))
    (define girzu-javni-69
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-empty-list
            (morji-nunjavni-je (morji-nunjavni-valsi "()") canlu-1))
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\()
            canlu-1
            javni-7
            (morji-nunjavni-lerfu #\))
            canlu-1))))
    (define canlu-70
      (nunjavni-morji
        (morji-nunjavni-*
          (morji-nunjavni-jonai canlubu-33 totoi-34)
          nastura:
          #t)))
    (define canlubu-71
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-lerfu #\space)
          (morji-nunjavni-lerfu #\tab)
          CR-35
          LF-36)))
    (define totoi-72
      (nunjavni-morji
        (morji-nunjavni-je
          (morji-nunjavni-lerfu #\;)
          (morji-nunjavni-*
            (morji-nunjavni-je (morji-nunjavni-! CRLF-37) (morji-nunjavni-.)))
          (morji-nunjavni-jonai CRLF-37 (morji-nunjavni-& FAhO-4)))))
    (define CR-73 (nunjavni-morji (morji-nunjavni-lerfu #\return)))
    (define LF-74 (nunjavni-morji (morji-nunjavni-lerfu #\newline)))
    (define CRLF-75
      (nunjavni-morji
        (morji-nunjavni-jonai (morji-nunjavni-je CR-35 LF-36) CR-35 LF-36)))
    (define FAhO-76 (nunjavni-morji (morji-nunjavni-fanmo nastura: #t)))
    (tolmohi-nunjavni)
    cfari-39))
