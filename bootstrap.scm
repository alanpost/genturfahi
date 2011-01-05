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
    (define cfari-40
      (nunjavni-secuxna
        (lambda () "cfari")
        (lambda (porsi mapti namapti) (cfari-41 porsi mapti namapti))))
    (define cfari-samselpla-2
      (nunjavni-secuxna
        (lambda () "cfari-samselpla")
        (lambda (porsi mapti namapti)
          (cfari-samselpla-42 porsi mapti namapti))))
    (define gerna-3
      (nunjavni-secuxna
        (lambda () "gerna")
        (lambda (porsi mapti namapti) (gerna-43 porsi mapti namapti))))
    (define smuni-5
      (nunjavni-secuxna
        (lambda () "smuni")
        (lambda (porsi mapti namapti) (smuni-44 porsi mapti namapti))))
    (define naselci-6
      (nunjavni-secuxna
        (lambda () "naselci")
        (lambda (porsi mapti namapti) (naselci-45 porsi mapti namapti))))
    (define javni-7
      (nunjavni-secuxna
        (lambda () "javni")
        (lambda (porsi mapti namapti) (javni-46 porsi mapti namapti))))
    (define jonai-8
      (nunjavni-secuxna
        (lambda () "jonai")
        (lambda (porsi mapti namapti) (jonai-47 porsi mapti namapti))))
    (define je-9
      (nunjavni-secuxna
        (lambda () "je")
        (lambda (porsi mapti namapti) (je-48 porsi mapti namapti))))
    (define nastura-pajavni-10
      (nunjavni-secuxna
        (lambda () "nastura-pajavni")
        (lambda (porsi mapti namapti)
          (nastura-pajavni-49 porsi mapti namapti))))
    (define pajavni-13
      (nunjavni-secuxna
        (lambda () "pajavni")
        (lambda (porsi mapti namapti) (pajavni-50 porsi mapti namapti))))
    (define dot-zero-or-more-14
      (nunjavni-secuxna
        (lambda () "dot-zero-or-more")
        (lambda (porsi mapti namapti)
          (dot-zero-or-more-51 porsi mapti namapti))))
    (define dot-one-or-more-15
      (nunjavni-secuxna
        (lambda () "dot-one-or-more")
        (lambda (porsi mapti namapti)
          (dot-one-or-more-52 porsi mapti namapti))))
    (define optional-16
      (nunjavni-secuxna
        (lambda () "optional")
        (lambda (porsi mapti namapti) (optional-53 porsi mapti namapti))))
    (define zero-or-more-17
      (nunjavni-secuxna
        (lambda () "zero-or-more")
        (lambda (porsi mapti namapti) (zero-or-more-54 porsi mapti namapti))))
    (define one-or-more-18
      (nunjavni-secuxna
        (lambda () "one-or-more")
        (lambda (porsi mapti namapti) (one-or-more-55 porsi mapti namapti))))
    (define and-predicate-19
      (nunjavni-secuxna
        (lambda () "and-predicate")
        (lambda (porsi mapti namapti) (and-predicate-56 porsi mapti namapti))))
    (define end-of-input-20
      (nunjavni-secuxna
        (lambda () "end-of-input")
        (lambda (porsi mapti namapti) (end-of-input-57 porsi mapti namapti))))
    (define not-predicate-21
      (nunjavni-secuxna
        (lambda () "not-predicate")
        (lambda (porsi mapti namapti) (not-predicate-58 porsi mapti namapti))))
    (define cmene-sumti-11
      (nunjavni-secuxna
        (lambda () "cmene-sumti")
        (lambda (porsi mapti namapti) (cmene-sumti-59 porsi mapti namapti))))
    (define selci-javni-22
      (nunjavni-secuxna
        (lambda () "selci-javni")
        (lambda (porsi mapti namapti) (selci-javni-60 porsi mapti namapti))))
    (define selci-naselci-23
      (nunjavni-secuxna
        (lambda () "selci-naselci")
        (lambda (porsi mapti namapti) (selci-naselci-61 porsi mapti namapti))))
    (define lerfu-selci-24
      (nunjavni-secuxna
        (lambda () "lerfu-selci")
        (lambda (porsi mapti namapti) (lerfu-selci-62 porsi mapti namapti))))
    (define lerfu-cmene-29
      (nunjavni-secuxna
        (lambda () "lerfu-cmene")
        (lambda (porsi mapti namapti) (lerfu-cmene-63 porsi mapti namapti))))
    (define valsi-selci-25
      (nunjavni-secuxna
        (lambda () "valsi-selci")
        (lambda (porsi mapti namapti) (valsi-selci-64 porsi mapti namapti))))
    (define valsi-lerfu-30
      (nunjavni-secuxna
        (lambda () "valsi-lerfu")
        (lambda (porsi mapti namapti) (valsi-lerfu-65 porsi mapti namapti))))
    (define klesi-selci-26
      (nunjavni-secuxna
        (lambda () "klesi-selci")
        (lambda (porsi mapti namapti) (klesi-selci-66 porsi mapti namapti))))
    (define klesi-lerfu-31
      (nunjavni-secuxna
        (lambda () "klesi-lerfu")
        (lambda (porsi mapti namapti) (klesi-lerfu-67 porsi mapti namapti))))
    (define klesi-cmene-32
      (nunjavni-secuxna
        (lambda () "klesi-cmene")
        (lambda (porsi mapti namapti) (klesi-cmene-68 porsi mapti namapti))))
    (define denpabu-27
      (nunjavni-secuxna
        (lambda () "denpabu")
        (lambda (porsi mapti namapti) (denpabu-69 porsi mapti namapti))))
    (define samselpla-12
      (nunjavni-secuxna
        (lambda () "samselpla")
        (lambda (porsi mapti namapti) (samselpla-70 porsi mapti namapti))))
    (define samselpla-xadni-33
      (nunjavni-secuxna
        (lambda () "samselpla-xadni")
        (lambda (porsi mapti namapti)
          (samselpla-xadni-71 porsi mapti namapti))))
    (define samselpla-cmene-34
      (nunjavni-secuxna
        (lambda () "samselpla-cmene")
        (lambda (porsi mapti namapti)
          (samselpla-cmene-72 porsi mapti namapti))))
    (define girzu-javni-28
      (nunjavni-secuxna
        (lambda () "girzu-javni")
        (lambda (porsi mapti namapti) (girzu-javni-73 porsi mapti namapti))))
    (define canlu-1
      (nunjavni-secuxna
        (lambda () "canlu")
        (lambda (porsi mapti namapti) (canlu-74 porsi mapti namapti))))
    (define canlubu-35
      (nunjavni-secuxna
        (lambda () "canlubu")
        (lambda (porsi mapti namapti) (canlubu-75 porsi mapti namapti))))
    (define totoi-36
      (nunjavni-secuxna
        (lambda () "totoi")
        (lambda (porsi mapti namapti) (totoi-76 porsi mapti namapti))))
    (define CR-38
      (nunjavni-secuxna
        (lambda () "CR")
        (lambda (porsi mapti namapti) (CR-77 porsi mapti namapti))))
    (define LF-39
      (nunjavni-secuxna
        (lambda () "LF")
        (lambda (porsi mapti namapti) (LF-78 porsi mapti namapti))))
    (define CRLF-37
      (nunjavni-secuxna
        (lambda () "CRLF")
        (lambda (porsi mapti namapti) (CRLF-79 porsi mapti namapti))))
    (define FAhO-4
      (nunjavni-secuxna
        (lambda () "FAhO")
        (lambda (porsi mapti namapti) (FAhO-80 porsi mapti namapti))))
    (define cfari-41
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-cfari
          (morji-nunjavni-je
            canlu-1
            (morji-nunjavni-* cfari-samselpla-2 nastura: #t)
            canlu-1
            (morji-nunjavni-cmene gerna-3 cmene: "gerna")
            (morji-nunjavni-nastura FAhO-4)))))
    (define cfari-samselpla-42
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
    (define gerna-43 (nunjavni-morji (morji-nunjavni-* smuni-5)))
    (define smuni-44
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-smuni
          (morji-nunjavni-je
            (morji-nunjavni-cmene naselci-6 cmene: "naselci")
            (morji-nunjavni-valsi "<-")
            canlu-1
            (morji-nunjavni-cmene javni-7 cmene: "javni")))))
    (define naselci-45
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
    (define javni-46 (nunjavni-morji (morji-nunjavni-jonai jonai-8 je-9)))
    (define jonai-47
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-jonai
          (morji-nunjavni-je
            (morji-nunjavni-cmene je-9 cmene: "cfari")
            (morji-nunjavni-+
              (morji-nunjavni-je (morji-nunjavni-lerfu #\/) canlu-1 je-9)
              cmene:
              "fanmo")))))
    (define je-48
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-je
          (morji-nunjavni-je
            (morji-nunjavni-+ nastura-pajavni-10 cmene: "javni")
            (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
            (morji-nunjavni-? samselpla-12 cmene: "samselpla")))))
    (define nastura-pajavni-49
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-nastura-javni
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\`)
              canlu-1
              (morji-nunjavni-cmene pajavni-13 cmene: "javni")))
          pajavni-13)))
    (define pajavni-50
      (nunjavni-morji
        (morji-nunjavni-jonai
          dot-zero-or-more-14
          dot-one-or-more-15
          optional-16
          zero-or-more-17
          one-or-more-18
          and-predicate-19
          end-of-input-20
          not-predicate-21
          (morji-nunjavni-samselpla
            samselpla-pajavni-cmene
            (morji-nunjavni-je
              (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
              (morji-nunjavni-cmene selci-javni-22 cmene: "javni"))))))
    (define dot-zero-or-more-51
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-.*
          (morji-nunjavni-je
            (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
            (morji-nunjavni-lerfu #\.)
            canlu-1
            (morji-nunjavni-lerfu #\*)
            canlu-1))))
    (define dot-one-or-more-52
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-.+
          (morji-nunjavni-je
            (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
            (morji-nunjavni-lerfu #\.)
            canlu-1
            (morji-nunjavni-lerfu #\+)
            canlu-1))))
    (define optional-53
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-?
          (morji-nunjavni-je
            (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
            (morji-nunjavni-cmene selci-javni-22 cmene: "javni")
            (morji-nunjavni-lerfu #\?)
            canlu-1))))
    (define zero-or-more-54
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-*
          (morji-nunjavni-je
            (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
            (morji-nunjavni-cmene selci-javni-22 cmene: "javni")
            (morji-nunjavni-lerfu #\*)
            canlu-1))))
    (define one-or-more-55
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-+
          (morji-nunjavni-je
            (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
            (morji-nunjavni-cmene selci-javni-22 cmene: "javni")
            (morji-nunjavni-lerfu #\+)
            canlu-1))))
    (define and-predicate-56
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-&
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\&)
            canlu-1
            (morji-nunjavni-cmene selci-javni-22 cmene: "javni")))))
    (define end-of-input-57
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-fanmo
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\!)
            canlu-1
            (morji-nunjavni-lerfu #\.)
            canlu-1))))
    (define not-predicate-58
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-!
          (morji-nunjavni-je
            (morji-nunjavni-lerfu #\!)
            canlu-1
            (morji-nunjavni-cmene selci-javni-22 cmene: "javni")))))
    (define cmene-sumti-59
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
    (define selci-javni-60
      (nunjavni-morji
        (morji-nunjavni-jonai
          selci-naselci-23
          lerfu-selci-24
          valsi-selci-25
          klesi-selci-26
          denpabu-27
          girzu-javni-28)))
    (define selci-naselci-61
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-selci-naselci
          (morji-nunjavni-je
            (morji-nunjavni-cmene naselci-6 cmene: "naselci")
            (morji-nunjavni-! (morji-nunjavni-valsi "<-"))))))
    (define lerfu-selci-62
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-stura-lerfu-selci
            (morji-nunjavni-je
              (morji-nunjavni-valsi ",#\\")
              (morji-nunjavni-cmene lerfu-cmene-29 cmene: "lerfu")
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
              (morji-nunjavni-cmene lerfu-cmene-29 cmene: "lerfu")
              canlu-1))
          (morji-nunjavni-samselpla
            samselpla-lerfu-selci
            (morji-nunjavni-je
              (morji-nunjavni-valsi "#\\")
              (morji-nunjavni-. cmene: "lerfu")
              canlu-1)))))
    (define lerfu-cmene-63
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
    (define valsi-selci-64
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
                  valsi-lerfu-30)
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
                  valsi-lerfu-30)
                cmene:
                "valsi-lerfu")
              (morji-nunjavni-lerfu #\")
              canlu-1)))))
    (define valsi-lerfu-65
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
    (define klesi-selci-66
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-klesi-selci-*
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\[)
              (morji-nunjavni-+ klesi-lerfu-31 cmene: "klesi-lerfu")
              (morji-nunjavni-valsi "]*")
              canlu-1))
          (morji-nunjavni-samselpla
            samselpla-klesi-selci-+
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\[)
              (morji-nunjavni-+ klesi-lerfu-31 cmene: "klesi-lerfu")
              (morji-nunjavni-valsi "]+")
              canlu-1))
          (morji-nunjavni-samselpla
            samselpla-klesi-selci
            (morji-nunjavni-je
              (morji-nunjavni-lerfu #\[)
              (morji-nunjavni-+ klesi-lerfu-31 cmene: "klesi-lerfu")
              (morji-nunjavni-lerfu #\])
              canlu-1)))))
    (define klesi-lerfu-67
      (nunjavni-morji
        (morji-nunjavni-jonai
          klesi-cmene-32
          (morji-nunjavni-samselpla
            samselpla-klesi-lerfu
            (morji-nunjavni-je
              (morji-nunjavni-! (morji-nunjavni-lerfu #\]))
              (morji-nunjavni-. cmene: "klesi-lerfu"))))))
    (define klesi-cmene-68
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
            samselpla-jbolehu
            (morji-nunjavni-valsi "[:jbole'u:]"))
          (morji-nunjavni-samselpla
            samselpla-jbocahu
            (morji-nunjavni-valsi "[:jboca'u:]"))
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
    (define denpabu-69
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-denpabu
          (morji-nunjavni-je (morji-nunjavni-lerfu #\.) canlu-1))))
    (define samselpla-70
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-samselpla
            samselpla-samselpla-balvi
            (morji-nunjavni-je
              (morji-nunjavni-valsi "->")
              canlu-1
              (morji-nunjavni-jonai samselpla-xadni-33 samselpla-cmene-34)))
          (morji-nunjavni-samselpla
            samselpla-samselpla-cabna
            (morji-nunjavni-je
              (morji-nunjavni-valsi "-|")
              canlu-1
              (morji-nunjavni-jonai samselpla-xadni-33 samselpla-cmene-34))))))
    (define samselpla-xadni-71
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
    (define samselpla-cmene-72
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
    (define girzu-javni-73
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
    (define canlu-74
      (nunjavni-morji
        (morji-nunjavni-*
          (morji-nunjavni-jonai canlubu-35 totoi-36)
          nastura:
          #t)))
    (define canlubu-75
      (nunjavni-morji
        (morji-nunjavni-jonai
          (morji-nunjavni-char-set char-set:whitespace)
          CRLF-37)))
    (define totoi-76
      (nunjavni-morji
        (morji-nunjavni-je
          (morji-nunjavni-lerfu #\;)
          (morji-nunjavni-*
            (morji-nunjavni-je (morji-nunjavni-! CRLF-37) (morji-nunjavni-.)))
          (morji-nunjavni-jonai CRLF-37 (morji-nunjavni-& FAhO-4)))))
    (define CR-77 (morji-nunjavni-lerfu #\return))
    (define LF-78 (morji-nunjavni-lerfu #\newline))
    (define CRLF-79
      (nunjavni-morji
        (morji-nunjavni-jonai (morji-nunjavni-je CR-38 LF-39) CR-38 LF-39)))
    (define FAhO-80 (morji-nunjavni-fanmo))
    (tolmohi-nunjavni)
    (nunjavni-secuxna (lambda () "cfari") cfari-41)))
