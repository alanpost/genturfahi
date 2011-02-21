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
    (define cfari-44
      (nunjavni-secuxna
        (lambda () "cfari")
        (lambda (porsi mapti namapti) (cfari-45 porsi mapti namapti))))
    (define cfari-samselpla-2
      (nunjavni-secuxna
        (lambda () "cfari-samselpla")
        (lambda (porsi mapti namapti)
          (cfari-samselpla-46 porsi mapti namapti))))
    (define gerna-3
      (nunjavni-secuxna
        (lambda () "gerna")
        (lambda (porsi mapti namapti) (gerna-47 porsi mapti namapti))))
    (define smuni-5
      (nunjavni-secuxna
        (lambda () "smuni")
        (lambda (porsi mapti namapti) (smuni-48 porsi mapti namapti))))
    (define naselci-6
      (nunjavni-secuxna
        (lambda () "naselci")
        (lambda (porsi mapti namapti) (naselci-49 porsi mapti namapti))))
    (define javni-7
      (nunjavni-secuxna
        (lambda () "javni")
        (lambda (porsi mapti namapti) (javni-50 porsi mapti namapti))))
    (define jonai-8
      (nunjavni-secuxna
        (lambda () "jonai")
        (lambda (porsi mapti namapti) (jonai-51 porsi mapti namapti))))
    (define je-9
      (nunjavni-secuxna
        (lambda () "je")
        (lambda (porsi mapti namapti) (je-52 porsi mapti namapti))))
    (define nastura-pajavni-10
      (nunjavni-secuxna
        (lambda () "nastura-pajavni")
        (lambda (porsi mapti namapti)
          (nastura-pajavni-53 porsi mapti namapti))))
    (define pajavni-12
      (nunjavni-secuxna
        (lambda () "pajavni")
        (lambda (porsi mapti namapti) (pajavni-54 porsi mapti namapti))))
    (define dot-zero-or-more-13
      (nunjavni-secuxna
        (lambda () "dot-zero-or-more")
        (lambda (porsi mapti namapti)
          (dot-zero-or-more-55 porsi mapti namapti))))
    (define dot-one-or-more-14
      (nunjavni-secuxna
        (lambda () "dot-one-or-more")
        (lambda (porsi mapti namapti)
          (dot-one-or-more-56 porsi mapti namapti))))
    (define dot-kuspe-15
      (nunjavni-secuxna
        (lambda () "dot-kuspe")
        (lambda (porsi mapti namapti) (dot-kuspe-57 porsi mapti namapti))))
    (define optional-16
      (nunjavni-secuxna
        (lambda () "optional")
        (lambda (porsi mapti namapti) (optional-58 porsi mapti namapti))))
    (define zero-or-more-17
      (nunjavni-secuxna
        (lambda () "zero-or-more")
        (lambda (porsi mapti namapti) (zero-or-more-59 porsi mapti namapti))))
    (define one-or-more-18
      (nunjavni-secuxna
        (lambda () "one-or-more")
        (lambda (porsi mapti namapti) (one-or-more-60 porsi mapti namapti))))
    (define kuspe-19
      (nunjavni-secuxna
        (lambda () "kuspe")
        (lambda (porsi mapti namapti) (kuspe-61 porsi mapti namapti))))
    (define and-predicate-20
      (nunjavni-secuxna
        (lambda () "and-predicate")
        (lambda (porsi mapti namapti) (and-predicate-62 porsi mapti namapti))))
    (define end-of-input-21
      (nunjavni-secuxna
        (lambda () "end-of-input")
        (lambda (porsi mapti namapti) (end-of-input-63 porsi mapti namapti))))
    (define not-predicate-22
      (nunjavni-secuxna
        (lambda () "not-predicate")
        (lambda (porsi mapti namapti) (not-predicate-64 porsi mapti namapti))))
    (define cmene-sumti-23
      (nunjavni-secuxna
        (lambda () "cmene-sumti")
        (lambda (porsi mapti namapti) (cmene-sumti-65 porsi mapti namapti))))
    (define selci-javni-24
      (nunjavni-secuxna
        (lambda () "selci-javni")
        (lambda (porsi mapti namapti) (selci-javni-66 porsi mapti namapti))))
    (define selci-naselci-26
      (nunjavni-secuxna
        (lambda () "selci-naselci")
        (lambda (porsi mapti namapti) (selci-naselci-67 porsi mapti namapti))))
    (define lerfu-selci-27
      (nunjavni-secuxna
        (lambda () "lerfu-selci")
        (lambda (porsi mapti namapti) (lerfu-selci-68 porsi mapti namapti))))
    (define lerfu-cmene-32
      (nunjavni-secuxna
        (lambda () "lerfu-cmene")
        (lambda (porsi mapti namapti) (lerfu-cmene-69 porsi mapti namapti))))
    (define valsi-selci-28
      (nunjavni-secuxna
        (lambda () "valsi-selci")
        (lambda (porsi mapti namapti) (valsi-selci-70 porsi mapti namapti))))
    (define valsi-lerfu-33
      (nunjavni-secuxna
        (lambda () "valsi-lerfu")
        (lambda (porsi mapti namapti) (valsi-lerfu-71 porsi mapti namapti))))
    (define klesi-selci-29
      (nunjavni-secuxna
        (lambda () "klesi-selci")
        (lambda (porsi mapti namapti) (klesi-selci-72 porsi mapti namapti))))
    (define klesi-lerfu-34
      (nunjavni-secuxna
        (lambda () "klesi-lerfu")
        (lambda (porsi mapti namapti) (klesi-lerfu-73 porsi mapti namapti))))
    (define klesi-cmene-35
      (nunjavni-secuxna
        (lambda () "klesi-cmene")
        (lambda (porsi mapti namapti) (klesi-cmene-74 porsi mapti namapti))))
    (define klesi-binxo-36
      (nunjavni-secuxna
        (lambda () "klesi-binxo")
        (lambda (porsi mapti namapti) (klesi-binxo-75 porsi mapti namapti))))
    (define denpabu-30
      (nunjavni-secuxna
        (lambda () "denpabu")
        (lambda (porsi mapti namapti) (denpabu-76 porsi mapti namapti))))
    (define samselpla-11
      (nunjavni-secuxna
        (lambda () "samselpla")
        (lambda (porsi mapti namapti) (samselpla-77 porsi mapti namapti))))
    (define samselpla-xadni-37
      (nunjavni-secuxna
        (lambda () "samselpla-xadni")
        (lambda (porsi mapti namapti)
          (samselpla-xadni-78 porsi mapti namapti))))
    (define samselpla-cmene-38
      (nunjavni-secuxna
        (lambda () "samselpla-cmene")
        (lambda (porsi mapti namapti)
          (samselpla-cmene-79 porsi mapti namapti))))
    (define girzu-javni-31
      (nunjavni-secuxna
        (lambda () "girzu-javni")
        (lambda (porsi mapti namapti) (girzu-javni-80 porsi mapti namapti))))
    (define namcu-25
      (nunjavni-secuxna
        (lambda () "namcu")
        (lambda (porsi mapti namapti) (namcu-81 porsi mapti namapti))))
    (define canlu-1
      (nunjavni-secuxna
        (lambda () "canlu")
        (lambda (porsi mapti namapti) (canlu-82 porsi mapti namapti))))
    (define canlubu-39
      (nunjavni-secuxna
        (lambda () "canlubu")
        (lambda (porsi mapti namapti) (canlubu-83 porsi mapti namapti))))
    (define totoi-40
      (nunjavni-secuxna
        (lambda () "totoi")
        (lambda (porsi mapti namapti) (totoi-84 porsi mapti namapti))))
    (define CR-42
      (nunjavni-secuxna
        (lambda () "CR")
        (lambda (porsi mapti namapti) (CR-85 porsi mapti namapti))))
    (define LF-43
      (nunjavni-secuxna
        (lambda () "LF")
        (lambda (porsi mapti namapti) (LF-86 porsi mapti namapti))))
    (define CRLF-41
      (nunjavni-secuxna
        (lambda () "CRLF")
        (lambda (porsi mapti namapti) (CRLF-87 porsi mapti namapti))))
    (define FAhO-4
      (nunjavni-secuxna
        (lambda () "FAhO")
        (lambda (porsi mapti namapti) (FAhO-88 porsi mapti namapti))))
    (define cfari-45
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-cfari
          (morji-nunjavni-je
            (list canlu-1
                  (morji-nunjavni-* cfari-samselpla-2 nastura: #t)
                  canlu-1
                  (morji-nunjavni-cmene gerna-3 cmene: "gerna")
                  (morji-nunjavni-nastura FAhO-4))
            porjahe:
            #t))))
    (define cfari-samselpla-46
      (nunjavni-morji
        (morji-nunjavni-samselpla-cabna
          samselpla-cfari-samselpla
          (morji-nunjavni-je
            (list (morji-nunjavni-lerfu #\{ porjahe: #t)
                  (morji-nunjavni-porjahe canlu-1)
                  (morji-nunjavni-+
                    (morji-nunjavni-je
                      (list (morji-nunjavni-!
                              (morji-nunjavni-lerfu #\})
                              porjahe:
                              #t)
                            (morji-nunjavni-. porjahe: #t))
                      porsumti:
                      #t
                      porjahe:
                      #t)
                    cmene:
                    "rodalerfu"
                    porsumti:
                    #t
                    porjahe:
                    #t)
                  (morji-nunjavni-lerfu #\} porjahe: #t)
                  (morji-nunjavni-porjahe canlu-1))
            porjahe:
            #t))))
    (define gerna-47 (nunjavni-morji (morji-nunjavni-* smuni-5)))
    (define smuni-48
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
    (define naselci-49
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-naselci
          (morji-nunjavni-je
            (list (morji-nunjavni-char-set
                    (char-set-union
                      char-set:letter+digit
                      (char-set #\$ #\% #\: #\= #\> #\^ #\~ #\_ #\@))
                    cmene:
                    "cfari")
                  (morji-nunjavni-char-set-*
                    (char-set-union
                      char-set:letter+digit
                      (char-set
                        #\$
                        #\%
                        #\:
                        #\=
                        #\>
                        #\^
                        #\~
                        #\_
                        #\@
                        #\.
                        #\!
                        #\&
                        #\/
                        #\\
                        #\-))
                    cmene:
                    "fanmo")
                  canlu-1)
            porjahe:
            #t))))
    (define javni-50
      (nunjavni-morji (morji-nunjavni-jonai (list jonai-8 je-9))))
    (define jonai-51
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-jonai
          (morji-nunjavni-je
            (list (morji-nunjavni-cmene je-9 cmene: "cfari" porjahe: #t)
                  (morji-nunjavni-+
                    (morji-nunjavni-je
                      (list (morji-nunjavni-lerfu #\/ porjahe: #t)
                            (morji-nunjavni-porjahe canlu-1)
                            (morji-nunjavni-porjahe je-9))
                      porsumti:
                      #t
                      porjahe:
                      #t)
                    cmene:
                    "fanmo"
                    porsumti:
                    #t
                    porjahe:
                    #t))
            porjahe:
            #t))))
    (define je-52
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-je
          (morji-nunjavni-je
            (list (morji-nunjavni-+ nastura-pajavni-10 cmene: "javni")
                  (morji-nunjavni-? samselpla-11 cmene: "samselpla"))
            porjahe:
            #t))))
    (define nastura-pajavni-53
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-nastura-javni
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\`)
                          canlu-1
                          (morji-nunjavni-cmene pajavni-12 cmene: "javni"))
                    porjahe:
                    #t))
                pajavni-12))))
    (define pajavni-54
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list dot-zero-or-more-13
                dot-one-or-more-14
                dot-kuspe-15
                optional-16
                zero-or-more-17
                one-or-more-18
                kuspe-19
                and-predicate-20
                end-of-input-21
                not-predicate-22
                (morji-nunjavni-samselpla
                  samselpla-pajavni-cmene
                  (morji-nunjavni-je
                    (list (morji-nunjavni-? cmene-sumti-23 cmene: "cmene")
                          (morji-nunjavni-cmene selci-javni-24 cmene: "javni"))
                    porjahe:
                    #t))))))
    (define dot-zero-or-more-55
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-.*
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-23 cmene: "cmene")
                  (morji-nunjavni-lerfu #\.)
                  canlu-1
                  (morji-nunjavni-lerfu #\*)
                  canlu-1)
            porjahe:
            #t))))
    (define dot-one-or-more-56
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-.+
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-23 cmene: "cmene")
                  (morji-nunjavni-lerfu #\.)
                  canlu-1
                  (morji-nunjavni-lerfu #\+)
                  canlu-1)
            porjahe:
            #t))))
    (define dot-kuspe-57
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-.kuspe
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-23 cmene: "cmene" porjahe: #t)
                  (morji-nunjavni-lerfu #\. porjahe: #t)
                  (morji-nunjavni-porjahe canlu-1)
                  (morji-nunjavni-lerfu #\{ porjahe: #t)
                  (morji-nunjavni-porjahe canlu-1)
                  (morji-nunjavni-? namcu-25 cmene: "my" porjahe: #t)
                  (morji-nunjavni-?
                    (morji-nunjavni-je
                      (list (morji-nunjavni-lerfu
                              #\,
                              nastura:
                              #f
                              cmene:
                              "slakabu"
                              porjahe:
                              #t)
                            (morji-nunjavni-porjahe canlu-1))
                      porsumti:
                      #t
                      porjahe:
                      #t)
                    ni:
                    2
                    porsumti:
                    #t
                    porjahe:
                    #t)
                  (morji-nunjavni-? namcu-25 cmene: "ny" porjahe: #t)
                  (morji-nunjavni-lerfu #\} porjahe: #t)
                  (morji-nunjavni-porjahe canlu-1))
            porjahe:
            #t))))
    (define optional-58
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-?
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-23 cmene: "cmene")
                  (morji-nunjavni-cmene selci-javni-24 cmene: "javni")
                  (morji-nunjavni-lerfu #\?)
                  canlu-1)
            porjahe:
            #t))))
    (define zero-or-more-59
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-*
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-23 cmene: "cmene")
                  (morji-nunjavni-cmene selci-javni-24 cmene: "javni")
                  (morji-nunjavni-lerfu #\*)
                  canlu-1)
            porjahe:
            #t))))
    (define one-or-more-60
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-+
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-23 cmene: "cmene")
                  (morji-nunjavni-cmene selci-javni-24 cmene: "javni")
                  (morji-nunjavni-lerfu #\+)
                  canlu-1)
            porjahe:
            #t))))
    (define kuspe-61
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-kuspe
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-23 cmene: "cmene" porjahe: #t)
                  (morji-nunjavni-cmene
                    selci-javni-24
                    cmene:
                    "javni"
                    porjahe:
                    #t)
                  (morji-nunjavni-lerfu #\{ porjahe: #t)
                  (morji-nunjavni-porjahe canlu-1)
                  (morji-nunjavni-? namcu-25 cmene: "my" porjahe: #t)
                  (morji-nunjavni-?
                    (morji-nunjavni-je
                      (list (morji-nunjavni-lerfu
                              #\,
                              nastura:
                              #f
                              cmene:
                              "slakabu"
                              porjahe:
                              #t)
                            (morji-nunjavni-porjahe canlu-1))
                      porsumti:
                      #t
                      porjahe:
                      #t)
                    ni:
                    2
                    porsumti:
                    #t
                    porjahe:
                    #t)
                  (morji-nunjavni-? namcu-25 cmene: "ny" porjahe: #t)
                  (morji-nunjavni-lerfu #\} porjahe: #t)
                  (morji-nunjavni-porjahe canlu-1))
            porjahe:
            #t))))
    (define and-predicate-62
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-&
          (morji-nunjavni-je
            (list (morji-nunjavni-lerfu #\&)
                  canlu-1
                  (morji-nunjavni-cmene selci-javni-24 cmene: "javni"))
            porjahe:
            #t))))
    (define end-of-input-63
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
    (define not-predicate-64
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-!
          (morji-nunjavni-je
            (list (morji-nunjavni-lerfu #\!)
                  canlu-1
                  (morji-nunjavni-cmene selci-javni-24 cmene: "javni"))
            porjahe:
            #t))))
    (define cmene-sumti-65
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-cmene-sumti
          (morji-nunjavni-je
            (list (morji-nunjavni-valsi "#:")
                  (morji-nunjavni-char-set
                    (char-set-union
                      char-set:letter+digit
                      (char-set #\$ #\% #\: #\= #\> #\^ #\~ #\_ #\@))
                    cmene:
                    "cfari")
                  (morji-nunjavni-char-set-*
                    (char-set-union
                      char-set:letter+digit
                      (char-set
                        #\$
                        #\%
                        #\:
                        #\=
                        #\>
                        #\^
                        #\~
                        #\_
                        #\@
                        #\.
                        #\!
                        #\&
                        #\/
                        #\\
                        #\-))
                    cmene:
                    "fanmo")
                  canlu-1)
            porjahe:
            #t))))
    (define selci-javni-66
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list selci-naselci-26
                lerfu-selci-27
                valsi-selci-28
                klesi-selci-29
                denpabu-30
                girzu-javni-31))))
    (define selci-naselci-67
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-selci-naselci
          (morji-nunjavni-je
            (list (morji-nunjavni-cmene naselci-6 cmene: "naselci")
                  (morji-nunjavni-! (morji-nunjavni-valsi "<-")))
            porjahe:
            #t))))
    (define lerfu-selci-68
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-stura-lerfu-selci
                  (morji-nunjavni-je
                    (list (morji-nunjavni-valsi ",#\\")
                          (morji-nunjavni-cmene lerfu-cmene-32 cmene: "lerfu")
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
                          (morji-nunjavni-cmene lerfu-cmene-32 cmene: "lerfu")
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
    (define lerfu-cmene-69
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
                  (morji-nunjavni-valsi "tab" porjahe: #t))
                (morji-nunjavni-samselpla
                  samselpla-lerfu-page
                  (morji-nunjavni-valsi "page" porjahe: #t))))))
    (define valsi-selci-70
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
                    (list (morji-nunjavni-valsi ",\"" porjahe: #t)
                          (morji-nunjavni-+
                            (morji-nunjavni-je
                              (list (morji-nunjavni-!
                                      (morji-nunjavni-lerfu #\")
                                      porjahe:
                                      #t)
                                    (morji-nunjavni-porjahe valsi-lerfu-33))
                              porsumti:
                              #t
                              porjahe:
                              #t)
                            cmene:
                            "valsi-lerfu"
                            porsumti:
                            #t
                            porjahe:
                            #t)
                          (morji-nunjavni-lerfu #\" porjahe: #t)
                          (morji-nunjavni-porjahe canlu-1))
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-valsi-selci
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\" porjahe: #t)
                          (morji-nunjavni-+
                            (morji-nunjavni-je
                              (list (morji-nunjavni-!
                                      (morji-nunjavni-lerfu #\")
                                      porjahe:
                                      #t)
                                    (morji-nunjavni-porjahe valsi-lerfu-33))
                              porsumti:
                              #t
                              porjahe:
                              #t)
                            cmene:
                            "valsi-lerfu"
                            porsumti:
                            #t
                            porjahe:
                            #t)
                          (morji-nunjavni-lerfu #\" porjahe: #t)
                          (morji-nunjavni-porjahe canlu-1))
                    porjahe:
                    #t))))))
    (define valsi-lerfu-71
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
                  samselpla-valsi-return
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
                  samselpla-valsi-page
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\\)
                          (morji-nunjavni-lerfu #\f))
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
    (define klesi-selci-72
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-klesi-selci-*
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\[)
                          (morji-nunjavni-+
                            klesi-lerfu-34
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
                            klesi-lerfu-34
                            cmene:
                            "klesi-lerfu")
                          (morji-nunjavni-valsi "]+")
                          canlu-1)
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-klesi-selci-kuspe
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\[ porjahe: #t)
                          (morji-nunjavni-+
                            klesi-lerfu-34
                            cmene:
                            "klesi-lerfu"
                            porjahe:
                            #t)
                          (morji-nunjavni-valsi "]" porjahe: #t)
                          (morji-nunjavni-porjahe canlu-1)
                          (morji-nunjavni-lerfu #\{ porjahe: #t)
                          (morji-nunjavni-porjahe canlu-1)
                          (morji-nunjavni-? namcu-25 cmene: "my" porjahe: #t)
                          (morji-nunjavni-?
                            (morji-nunjavni-je
                              (list (morji-nunjavni-lerfu
                                      #\,
                                      nastura:
                                      #f
                                      cmene:
                                      "slakabu"
                                      porjahe:
                                      #t)
                                    (morji-nunjavni-porjahe canlu-1))
                              porsumti:
                              #t
                              porjahe:
                              #t)
                            ni:
                            2
                            porsumti:
                            #t
                            porjahe:
                            #t)
                          (morji-nunjavni-? namcu-25 cmene: "ny" porjahe: #t)
                          (morji-nunjavni-lerfu #\} porjahe: #t)
                          (morji-nunjavni-porjahe canlu-1))
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-klesi-selci
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\[)
                          (morji-nunjavni-+
                            klesi-lerfu-34
                            cmene:
                            "klesi-lerfu")
                          (morji-nunjavni-lerfu #\])
                          canlu-1)
                    porjahe:
                    #t))))))
    (define klesi-lerfu-73
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list klesi-cmene-35
                klesi-binxo-36
                (morji-nunjavni-samselpla
                  samselpla-klesi-lerfu
                  (morji-nunjavni-je
                    (list (morji-nunjavni-! (morji-nunjavni-lerfu #\]))
                          (morji-nunjavni-. cmene: "klesi-lerfu"))
                    porjahe:
                    #t))))))
    (define klesi-cmene-74
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
    (define klesi-binxo-75
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-klesi-newline
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\\)
                          (morji-nunjavni-lerfu #\n))
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-klesi-return
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\\)
                          (morji-nunjavni-lerfu #\r))
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-klesi-tab
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\\)
                          (morji-nunjavni-lerfu #\t))
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-klesi-page
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\\)
                          (morji-nunjavni-lerfu #\f))
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-klesi-lbracket
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\\)
                          (morji-nunjavni-lerfu #\[))
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-klesi-rbracket
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\\)
                          (morji-nunjavni-lerfu #\]))
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-klesi-backslash
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\\)
                          (morji-nunjavni-lerfu #\\))
                    porjahe:
                    #t))))))
    (define denpabu-76
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-denpabu
          (morji-nunjavni-je
            (list (morji-nunjavni-lerfu #\.) canlu-1)
            porjahe:
            #t))))
    (define samselpla-77
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-samselpla-balvi
                  (morji-nunjavni-je
                    (list (morji-nunjavni-valsi "->" porjahe: #t)
                          (morji-nunjavni-porjahe canlu-1)
                          (morji-nunjavni-jonai
                            (list (morji-nunjavni-porjahe samselpla-xadni-37)
                                  (morji-nunjavni-porjahe samselpla-cmene-38))
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
                            (list (morji-nunjavni-porjahe samselpla-xadni-37)
                                  (morji-nunjavni-porjahe samselpla-cmene-38))
                            porsumti:
                            #t
                            porjahe:
                            #t))
                    porjahe:
                    #t))))))
    (define samselpla-xadni-78
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-samselpla-xadni
          (morji-nunjavni-je
            (list (morji-nunjavni-lerfu #\{ porjahe: #t)
                  (morji-nunjavni-porjahe canlu-1)
                  (morji-nunjavni-+
                    (morji-nunjavni-je
                      (list (morji-nunjavni-!
                              (morji-nunjavni-lerfu #\})
                              porjahe:
                              #t)
                            (morji-nunjavni-. porjahe: #t))
                      porsumti:
                      #t
                      porjahe:
                      #t)
                    cmene:
                    "rodalerfu"
                    porsumti:
                    #t
                    porjahe:
                    #t)
                  (morji-nunjavni-lerfu #\} porjahe: #t)
                  (morji-nunjavni-porjahe canlu-1))
            porjahe:
            #t))))
    (define samselpla-cmene-79
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-samselpla-cmene
          (morji-nunjavni-je
            (list (morji-nunjavni-char-set
                    (char-set-union
                      char-set:letter+digit
                      (char-set #\$ #\% #\: #\= #\> #\^ #\~ #\_ #\@))
                    cmene:
                    "cfari")
                  (morji-nunjavni-char-set-*
                    (char-set-union
                      char-set:letter+digit
                      (char-set
                        #\$
                        #\%
                        #\:
                        #\=
                        #\>
                        #\^
                        #\~
                        #\_
                        #\@
                        #\.
                        #\!
                        #\&
                        #\/
                        #\\
                        #\-))
                    cmene:
                    "fanmo")
                  canlu-1)
            porjahe:
            #t))))
    (define girzu-javni-80
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
    (define namcu-81
      (nunjavni-morji
        (morji-nunjavni-je
          (list (morji-nunjavni-char-set-+ char-set:digit) canlu-1))))
    (define canlu-82
      (nunjavni-morji
        (morji-nunjavni-*
          (morji-nunjavni-jonai
            (list (morji-nunjavni-porjahe canlubu-39)
                  (morji-nunjavni-porjahe totoi-40))
            porsumti:
            #t
            porjahe:
            #t)
          porsumti:
          #t
          nastura:
          #t)))
    (define canlubu-83
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-char-set char-set:whitespace) CRLF-41))))
    (define totoi-84
      (nunjavni-morji
        (morji-nunjavni-je
          (list (morji-nunjavni-lerfu #\; porjahe: #t)
                (morji-nunjavni-*
                  (morji-nunjavni-je
                    (list (morji-nunjavni-! CRLF-41 porjahe: #t)
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
                  (list (morji-nunjavni-porjahe CRLF-41)
                        (morji-nunjavni-& FAhO-4 porjahe: #t))
                  porsumti:
                  #t
                  porjahe:
                  #t)))))
    (define CR-85 (morji-nunjavni-lerfu #\return))
    (define LF-86 (morji-nunjavni-lerfu #\newline))
    (define CRLF-87
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-je (list CR-42 LF-43)) CR-42 LF-43))))
    (define FAhO-88 (morji-nunjavni-fanmo))
    (tolmohi-nunjavni)
    cfari-44))
