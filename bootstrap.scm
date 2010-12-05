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
    (define (cfari-4 porsi mapti namapti) (cfari-5 porsi mapti namapti))
    (define (cfari-samselpla-1 porsi mapti namapti)
      (cfari-samselpla-6 porsi mapti namapti))
    (define (gerna-2 porsi mapti namapti) (gerna-8 porsi mapti namapti))
    (define (smuni-7 porsi mapti namapti) (smuni-11 porsi mapti namapti))
    (define (naselci-9 porsi mapti namapti) (naselci-12 porsi mapti namapti))
    (define (javni-10 porsi mapti namapti) (javni-15 porsi mapti namapti))
    (define (jonai-13 porsi mapti namapti) (jonai-16 porsi mapti namapti))
    (define (je-14 porsi mapti namapti) (je-20 porsi mapti namapti))
    (define (pajavni-17 porsi mapti namapti) (pajavni-28 porsi mapti namapti))
    (define (optional-21 porsi mapti namapti)
      (optional-29 porsi mapti namapti))
    (define (repetition0-22 porsi mapti namapti)
      (repetition0-30 porsi mapti namapti))
    (define (repetition1-23 porsi mapti namapti)
      (repetition1-31 porsi mapti namapti))
    (define (and-predicate-24 porsi mapti namapti)
      (and-predicate-32 porsi mapti namapti))
    (define (end-of-input-25 porsi mapti namapti)
      (end-of-input-33 porsi mapti namapti))
    (define (not-predicate-26 porsi mapti namapti)
      (not-predicate-34 porsi mapti namapti))
    (define (cmene-sumti-18 porsi mapti namapti)
      (cmene-sumti-35 porsi mapti namapti))
    (define (selci-javni-27 porsi mapti namapti)
      (selci-javni-42 porsi mapti namapti))
    (define (selci-naselci-36 porsi mapti namapti)
      (selci-naselci-43 porsi mapti namapti))
    (define (lerfu-selci-37 porsi mapti namapti)
      (lerfu-selci-45 porsi mapti namapti))
    (define (lerfu-cmene-44 porsi mapti namapti)
      (lerfu-cmene-46 porsi mapti namapti))
    (define (valsi-selci-38 porsi mapti namapti)
      (valsi-selci-48 porsi mapti namapti))
    (define (valsi-lerfu-47 porsi mapti namapti)
      (valsi-lerfu-49 porsi mapti namapti))
    (define (klesi-selci-39 porsi mapti namapti)
      (klesi-selci-51 porsi mapti namapti))
    (define (klesi-lerfu-50 porsi mapti namapti)
      (klesi-lerfu-53 porsi mapti namapti))
    (define (klesi-cmene-52 porsi mapti namapti)
      (klesi-cmene-54 porsi mapti namapti))
    (define (denpabu-40 porsi mapti namapti) (denpabu-55 porsi mapti namapti))
    (define (samselpla-19 porsi mapti namapti)
      (samselpla-56 porsi mapti namapti))
    (define (girzu-javni-41 porsi mapti namapti)
      (girzu-javni-57 porsi mapti namapti))
    (define (canlu-0 porsi mapti namapti) (canlu-60 porsi mapti namapti))
    (define (canlubu-58 porsi mapti namapti) (canlubu-63 porsi mapti namapti))
    (define (totoi-59 porsi mapti namapti) (totoi-65 porsi mapti namapti))
    (define (CR-61 porsi mapti namapti) (CR-66 porsi mapti namapti))
    (define (LF-62 porsi mapti namapti) (LF-67 porsi mapti namapti))
    (define (CRLF-64 porsi mapti namapti) (CRLF-68 porsi mapti namapti))
    (define (FAhO-3 porsi mapti namapti) (FAhO-69 porsi mapti namapti))
    (define cfari-5
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-cfari
          (morji-nunjavni-je
            canlu-0
            (morji-nunjavni-* cfari-samselpla-1)
            canlu-0
            (morji-nunjavni-cmene gerna-2 cmene: "gerna")
            FAhO-3))))
    (define cfari-samselpla-6
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-cfari-samselpla
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\{)
            canlu-0
            (morji-nunjavni-+
              (morji-nunjavni-samselpla
                samselpla-samselpla-lerfu
                (morji-nunjavni-je
                  (morji-nunjavni-! (morji-nunjavni-lerfu #\}))
                  (morji-nunjavni-. cmene: "lerfu")))
              cmene:
              "rodalerfu")
            (morji-nunjavni-lerfu #\})
            canlu-0))))
    (define gerna-8 (nunjavni-morji (morji-nunjavni-* smuni-7)))
    (define smuni-11
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-smuni
          (morji-nunjavni-je
            (morji-nunjavni-cmene naselci-9 cmene: "naselci")
            (morji-nunjavni-valsi "<-")
            canlu-0
            (morji-nunjavni-cmene javni-10 cmene: "javni")))))
    (define naselci-12
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
            canlu-0))))
    (define javni-15 (nunjavni-morji (morji-nunjavni-jonai jonai-13 je-14)))
    (define jonai-16
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-jonai
          (morji-nunjavni-je
            (morji-nunjavni-cmene je-14 cmene: "cfari")
            (morji-nunjavni-+
              (morji-nunjavni-samselpla
                samselpla-jonai-je
                (morji-nunjavni-je
                  (morji-nunjavni-lerfu #\/)
                  canlu-0
                  (morji-nunjavni-cmene je-14 cmene: "je")))
              cmene:
              "fanmo")))))
    (define je-20
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-je
          (morji-nunjavni-je
            (morji-nunjavni-+ pajavni-17 cmene: "rodajavni")
            (morji-nunjavni-? cmene-sumti-18 cmene: "cmene")
            (morji-nunjavni-? samselpla-19 cmene: "samselpla")))))
    (define pajavni-28
      (nunjavni-morji
        (morji-nunjavni-jonai
          optional-21
          repetition0-22
          repetition1-23
          and-predicate-24
          end-of-input-25
          not-predicate-26
          (morji-nunjavni-samselpla
            samselpla-pajavni-cmene
            (morji-nunjavni-je
              (morji-nunjavni-? cmene-sumti-18 cmene: "cmene")
              (morji-nunjavni-cmene selci-javni-27 cmene: "javni"))))))
    (define optional-29
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-?
          (morji-nunjavni-je
            (morji-nunjavni-? cmene-sumti-18 cmene: "cmene")
            (morji-nunjavni-cmene selci-javni-27 cmene: "javni")
            (morji-nunjavni-lerfu #\?)
            canlu-0))))
    (define repetition0-30
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-*
          (morji-nunjavni-je
            (morji-nunjavni-? cmene-sumti-18 cmene: "cmene")
            (morji-nunjavni-cmene selci-javni-27 cmene: "javni")
            (morji-nunjavni-lerfu #\*)
            canlu-0))))
    (define repetition1-31
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-+
          (morji-nunjavni-je
            (morji-nunjavni-? cmene-sumti-18 cmene: "cmene")
            (morji-nunjavni-cmene selci-javni-27 cmene: "javni")
            (morji-nunjavni-lerfu #\+)
            canlu-0))))
    (define and-predicate-32
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-&
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\&)
            canlu-0
            (morji-nunjavni-cmene selci-javni-27 cmene: "javni")))))
    (define end-of-input-33
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-fanmo
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\!)
            canlu-0
            (morji-nunjavni-lerfu #\.)
            canlu-0))))
    (define not-predicate-34
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-!
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\!)
            canlu-0
            (morji-nunjavni-cmene selci-javni-27 cmene: "javni")))))
    (define cmene-sumti-35
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
            canlu-0))))
    (define selci-javni-42
      (nunjavni-morji
        (morji-nunjavni-jonai
          selci-naselci-36
          lerfu-selci-37
          valsi-selci-38
          klesi-selci-39
          denpabu-40
          girzu-javni-41)))
    (define selci-naselci-43
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-selci-naselci
          (morji-nunjavni-je
            (morji-nunjavni-cmene naselci-9 cmene: "naselci")
            (morji-nunjavni-! (morji-nunjavni-valsi "<-"))))))
    (define lerfu-selci-45
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-lerfu-selci
            (morji-nunjavni-je
              (morji-nunjavni-valsi "#\\")
              (morji-nunjavni-cmene lerfu-cmene-44 cmene: "lerfu")
              canlu-0))
          (morji-nunjavni-samselpla
            samselpla-lerfu-selci
            (morji-nunjavni-je
              (morji-nunjavni-valsi "#\\")
              (morji-nunjavni-. cmene: "lerfu")
              canlu-0)))))
    (define lerfu-cmene-46
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
    (define valsi-selci-48
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
                  (morji-nunjavni-cmene valsi-lerfu-47 cmene: "lerfu")))
              cmene:
              "valsi-lerfu")
            (morji-nunjavni-lerfu #\")
            canlu-0))))
    (define valsi-lerfu-49
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
    (define klesi-selci-51
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-klesi-selci-*
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\[)
              (morji-nunjavni-+ klesi-lerfu-50 cmene: "klesi-lerfu")
              (morji-nunjavni-valsi "]*")
              canlu-0))
          (morji-nunjavni-samselpla
            samselpla-klesi-selci-+
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\[)
              (morji-nunjavni-+ klesi-lerfu-50 cmene: "klesi-lerfu")
              (morji-nunjavni-valsi "]+")
              canlu-0))
          (morji-nunjavni-samselpla
            samselpla-klesi-selci
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\[)
              (morji-nunjavni-+ klesi-lerfu-50 cmene: "klesi-lerfu")
              (morji-nunjavni-lerfu #\])
              canlu-0)))))
    (define klesi-lerfu-53
      (nunjavni-morji
        (morji-nunjavni-jonai
          klesi-cmene-52
          (morji-nunjavni-samselpla
            samselpla-klesi-lerfu
            (morji-nunjavni-je
              (morji-nunjavni-! (morji-nunjavni-lerfu #\]))
              (morji-nunjavni-. cmene: "klesi-lerfu"))))))
    (define klesi-cmene-54
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
    (define denpabu-55
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-denpabu
          (morji-nunjavni-je (morji-nunjavni-lerfu #\.) canlu-0))))
    (define samselpla-56
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-samselpla
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\{)
            canlu-0
            (morji-nunjavni-+
              (morji-nunjavni-samselpla
                samselpla-samselpla-lerfu
                (morji-nunjavni-je
                  (morji-nunjavni-! (morji-nunjavni-lerfu #\}))
                  (morji-nunjavni-. cmene: "lerfu")))
              cmene:
              "rodalerfu")
            (morji-nunjavni-lerfu #\})
            canlu-0))))
    (define girzu-javni-57
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-girzu-javni
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\()
              canlu-0
              (morji-nunjavni-cmene javni-10 cmene: "javni")
              (morji-nunjavni-lerfu #\))
              canlu-0))
          (morji-nunjavni-samselpla
            samselpla-empty-string
            (morji-nunjavni-je (morji-nunjavni-valsi "()") canlu-0)))))
    (define canlu-60
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-canlu
          (morji-nunjavni-* (morji-nunjavni-jonai canlubu-58 totoi-59)))))
    (define canlubu-63
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-lerfu #\space)
          (morji-nunjavni-lerfu #\tab)
          CR-61
          LF-62)))
    (define totoi-65
      (nunjavni-morji
        (morji-nunjavni-je
          (morji-nunjavni-lerfu #\;)
          (morji-nunjavni-*
            (morji-nunjavni-je (morji-nunjavni-! CRLF-64) (morji-nunjavni-.)))
          (morji-nunjavni-jonai CRLF-64 (morji-nunjavni-& FAhO-3)))))
    (define CR-66 (nunjavni-morji (morji-nunjavni-lerfu #\return)))
    (define LF-67 (nunjavni-morji (morji-nunjavni-lerfu #\newline)))
    (define CRLF-68
      (nunjavni-morji
        (morji-nunjavni-jonai (morji-nunjavni-je CR-61 LF-62) CR-61 LF-62)))
    (define FAhO-69 (nunjavni-morji (morji-nunjavni-fanmo)))
    (tolmohi-nunjavni)
    cfari-5))
