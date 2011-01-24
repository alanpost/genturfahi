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
            (list (morji-nunjavni-porjahe canlu-1)
                  (morji-nunjavni-* cfari-samselpla-2 nastura: #t porjahe: #t)
                  (morji-nunjavni-porjahe canlu-1)
                  (morji-nunjavni-cmene gerna-3 cmene: "gerna" porjahe: #t)
                  (morji-nunjavni-nastura FAhO-4 porjahe: #t))
            porjahe:
            #t))))
    (define cfari-samselpla-42
      (nunjavni-morji
        (morji-nunjavni-samselpla-cabna
          samselpla-cfari-samselpla
          (morji-nunjavni-je
            (list (morji-nunjavni-lerfu #\{)
                  canlu-1
                  (morji-nunjavni-+
                    (morji-nunjavni-je
                      (list (morji-nunjavni-!
                              (morji-nunjavni-lerfu #\})
                              porjahe:
                              #t)
                            (morji-nunjavni-. porjahe: #t))
                      porsumti:
                      #t)
                    cmene:
                    "rodalerfu")
                  (morji-nunjavni-lerfu #\})
                  canlu-1)
            porjahe:
            #t))))
    (define gerna-43 (nunjavni-morji (morji-nunjavni-* smuni-5)))
    (define smuni-44
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-smuni
          (morji-nunjavni-je
            (list (morji-nunjavni-cmene naselci-6 cmene: "naselci")
                  (morji-nunjavni-valsi "<-")
                  canlu-1
                  (morji-nunjavni-cmene javni-7 cmene: "javni"))
            porjahe:
            #t))))
    (define naselci-45
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-naselci
          (morji-nunjavni-je
            (list (morji-nunjavni-char-set
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
                  canlu-1)
            porjahe:
            #t))))
    (define javni-46
      (nunjavni-morji (morji-nunjavni-jonai (list jonai-8 je-9))))
    (define jonai-47
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-jonai
          (morji-nunjavni-je
            (list (morji-nunjavni-cmene je-9 cmene: "cfari")
                  (morji-nunjavni-+
                    (morji-nunjavni-je
                      (list (morji-nunjavni-lerfu #\/ porjahe: #t)
                            (morji-nunjavni-porjahe canlu-1)
                            (morji-nunjavni-porjahe je-9))
                      porsumti:
                      #t)
                    cmene:
                    "fanmo"))
            porjahe:
            #t))))
    (define je-48
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-je
          (morji-nunjavni-je
            (list (morji-nunjavni-+ nastura-pajavni-10 cmene: "javni")
                  (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
                  (morji-nunjavni-? samselpla-12 cmene: "samselpla"))
            porjahe:
            #t))))
    (define nastura-pajavni-49
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-nastura-javni
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\`)
                          canlu-1
                          (morji-nunjavni-cmene pajavni-13 cmene: "javni"))
                    porjahe:
                    #t))
                pajavni-13))))
    (define pajavni-50
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list dot-zero-or-more-14
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
                    (list (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
                          (morji-nunjavni-cmene selci-javni-22 cmene: "javni"))
                    porjahe:
                    #t))))))
    (define dot-zero-or-more-51
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-.*
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
                  (morji-nunjavni-lerfu #\.)
                  canlu-1
                  (morji-nunjavni-lerfu #\*)
                  canlu-1)
            porjahe:
            #t))))
    (define dot-one-or-more-52
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-.+
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
                  (morji-nunjavni-lerfu #\.)
                  canlu-1
                  (morji-nunjavni-lerfu #\+)
                  canlu-1)
            porjahe:
            #t))))
    (define optional-53
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-?
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
                  (morji-nunjavni-cmene selci-javni-22 cmene: "javni")
                  (morji-nunjavni-lerfu #\?)
                  canlu-1)
            porjahe:
            #t))))
    (define zero-or-more-54
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-*
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
                  (morji-nunjavni-cmene selci-javni-22 cmene: "javni")
                  (morji-nunjavni-lerfu #\*)
                  canlu-1)
            porjahe:
            #t))))
    (define one-or-more-55
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-+
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-11 cmene: "cmene")
                  (morji-nunjavni-cmene selci-javni-22 cmene: "javni")
                  (morji-nunjavni-lerfu #\+)
                  canlu-1)
            porjahe:
            #t))))
    (define and-predicate-56
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-&
          (morji-nunjavni-je
            (list (morji-nunjavni-lerfu #\&)
                  canlu-1
                  (morji-nunjavni-cmene selci-javni-22 cmene: "javni"))
            porjahe:
            #t))))
    (define end-of-input-57
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-fanmo
          (morji-nunjavni-je
            (list (morji-nunjavni-lerfu #\!)
                  canlu-1
                  (morji-nunjavni-lerfu #\.)
                  canlu-1)
            porjahe:
            #t))))
    (define not-predicate-58
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-!
          (morji-nunjavni-je
            (list (morji-nunjavni-lerfu #\!)
                  canlu-1
                  (morji-nunjavni-cmene selci-javni-22 cmene: "javni"))
            porjahe:
            #t))))
    (define cmene-sumti-59
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-cmene-sumti
          (morji-nunjavni-je
            (list (morji-nunjavni-valsi "#:")
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
                  canlu-1)
            porjahe:
            #t))))
    (define selci-javni-60
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list selci-naselci-23
                lerfu-selci-24
                valsi-selci-25
                klesi-selci-26
                denpabu-27
                girzu-javni-28))))
    (define selci-naselci-61
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-selci-naselci
          (morji-nunjavni-je
            (list (morji-nunjavni-cmene naselci-6 cmene: "naselci")
                  (morji-nunjavni-! (morji-nunjavni-valsi "<-")))
            porjahe:
            #t))))
    (define lerfu-selci-62
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-stura-lerfu-selci
                  (morji-nunjavni-je
                    (list (morji-nunjavni-valsi ",#\\")
                          (morji-nunjavni-cmene lerfu-cmene-29 cmene: "lerfu")
                          canlu-1)
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-stura-lerfu-selci
                  (morji-nunjavni-je
                    (list (morji-nunjavni-valsi ",#\\")
                          (morji-nunjavni-. cmene: "lerfu")
                          canlu-1)
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-lerfu-selci
                  (morji-nunjavni-je
                    (list (morji-nunjavni-valsi "#\\")
                          (morji-nunjavni-cmene lerfu-cmene-29 cmene: "lerfu")
                          canlu-1)
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-lerfu-selci
                  (morji-nunjavni-je
                    (list (morji-nunjavni-valsi "#\\")
                          (morji-nunjavni-. cmene: "lerfu")
                          canlu-1)
                    porjahe:
                    #t))))))
    (define lerfu-cmene-63
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-lerfu-space
                  (morji-nunjavni-valsi "space" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-lerfu-return
                  (morji-nunjavni-valsi "return" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-lerfu-linefeed
                  (morji-nunjavni-valsi "linefeed" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-lerfu-newline
                  (morji-nunjavni-valsi "newline" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-lerfu-tab
                  (morji-nunjavni-valsi "tab" porjahe: #t))))))
    (define valsi-selci-64
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-stura-empty-string
                  (morji-nunjavni-je
                    (list (morji-nunjavni-valsi ",\"\"") canlu-1)
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-empty-string
                  (morji-nunjavni-je
                    (list (morji-nunjavni-valsi "\"\"") canlu-1)
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-stura-valsi-selci
                  (morji-nunjavni-je
                    (list (morji-nunjavni-valsi ",\"")
                          (morji-nunjavni-+
                            (morji-nunjavni-je
                              (list (morji-nunjavni-!
                                      (morji-nunjavni-lerfu #\")
                                      porjahe:
                                      #t)
                                    (morji-nunjavni-porjahe valsi-lerfu-30))
                              porsumti:
                              #t)
                            cmene:
                            "valsi-lerfu")
                          (morji-nunjavni-lerfu #\")
                          canlu-1)
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-valsi-selci
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\")
                          (morji-nunjavni-+
                            (morji-nunjavni-je
                              (list (morji-nunjavni-!
                                      (morji-nunjavni-lerfu #\")
                                      porjahe:
                                      #t)
                                    (morji-nunjavni-porjahe valsi-lerfu-30))
                              porsumti:
                              #t)
                            cmene:
                            "valsi-lerfu")
                          (morji-nunjavni-lerfu #\")
                          canlu-1)
                    porjahe:
                    #t))))))
    (define valsi-lerfu-65
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-valsi-newline
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\\)
                          (morji-nunjavni-lerfu #\n))
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-valsi-linefeed
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\\)
                          (morji-nunjavni-lerfu #\r))
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-valsi-tab
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\\)
                          (morji-nunjavni-lerfu #\t))
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-valsi-backslash
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\\)
                          (morji-nunjavni-lerfu #\\))
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-valsi-single-quote
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\\)
                          (morji-nunjavni-lerfu #\'))
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-valsi-double-quote
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\\)
                          (morji-nunjavni-lerfu #\"))
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-valsi-lerfu
                  (morji-nunjavni-je
                    (list (morji-nunjavni-! (morji-nunjavni-lerfu #\\))
                          (morji-nunjavni-. cmene: "lerfu"))
                    porjahe:
                    #t))))))
    (define klesi-selci-66
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-klesi-selci-*
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\[)
                          (morji-nunjavni-+
                            klesi-lerfu-31
                            cmene:
                            "klesi-lerfu")
                          (morji-nunjavni-valsi "]*")
                          canlu-1)
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-klesi-selci-+
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\[)
                          (morji-nunjavni-+
                            klesi-lerfu-31
                            cmene:
                            "klesi-lerfu")
                          (morji-nunjavni-valsi "]+")
                          canlu-1)
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-klesi-selci
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\[)
                          (morji-nunjavni-+
                            klesi-lerfu-31
                            cmene:
                            "klesi-lerfu")
                          (morji-nunjavni-lerfu #\])
                          canlu-1)
                    porjahe:
                    #t))))))
    (define klesi-lerfu-67
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list klesi-cmene-32
                (morji-nunjavni-samselpla
                  samselpla-klesi-lerfu
                  (morji-nunjavni-je
                    (list (morji-nunjavni-! (morji-nunjavni-lerfu #\]))
                          (morji-nunjavni-. cmene: "klesi-lerfu"))
                    porjahe:
                    #t))))))
    (define klesi-cmene-68
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-alnum
                  (morji-nunjavni-valsi "[:alnum:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-alpha
                  (morji-nunjavni-valsi "[:alpha:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-ascii
                  (morji-nunjavni-valsi "[:ascii:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-blank
                  (morji-nunjavni-valsi "[:blank:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-cntrl
                  (morji-nunjavni-valsi "[:cntrl:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-digit
                  (morji-nunjavni-valsi "[:digit:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-graph
                  (morji-nunjavni-valsi "[:graph:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-jbolehu
                  (morji-nunjavni-valsi "[:jbole'u:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-jbocahu
                  (morji-nunjavni-valsi "[:jboca'u:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-lower
                  (morji-nunjavni-valsi "[:lower:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-odigit
                  (morji-nunjavni-valsi "[:odigit:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-print
                  (morji-nunjavni-valsi "[:print:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-punct
                  (morji-nunjavni-valsi "[:punct:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-space
                  (morji-nunjavni-valsi "[:space:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-upper
                  (morji-nunjavni-valsi "[:upper:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-xdigit
                  (morji-nunjavni-valsi "[:xdigit:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-^alnum
                  (morji-nunjavni-valsi "[:^alnum:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-^alpha
                  (morji-nunjavni-valsi "[:^alpha:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-^ascii
                  (morji-nunjavni-valsi "[:^ascii:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-^blank
                  (morji-nunjavni-valsi "[:^blank:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-^cntrl
                  (morji-nunjavni-valsi "[:^cntrl:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-^digit
                  (morji-nunjavni-valsi "[:^digit:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-^graph
                  (morji-nunjavni-valsi "[:^graph:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-^lower
                  (morji-nunjavni-valsi "[:^lower:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-^odigit
                  (morji-nunjavni-valsi "[:^odigit:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-^print
                  (morji-nunjavni-valsi "[:^print:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-^punct
                  (morji-nunjavni-valsi "[:^punct:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-^space
                  (morji-nunjavni-valsi "[:^space:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-^upper
                  (morji-nunjavni-valsi "[:^upper:]" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-^xdigit
                  (morji-nunjavni-valsi "[:^xdigit:]" porjahe: #t))))))
    (define denpabu-69
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-denpabu
          (morji-nunjavni-je
            (list (morji-nunjavni-lerfu #\.) canlu-1)
            porjahe:
            #t))))
    (define samselpla-70
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-samselpla-balvi
                  (morji-nunjavni-je
                    (list (morji-nunjavni-valsi "->" porjahe: #t)
                          (morji-nunjavni-porjahe canlu-1)
                          (morji-nunjavni-jonai
                            (list (morji-nunjavni-porjahe samselpla-xadni-33)
                                  (morji-nunjavni-porjahe samselpla-cmene-34))
                            porsumti:
                            #t
                            porjahe:
                            #t))
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-samselpla-cabna
                  (morji-nunjavni-je
                    (list (morji-nunjavni-valsi "-|" porjahe: #t)
                          (morji-nunjavni-porjahe canlu-1)
                          (morji-nunjavni-jonai
                            (list (morji-nunjavni-porjahe samselpla-xadni-33)
                                  (morji-nunjavni-porjahe samselpla-cmene-34))
                            porsumti:
                            #t
                            porjahe:
                            #t))
                    porjahe:
                    #t))))))
    (define samselpla-xadni-71
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-samselpla-xadni
          (morji-nunjavni-je
            (list (morji-nunjavni-lerfu #\{)
                  canlu-1
                  (morji-nunjavni-+
                    (morji-nunjavni-je
                      (list (morji-nunjavni-!
                              (morji-nunjavni-lerfu #\})
                              porjahe:
                              #t)
                            (morji-nunjavni-. porjahe: #t))
                      porsumti:
                      #t)
                    cmene:
                    "rodalerfu")
                  (morji-nunjavni-lerfu #\})
                  canlu-1)
            porjahe:
            #t))))
    (define samselpla-cmene-72
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-samselpla-cmene
          (morji-nunjavni-je
            (list (morji-nunjavni-char-set
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
                  canlu-1)
            porjahe:
            #t))))
    (define girzu-javni-73
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-empty-list
                  (morji-nunjavni-je
                    (list (morji-nunjavni-valsi "()") canlu-1)
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-girzu-javni
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\()
                          canlu-1
                          javni-7
                          (morji-nunjavni-lerfu #\))
                          canlu-1)
                    porjahe:
                    #t))))))
    (define canlu-74
      (nunjavni-morji
        (morji-nunjavni-*
          (morji-nunjavni-jonai
            (list (morji-nunjavni-porjahe canlubu-35)
                  (morji-nunjavni-porjahe totoi-36))
            porsumti:
            #t
            porjahe:
            #t)
          porsumti:
          #t
          nastura:
          #t)))
    (define canlubu-75
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-char-set char-set:whitespace) CRLF-37))))
    (define totoi-76
      (nunjavni-morji
        (morji-nunjavni-je
          (list (morji-nunjavni-lerfu #\; porjahe: #t)
                (morji-nunjavni-*
                  (morji-nunjavni-je
                    (list (morji-nunjavni-! CRLF-37 porjahe: #t)
                          (morji-nunjavni-. porjahe: #t))
                    porsumti:
                    #t
                    porjahe:
                    #t)
                  porsumti:
                  #t
                  porjahe:
                  #t)
                (morji-nunjavni-jonai
                  (list (morji-nunjavni-porjahe CRLF-37)
                        (morji-nunjavni-& FAhO-4 porjahe: #t))
                  porsumti:
                  #t
                  porjahe:
                  #t)))))
    (define CR-77 (morji-nunjavni-lerfu #\return))
    (define LF-78 (morji-nunjavni-lerfu #\newline))
    (define CRLF-79
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-je (list CR-38 LF-39)) CR-38 LF-39))))
    (define FAhO-80 (morji-nunjavni-fanmo))
    (tolmohi-nunjavni)
    (nunjavni-secuxna (lambda () "cfari") cfari-41)))
