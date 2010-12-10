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
    (define (cfari-5 porsi mapti namapti) (cfari-6 porsi mapti namapti))
    (define (cfari-samselpla-2 porsi mapti namapti)
      (cfari-samselpla-7 porsi mapti namapti))
    (define (gerna-3 porsi mapti namapti) (gerna-9 porsi mapti namapti))
    (define (smuni-8 porsi mapti namapti) (smuni-12 porsi mapti namapti))
    (define (naselci-10 porsi mapti namapti) (naselci-13 porsi mapti namapti))
    (define (javni-11 porsi mapti namapti) (javni-16 porsi mapti namapti))
    (define (jonai-14 porsi mapti namapti) (jonai-17 porsi mapti namapti))
    (define (je-15 porsi mapti namapti) (je-21 porsi mapti namapti))
    (define (pajavni-18 porsi mapti namapti) (pajavni-29 porsi mapti namapti))
    (define (optional-22 porsi mapti namapti)
      (optional-30 porsi mapti namapti))
    (define (repetition0-23 porsi mapti namapti)
      (repetition0-31 porsi mapti namapti))
    (define (repetition1-24 porsi mapti namapti)
      (repetition1-32 porsi mapti namapti))
    (define (and-predicate-25 porsi mapti namapti)
      (and-predicate-33 porsi mapti namapti))
    (define (end-of-input-26 porsi mapti namapti)
      (end-of-input-34 porsi mapti namapti))
    (define (not-predicate-27 porsi mapti namapti)
      (not-predicate-35 porsi mapti namapti))
    (define (cmene-sumti-19 porsi mapti namapti)
      (cmene-sumti-36 porsi mapti namapti))
    (define (selci-javni-28 porsi mapti namapti)
      (selci-javni-43 porsi mapti namapti))
    (define (selci-naselci-37 porsi mapti namapti)
      (selci-naselci-44 porsi mapti namapti))
    (define (lerfu-selci-38 porsi mapti namapti)
      (lerfu-selci-46 porsi mapti namapti))
    (define (lerfu-cmene-45 porsi mapti namapti)
      (lerfu-cmene-47 porsi mapti namapti))
    (define (valsi-selci-39 porsi mapti namapti)
      (valsi-selci-49 porsi mapti namapti))
    (define (valsi-lerfu-48 porsi mapti namapti)
      (valsi-lerfu-50 porsi mapti namapti))
    (define (klesi-selci-40 porsi mapti namapti)
      (klesi-selci-52 porsi mapti namapti))
    (define (klesi-lerfu-51 porsi mapti namapti)
      (klesi-lerfu-54 porsi mapti namapti))
    (define (klesi-cmene-53 porsi mapti namapti)
      (klesi-cmene-55 porsi mapti namapti))
    (define (denpabu-41 porsi mapti namapti) (denpabu-56 porsi mapti namapti))
    (define (samselpla-20 porsi mapti namapti)
      (samselpla-59 porsi mapti namapti))
    (define (samselpla-xadni-57 porsi mapti namapti)
      (samselpla-xadni-60 porsi mapti namapti))
    (define (samselpla-cmene-58 porsi mapti namapti)
      (samselpla-cmene-61 porsi mapti namapti))
    (define (girzu-javni-42 porsi mapti namapti)
      (girzu-javni-62 porsi mapti namapti))
    (define (canlu-1 porsi mapti namapti) (canlu-65 porsi mapti namapti))
    (define (canlubu-63 porsi mapti namapti) (canlubu-68 porsi mapti namapti))
    (define (totoi-64 porsi mapti namapti) (totoi-70 porsi mapti namapti))
    (define (CR-66 porsi mapti namapti) (CR-71 porsi mapti namapti))
    (define (LF-67 porsi mapti namapti) (LF-72 porsi mapti namapti))
    (define (CRLF-69 porsi mapti namapti) (CRLF-73 porsi mapti namapti))
    (define (FAhO-4 porsi mapti namapti) (FAhO-74 porsi mapti namapti))
    (define cfari-6
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-cfari
          (morji-nunjavni-je
            canlu-1
            (morji-nunjavni-* cfari-samselpla-2)
            canlu-1
            (morji-nunjavni-cmene gerna-3 cmene: "gerna")
            FAhO-4))))
    (define cfari-samselpla-7
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-cfari-samselpla
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\{)
            canlu-1
            (morji-nunjavni-+
              (morji-nunjavni-samselpla
                samselpla-samselpla-lerfu
                (morji-nunjavni-je
                  (morji-nunjavni-! (morji-nunjavni-lerfu #\}))
                  (morji-nunjavni-. cmene: "lerfu")))
              cmene:
              "rodalerfu")
            (morji-nunjavni-lerfu #\})
            canlu-1))))
    (define gerna-9 (nunjavni-morji (morji-nunjavni-* smuni-8)))
    (define smuni-12
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-smuni
          (morji-nunjavni-je
            (morji-nunjavni-cmene naselci-10 cmene: "naselci")
            (morji-nunjavni-valsi "<-")
            canlu-1
            (morji-nunjavni-cmene javni-11 cmene: "javni")))))
    (define naselci-13
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-naselci
          (morji-nunjavni-je
            (morji-nunjavni-char-set
              (char-set-union char-set:letter (char-set #\_))
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
            canlu-1))))
    (define javni-16 (nunjavni-morji (morji-nunjavni-jonai jonai-14 je-15)))
    (define jonai-17
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-jonai
          (morji-nunjavni-je
            (morji-nunjavni-cmene je-15 cmene: "cfari")
            (morji-nunjavni-+
              (morji-nunjavni-samselpla
                samselpla-jonai-je
                (morji-nunjavni-je
                  (morji-nunjavni-lerfu #\/)
                  canlu-1
                  (morji-nunjavni-cmene je-15 cmene: "je")))
              cmene:
              "fanmo")))))
    (define je-21
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-je
          (morji-nunjavni-je
            (morji-nunjavni-+ pajavni-18 cmene: "rodajavni")
            (morji-nunjavni-? cmene-sumti-19 cmene: "cmene")
            (morji-nunjavni-? samselpla-20 cmene: "samselpla")))))
    (define pajavni-29
      (nunjavni-morji
        (morji-nunjavni-jonai
          optional-22
          repetition0-23
          repetition1-24
          and-predicate-25
          end-of-input-26
          not-predicate-27
          (morji-nunjavni-samselpla
            samselpla-pajavni-cmene
            (morji-nunjavni-je
              (morji-nunjavni-? cmene-sumti-19 cmene: "cmene")
              (morji-nunjavni-cmene selci-javni-28 cmene: "javni"))))))
    (define optional-30
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-?
          (morji-nunjavni-je
            (morji-nunjavni-? cmene-sumti-19 cmene: "cmene")
            (morji-nunjavni-cmene selci-javni-28 cmene: "javni")
            (morji-nunjavni-lerfu #\?)
            canlu-1))))
    (define repetition0-31
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-*
          (morji-nunjavni-je
            (morji-nunjavni-? cmene-sumti-19 cmene: "cmene")
            (morji-nunjavni-cmene selci-javni-28 cmene: "javni")
            (morji-nunjavni-lerfu #\*)
            canlu-1))))
    (define repetition1-32
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-+
          (morji-nunjavni-je
            (morji-nunjavni-? cmene-sumti-19 cmene: "cmene")
            (morji-nunjavni-cmene selci-javni-28 cmene: "javni")
            (morji-nunjavni-lerfu #\+)
            canlu-1))))
    (define and-predicate-33
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-&
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\&)
            canlu-1
            (morji-nunjavni-cmene selci-javni-28 cmene: "javni")))))
    (define end-of-input-34
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-fanmo
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\!)
            canlu-1
            (morji-nunjavni-lerfu #\.)
            canlu-1))))
    (define not-predicate-35
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-!
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\!)
            canlu-1
            (morji-nunjavni-cmene selci-javni-28 cmene: "javni")))))
    (define cmene-sumti-36
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-cmene-sumti
          (morji-nunjavni-je
            (morji-nunjavni-valsi "#:")
            (morji-nunjavni-char-set
              (char-set-union char-set:letter (char-set #\_))
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
            canlu-1))))
    (define selci-javni-43
      (nunjavni-morji
        (morji-nunjavni-jonai
          selci-naselci-37
          lerfu-selci-38
          valsi-selci-39
          klesi-selci-40
          denpabu-41
          girzu-javni-42)))
    (define selci-naselci-44
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-selci-naselci
          (morji-nunjavni-je
            (morji-nunjavni-cmene naselci-10 cmene: "naselci")
            (morji-nunjavni-! (morji-nunjavni-valsi "<-"))))))
    (define lerfu-selci-46
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-lerfu-selci
            (morji-nunjavni-je
              (morji-nunjavni-valsi "#\\")
              (morji-nunjavni-cmene lerfu-cmene-45 cmene: "lerfu")
              canlu-1))
          (morji-nunjavni-samselpla
            samselpla-lerfu-selci
            (morji-nunjavni-je
              (morji-nunjavni-valsi "#\\")
              (morji-nunjavni-. cmene: "lerfu")
              canlu-1)))))
    (define lerfu-cmene-47
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
    (define valsi-selci-49
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
                  (morji-nunjavni-cmene valsi-lerfu-48 cmene: "lerfu")))
              cmene:
              "valsi-lerfu")
            (morji-nunjavni-lerfu #\")
            canlu-1))))
    (define valsi-lerfu-50
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
    (define klesi-selci-52
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-klesi-selci-*
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\[)
              (morji-nunjavni-+ klesi-lerfu-51 cmene: "klesi-lerfu")
              (morji-nunjavni-valsi "]*")
              canlu-1))
          (morji-nunjavni-samselpla
            samselpla-klesi-selci-+
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\[)
              (morji-nunjavni-+ klesi-lerfu-51 cmene: "klesi-lerfu")
              (morji-nunjavni-valsi "]+")
              canlu-1))
          (morji-nunjavni-samselpla
            samselpla-klesi-selci
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\[)
              (morji-nunjavni-+ klesi-lerfu-51 cmene: "klesi-lerfu")
              (morji-nunjavni-lerfu #\])
              canlu-1)))))
    (define klesi-lerfu-54
      (nunjavni-morji
        (morji-nunjavni-jonai
          klesi-cmene-53
          (morji-nunjavni-samselpla
            samselpla-klesi-lerfu
            (morji-nunjavni-je
              (morji-nunjavni-! (morji-nunjavni-lerfu #\]))
              (morji-nunjavni-. cmene: "klesi-lerfu"))))))
    (define klesi-cmene-55
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
    (define denpabu-56
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-denpabu
          (morji-nunjavni-je (morji-nunjavni-lerfu #\.) canlu-1))))
    (define samselpla-59
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-samselpla
          (morji-nunjavni-je
            (morji-nunjavni-valsi "->")
            canlu-1
            (morji-nunjavni-jonai
              samselpla-xadni-57
              samselpla-cmene-58
              cmene:
              "samselpla")))))
    (define samselpla-xadni-60
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-samselpla-xadni
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\{)
            canlu-1
            (morji-nunjavni-+
              (morji-nunjavni-samselpla
                samselpla-samselpla-lerfu
                (morji-nunjavni-je
                  (morji-nunjavni-! (morji-nunjavni-lerfu #\}))
                  (morji-nunjavni-. cmene: "lerfu")))
              cmene:
              "rodalerfu")
            (morji-nunjavni-lerfu #\})
            canlu-1))))
    (define samselpla-cmene-61
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-samselpla-cmene
          (morji-nunjavni-je
            (morji-nunjavni-char-set
              (char-set-union char-set:letter (char-set #\_))
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
            canlu-1))))
    (define girzu-javni-62
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-girzu-javni
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\()
              canlu-1
              (morji-nunjavni-cmene javni-11 cmene: "javni")
              (morji-nunjavni-lerfu #\))
              canlu-1))
          (morji-nunjavni-samselpla
            samselpla-empty-string
            (morji-nunjavni-je (morji-nunjavni-valsi "()") canlu-1)))))
    (define canlu-65
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-canlu
          (morji-nunjavni-* (morji-nunjavni-jonai canlubu-63 totoi-64)))))
    (define canlubu-68
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-lerfu #\space)
          (morji-nunjavni-lerfu #\tab)
          CR-66
          LF-67)))
    (define totoi-70
      (nunjavni-morji
        (morji-nunjavni-je
          (morji-nunjavni-lerfu #\;)
          (morji-nunjavni-*
            (morji-nunjavni-je (morji-nunjavni-! CRLF-69) (morji-nunjavni-.)))
          (morji-nunjavni-jonai CRLF-69 (morji-nunjavni-& FAhO-4)))))
    (define CR-71 (nunjavni-morji (morji-nunjavni-lerfu #\return)))
    (define LF-72 (nunjavni-morji (morji-nunjavni-lerfu #\newline)))
    (define CRLF-73
      (nunjavni-morji
        (morji-nunjavni-jonai (morji-nunjavni-je CR-66 LF-67) CR-66 LF-67)))
    (define FAhO-74 (nunjavni-morji (morji-nunjavni-fanmo)))
    (tolmohi-nunjavni)
    cfari-6))
