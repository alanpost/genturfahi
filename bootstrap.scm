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
    (define cfari-5
      (nunjavni-secuxna
        (lambda () 'cfari)
        (lambda (porsi mapti namapti) (cfari-6 porsi mapti namapti))))
    (define cfari-samselpla-2
      (nunjavni-secuxna
        (lambda () 'cfari-samselpla)
        (lambda (porsi mapti namapti)
          (cfari-samselpla-7 porsi mapti namapti))))
    (define gerna-3
      (nunjavni-secuxna
        (lambda () 'gerna)
        (lambda (porsi mapti namapti) (gerna-9 porsi mapti namapti))))
    (define smuni-8
      (nunjavni-secuxna
        (lambda () 'smuni)
        (lambda (porsi mapti namapti) (smuni-12 porsi mapti namapti))))
    (define naselci-10
      (nunjavni-secuxna
        (lambda () 'naselci)
        (lambda (porsi mapti namapti) (naselci-13 porsi mapti namapti))))
    (define javni-11
      (nunjavni-secuxna
        (lambda () 'javni)
        (lambda (porsi mapti namapti) (javni-16 porsi mapti namapti))))
    (define jonai-14
      (nunjavni-secuxna
        (lambda () 'jonai)
        (lambda (porsi mapti namapti) (jonai-17 porsi mapti namapti))))
    (define je-15
      (nunjavni-secuxna
        (lambda () 'je)
        (lambda (porsi mapti namapti) (je-20 porsi mapti namapti))))
    (define nastura-pajavni-18
      (nunjavni-secuxna
        (lambda () 'nastura-pajavni)
        (lambda (porsi mapti namapti)
          (nastura-pajavni-22 porsi mapti namapti))))
    (define pajavni-21
      (nunjavni-secuxna
        (lambda () 'pajavni)
        (lambda (porsi mapti namapti) (pajavni-35 porsi mapti namapti))))
    (define dot-zero-or-more-23
      (nunjavni-secuxna
        (lambda () 'dot-zero-or-more)
        (lambda (porsi mapti namapti)
          (dot-zero-or-more-36 porsi mapti namapti))))
    (define dot-one-or-more-24
      (nunjavni-secuxna
        (lambda () 'dot-one-or-more)
        (lambda (porsi mapti namapti)
          (dot-one-or-more-37 porsi mapti namapti))))
    (define dot-kuspe-25
      (nunjavni-secuxna
        (lambda () 'dot-kuspe)
        (lambda (porsi mapti namapti) (dot-kuspe-39 porsi mapti namapti))))
    (define optional-26
      (nunjavni-secuxna
        (lambda () 'optional)
        (lambda (porsi mapti namapti) (optional-40 porsi mapti namapti))))
    (define zero-or-more-27
      (nunjavni-secuxna
        (lambda () 'zero-or-more)
        (lambda (porsi mapti namapti) (zero-or-more-41 porsi mapti namapti))))
    (define one-or-more-28
      (nunjavni-secuxna
        (lambda () 'one-or-more)
        (lambda (porsi mapti namapti) (one-or-more-42 porsi mapti namapti))))
    (define kuspe-29
      (nunjavni-secuxna
        (lambda () 'kuspe)
        (lambda (porsi mapti namapti) (kuspe-43 porsi mapti namapti))))
    (define and-predicate-30
      (nunjavni-secuxna
        (lambda () 'and-predicate)
        (lambda (porsi mapti namapti) (and-predicate-44 porsi mapti namapti))))
    (define end-of-input-31
      (nunjavni-secuxna
        (lambda () 'end-of-input)
        (lambda (porsi mapti namapti) (end-of-input-45 porsi mapti namapti))))
    (define not-predicate-32
      (nunjavni-secuxna
        (lambda () 'not-predicate)
        (lambda (porsi mapti namapti) (not-predicate-46 porsi mapti namapti))))
    (define cmene-sumti-33
      (nunjavni-secuxna
        (lambda () 'cmene-sumti)
        (lambda (porsi mapti namapti) (cmene-sumti-47 porsi mapti namapti))))
    (define selci-javni-34
      (nunjavni-secuxna
        (lambda () 'selci-javni)
        (lambda (porsi mapti namapti) (selci-javni-54 porsi mapti namapti))))
    (define selci-naselci-48
      (nunjavni-secuxna
        (lambda () 'selci-naselci)
        (lambda (porsi mapti namapti) (selci-naselci-55 porsi mapti namapti))))
    (define lerfu-selci-49
      (nunjavni-secuxna
        (lambda () 'lerfu-selci)
        (lambda (porsi mapti namapti) (lerfu-selci-57 porsi mapti namapti))))
    (define lerfu-cmene-56
      (nunjavni-secuxna
        (lambda () 'lerfu-cmene)
        (lambda (porsi mapti namapti) (lerfu-cmene-58 porsi mapti namapti))))
    (define valsi-selci-50
      (nunjavni-secuxna
        (lambda () 'valsi-selci)
        (lambda (porsi mapti namapti) (valsi-selci-60 porsi mapti namapti))))
    (define valsi-lerfu-59
      (nunjavni-secuxna
        (lambda () 'valsi-lerfu)
        (lambda (porsi mapti namapti) (valsi-lerfu-61 porsi mapti namapti))))
    (define klesi-selci-51
      (nunjavni-secuxna
        (lambda () 'klesi-selci)
        (lambda (porsi mapti namapti) (klesi-selci-63 porsi mapti namapti))))
    (define klesi-lerfu-62
      (nunjavni-secuxna
        (lambda () 'klesi-lerfu)
        (lambda (porsi mapti namapti) (klesi-lerfu-66 porsi mapti namapti))))
    (define klesi-cmene-64
      (nunjavni-secuxna
        (lambda () 'klesi-cmene)
        (lambda (porsi mapti namapti) (klesi-cmene-67 porsi mapti namapti))))
    (define klesi-binxo-65
      (nunjavni-secuxna
        (lambda () 'klesi-binxo)
        (lambda (porsi mapti namapti) (klesi-binxo-68 porsi mapti namapti))))
    (define denpabu-52
      (nunjavni-secuxna
        (lambda () 'denpabu)
        (lambda (porsi mapti namapti) (denpabu-69 porsi mapti namapti))))
    (define samselpla-19
      (nunjavni-secuxna
        (lambda () 'samselpla)
        (lambda (porsi mapti namapti) (samselpla-72 porsi mapti namapti))))
    (define samselpla-xadni-70
      (nunjavni-secuxna
        (lambda () 'samselpla-xadni)
        (lambda (porsi mapti namapti)
          (samselpla-xadni-73 porsi mapti namapti))))
    (define samselpla-cmene-71
      (nunjavni-secuxna
        (lambda () 'samselpla-cmene)
        (lambda (porsi mapti namapti)
          (samselpla-cmene-74 porsi mapti namapti))))
    (define girzu-javni-53
      (nunjavni-secuxna
        (lambda () 'girzu-javni)
        (lambda (porsi mapti namapti) (girzu-javni-75 porsi mapti namapti))))
    (define namcu-38
      (nunjavni-secuxna
        (lambda () 'namcu)
        (lambda (porsi mapti namapti) (namcu-76 porsi mapti namapti))))
    (define canlu-1
      (nunjavni-secuxna
        (lambda () 'canlu)
        (lambda (porsi mapti namapti) (canlu-79 porsi mapti namapti))))
    (define canlubu-77
      (nunjavni-secuxna
        (lambda () 'canlubu)
        (lambda (porsi mapti namapti) (canlubu-81 porsi mapti namapti))))
    (define totoi-78
      (nunjavni-secuxna
        (lambda () 'totoi)
        (lambda (porsi mapti namapti) (totoi-82 porsi mapti namapti))))
    (define CR-83
      (nunjavni-secuxna
        (lambda () 'CR)
        (lambda (porsi mapti namapti) (CR-84 porsi mapti namapti))))
    (define LF-85
      (nunjavni-secuxna
        (lambda () 'LF)
        (lambda (porsi mapti namapti) (LF-86 porsi mapti namapti))))
    (define CRLF-80
      (nunjavni-secuxna
        (lambda () 'CRLF)
        (lambda (porsi mapti namapti) (CRLF-87 porsi mapti namapti))))
    (define FAhO-4
      (nunjavni-secuxna
        (lambda () 'FAhO)
        (lambda (porsi mapti namapti) (FAhO-88 porsi mapti namapti))))
    (define cfari-6
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
    (define cfari-samselpla-7
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
            porsumti:
            #t
            porjahe:
            #t))))
    (define gerna-9 (nunjavni-morji (morji-nunjavni-* smuni-8)))
    (define smuni-12
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-smuni
          (morji-nunjavni-je
            (list (morji-nunjavni-cmene
                    naselci-10
                    cmene:
                    "naselci"
                    porjahe:
                    #t)
                  (morji-nunjavni-jonai
                    (list (morji-nunjavni-valsi "<-" porjahe: #t)
                          (morji-nunjavni-valsi "←" porjahe: #t))
                    porsumti:
                    #t
                    porjahe:
                    #t)
                  (morji-nunjavni-porjahe canlu-1)
                  (morji-nunjavni-cmene javni-11 cmene: "javni" porjahe: #t))
            porsumti:
            #t
            porjahe:
            #t))))
    (define naselci-13
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
    (define javni-16
      (nunjavni-morji (morji-nunjavni-jonai (list jonai-14 je-15))))
    (define jonai-17
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-jonai
          (morji-nunjavni-je
            (list (morji-nunjavni-cmene je-15 cmene: "cfari" porjahe: #t)
                  (morji-nunjavni-+
                    (morji-nunjavni-je
                      (list (morji-nunjavni-lerfu #\/ porjahe: #t)
                            (morji-nunjavni-porjahe canlu-1)
                            (morji-nunjavni-porjahe je-15))
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
            porsumti:
            #t
            porjahe:
            #t))))
    (define je-20
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-je
          (morji-nunjavni-je
            (list (morji-nunjavni-+ nastura-pajavni-18 cmene: "javni")
                  (morji-nunjavni-? samselpla-19 cmene: "samselpla"))
            porjahe:
            #t))))
    (define nastura-pajavni-22
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-nastura-javni
                  (morji-nunjavni-je
                    (list (morji-nunjavni-jonai
                            (list (morji-nunjavni-lerfu #\` porjahe: #t)
                                  (morji-nunjavni-lerfu #\u2018 porjahe: #t))
                            porsumti:
                            #t
                            porjahe:
                            #t)
                          (morji-nunjavni-porjahe canlu-1)
                          (morji-nunjavni-cmene
                            pajavni-21
                            cmene:
                            "javni"
                            porjahe:
                            #t))
                    porsumti:
                    #t
                    porjahe:
                    #t))
                pajavni-21))))
    (define pajavni-35
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list dot-zero-or-more-23
                dot-one-or-more-24
                dot-kuspe-25
                optional-26
                zero-or-more-27
                one-or-more-28
                kuspe-29
                and-predicate-30
                end-of-input-31
                not-predicate-32
                (morji-nunjavni-samselpla
                  samselpla-pajavni-cmene
                  (morji-nunjavni-je
                    (list (morji-nunjavni-? cmene-sumti-33 cmene: "cmene")
                          (morji-nunjavni-cmene selci-javni-34 cmene: "javni"))
                    porjahe:
                    #t))))))
    (define dot-zero-or-more-36
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-.*
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-33 cmene: "cmene")
                  (morji-nunjavni-lerfu #\.)
                  canlu-1
                  (morji-nunjavni-lerfu #\*)
                  canlu-1)
            porjahe:
            #t))))
    (define dot-one-or-more-37
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-.+
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-33 cmene: "cmene")
                  (morji-nunjavni-lerfu #\.)
                  canlu-1
                  (morji-nunjavni-lerfu #\+)
                  canlu-1)
            porjahe:
            #t))))
    (define dot-kuspe-39
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-.kuspe
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-33 cmene: "cmene" porjahe: #t)
                  (morji-nunjavni-lerfu #\. porjahe: #t)
                  (morji-nunjavni-porjahe canlu-1)
                  (morji-nunjavni-lerfu #\{ porjahe: #t)
                  (morji-nunjavni-porjahe canlu-1)
                  (morji-nunjavni-? namcu-38 cmene: "my" porjahe: #t)
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
                  (morji-nunjavni-? namcu-38 cmene: "ny" porjahe: #t)
                  (morji-nunjavni-lerfu #\} porjahe: #t)
                  (morji-nunjavni-porjahe canlu-1))
            porsumti:
            #t
            porjahe:
            #t))))
    (define optional-40
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-?
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-33 cmene: "cmene")
                  (morji-nunjavni-cmene selci-javni-34 cmene: "javni")
                  (morji-nunjavni-lerfu #\?)
                  canlu-1)
            porjahe:
            #t))))
    (define zero-or-more-41
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-*
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-33 cmene: "cmene")
                  (morji-nunjavni-cmene selci-javni-34 cmene: "javni")
                  (morji-nunjavni-lerfu #\*)
                  canlu-1)
            porjahe:
            #t))))
    (define one-or-more-42
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-+
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-33 cmene: "cmene")
                  (morji-nunjavni-cmene selci-javni-34 cmene: "javni")
                  (morji-nunjavni-lerfu #\+)
                  canlu-1)
            porjahe:
            #t))))
    (define kuspe-43
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-kuspe
          (morji-nunjavni-je
            (list (morji-nunjavni-? cmene-sumti-33 cmene: "cmene" porjahe: #t)
                  (morji-nunjavni-cmene
                    selci-javni-34
                    cmene:
                    "javni"
                    porjahe:
                    #t)
                  (morji-nunjavni-lerfu #\{ porjahe: #t)
                  (morji-nunjavni-porjahe canlu-1)
                  (morji-nunjavni-? namcu-38 cmene: "my" porjahe: #t)
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
                  (morji-nunjavni-? namcu-38 cmene: "ny" porjahe: #t)
                  (morji-nunjavni-lerfu #\} porjahe: #t)
                  (morji-nunjavni-porjahe canlu-1))
            porsumti:
            #t
            porjahe:
            #t))))
    (define and-predicate-44
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-&
          (morji-nunjavni-je
            (list (morji-nunjavni-lerfu #\&)
                  canlu-1
                  (morji-nunjavni-cmene selci-javni-34 cmene: "javni"))
            porjahe:
            #t))))
    (define end-of-input-45
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
    (define not-predicate-46
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-!
          (morji-nunjavni-je
            (list (morji-nunjavni-lerfu #\!)
                  canlu-1
                  (morji-nunjavni-cmene selci-javni-34 cmene: "javni"))
            porjahe:
            #t))))
    (define cmene-sumti-47
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
    (define selci-javni-54
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list selci-naselci-48
                lerfu-selci-49
                valsi-selci-50
                klesi-selci-51
                denpabu-52
                girzu-javni-53))))
    (define selci-naselci-55
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-selci-naselci
          (morji-nunjavni-je
            (list (morji-nunjavni-cmene naselci-10 cmene: "naselci")
                  (morji-nunjavni-!
                    (morji-nunjavni-jonai
                      (list (morji-nunjavni-valsi "<-" porjahe: #t)
                            (morji-nunjavni-valsi "←" porjahe: #t))
                      porsumti:
                      #t)))
            porjahe:
            #t))))
    (define lerfu-selci-57
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-stura-lerfu-selci
                  (morji-nunjavni-je
                    (list (morji-nunjavni-valsi ",#\\")
                          (morji-nunjavni-cmene lerfu-cmene-56 cmene: "lerfu")
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
                          (morji-nunjavni-cmene lerfu-cmene-56 cmene: "lerfu")
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
    (define lerfu-cmene-58
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
    (define valsi-selci-60
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-stura-empty-string
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\, porjahe: #t)
                          (morji-nunjavni-jonai
                            (list (morji-nunjavni-valsi "\"\"" porjahe: #t)
                                  (morji-nunjavni-valsi "“”" porjahe: #t))
                            porsumti:
                            #t
                            porjahe:
                            #t)
                          (morji-nunjavni-porjahe canlu-1))
                    porsumti:
                    #t
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-empty-string
                  (morji-nunjavni-je
                    (list (morji-nunjavni-jonai
                            (list (morji-nunjavni-valsi "\"\"" porjahe: #t)
                                  (morji-nunjavni-valsi "“”" porjahe: #t))
                            porsumti:
                            #t
                            porjahe:
                            #t)
                          (morji-nunjavni-porjahe canlu-1))
                    porsumti:
                    #t
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-stura-valsi-selci
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\, porjahe: #t)
                          (morji-nunjavni-jonai
                            (list (morji-nunjavni-lerfu #\" porjahe: #t)
                                  (morji-nunjavni-lerfu #\u201c porjahe: #t))
                            porsumti:
                            #t
                            porjahe:
                            #t)
                          (morji-nunjavni-+
                            (morji-nunjavni-je
                              (list (morji-nunjavni-!
                                      (morji-nunjavni-jonai
                                        (list (morji-nunjavni-lerfu #\" porjahe: #t)
                                              (morji-nunjavni-lerfu #\u201c porjahe: #t)
                                              (morji-nunjavni-lerfu #\u201d porjahe: #t))
                                        porsumti:
                                        #t)
                                      porjahe:
                                      #t)
                                    (morji-nunjavni-porjahe valsi-lerfu-59))
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
                          (morji-nunjavni-jonai
                            (list (morji-nunjavni-lerfu #\" porjahe: #t)
                                  (morji-nunjavni-lerfu #\u201d porjahe: #t))
                            porsumti:
                            #t
                            porjahe:
                            #t)
                          (morji-nunjavni-porjahe canlu-1))
                    porsumti:
                    #t
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-valsi-selci
                  (morji-nunjavni-je
                    (list (morji-nunjavni-jonai
                            (list (morji-nunjavni-lerfu #\" porjahe: #t)
                                  (morji-nunjavni-lerfu #\u201c porjahe: #t))
                            porsumti:
                            #t
                            porjahe:
                            #t)
                          (morji-nunjavni-+
                            (morji-nunjavni-je
                              (list (morji-nunjavni-!
                                      (morji-nunjavni-jonai
                                        (list (morji-nunjavni-lerfu #\" porjahe: #t)
                                              (morji-nunjavni-lerfu #\u201c porjahe: #t)
                                              (morji-nunjavni-lerfu #\u201d porjahe: #t))
                                        porsumti:
                                        #t)
                                      porjahe:
                                      #t)
                                    (morji-nunjavni-porjahe valsi-lerfu-59))
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
                          (morji-nunjavni-jonai
                            (list (morji-nunjavni-lerfu #\" porjahe: #t)
                                  (morji-nunjavni-lerfu #\u201d porjahe: #t))
                            porsumti:
                            #t
                            porjahe:
                            #t)
                          (morji-nunjavni-porjahe canlu-1))
                    porsumti:
                    #t
                    porjahe:
                    #t))))))
    (define valsi-lerfu-61
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
                  samselpla-valsi-left-single-quote
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\\)
                          (morji-nunjavni-lerfu #\u2018))
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-valsi-right-single-quote
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\\)
                          (morji-nunjavni-lerfu #\u2019))
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-valsi-left-double-quote
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\\)
                          (morji-nunjavni-lerfu #\u201c))
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-valsi-right-double-quote
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\\)
                          (morji-nunjavni-lerfu #\u201d))
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
    (define klesi-selci-63
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-klesi-selci-*
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\[)
                          (morji-nunjavni-+
                            klesi-lerfu-62
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
                            klesi-lerfu-62
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
                            klesi-lerfu-62
                            cmene:
                            "klesi-lerfu"
                            porjahe:
                            #t)
                          (morji-nunjavni-valsi "]" porjahe: #t)
                          (morji-nunjavni-porjahe canlu-1)
                          (morji-nunjavni-lerfu #\{ porjahe: #t)
                          (morji-nunjavni-porjahe canlu-1)
                          (morji-nunjavni-? namcu-38 cmene: "my" porjahe: #t)
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
                          (morji-nunjavni-? namcu-38 cmene: "ny" porjahe: #t)
                          (morji-nunjavni-lerfu #\} porjahe: #t)
                          (morji-nunjavni-porjahe canlu-1))
                    porsumti:
                    #t
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-klesi-selci
                  (morji-nunjavni-je
                    (list (morji-nunjavni-lerfu #\[)
                          (morji-nunjavni-+
                            klesi-lerfu-62
                            cmene:
                            "klesi-lerfu")
                          (morji-nunjavni-lerfu #\])
                          canlu-1)
                    porjahe:
                    #t))))))
    (define klesi-lerfu-66
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list klesi-cmene-64
                klesi-binxo-65
                (morji-nunjavni-samselpla
                  samselpla-klesi-lerfu
                  (morji-nunjavni-je
                    (list (morji-nunjavni-! (morji-nunjavni-lerfu #\]))
                          (morji-nunjavni-. cmene: "klesi-lerfu"))
                    porjahe:
                    #t))))))
    (define klesi-cmene-67
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
    (define klesi-binxo-68
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
    (define denpabu-69
      (nunjavni-morji
        (morji-nunjavni-samselpla
          samselpla-denpabu
          (morji-nunjavni-je
            (list (morji-nunjavni-lerfu #\.) canlu-1)
            porjahe:
            #t))))
    (define samselpla-72
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-samselpla
                  samselpla-samselpla-balvi
                  (morji-nunjavni-je
                    (list (morji-nunjavni-jonai
                            (list (morji-nunjavni-valsi "->" porjahe: #t)
                                  (morji-nunjavni-valsi "→" porjahe: #t))
                            porsumti:
                            #t
                            porjahe:
                            #t)
                          (morji-nunjavni-porjahe canlu-1)
                          (morji-nunjavni-jonai
                            (list (morji-nunjavni-porjahe samselpla-xadni-70)
                                  (morji-nunjavni-porjahe samselpla-cmene-71))
                            porsumti:
                            #t
                            porjahe:
                            #t))
                    porsumti:
                    #t
                    porjahe:
                    #t))
                (morji-nunjavni-samselpla
                  samselpla-samselpla-cabna
                  (morji-nunjavni-je
                    (list (morji-nunjavni-jonai
                            (list (morji-nunjavni-valsi "-|" porjahe: #t)
                                  (morji-nunjavni-valsi "⇥" porjahe: #t))
                            porsumti:
                            #t
                            porjahe:
                            #t)
                          (morji-nunjavni-porjahe canlu-1)
                          (morji-nunjavni-jonai
                            (list (morji-nunjavni-porjahe samselpla-xadni-70)
                                  (morji-nunjavni-porjahe samselpla-cmene-71))
                            porsumti:
                            #t
                            porjahe:
                            #t))
                    porsumti:
                    #t
                    porjahe:
                    #t))))))
    (define samselpla-xadni-73
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
            porsumti:
            #t
            porjahe:
            #t))))
    (define samselpla-cmene-74
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
    (define girzu-javni-75
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
                          javni-11
                          (morji-nunjavni-lerfu #\))
                          canlu-1)
                    porjahe:
                    #t))))))
    (define namcu-76
      (nunjavni-morji
        (morji-nunjavni-je
          (list (morji-nunjavni-char-set-+ char-set:digit) canlu-1))))
    (define canlu-79
      (nunjavni-morji
        (morji-nunjavni-*
          (morji-nunjavni-jonai
            (list (morji-nunjavni-porjahe canlubu-77)
                  (morji-nunjavni-porjahe totoi-78))
            porsumti:
            #t
            porjahe:
            #t)
          porsumti:
          #t
          nastura:
          #t)))
    (define canlubu-81
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-char-set char-set:whitespace) CRLF-80))))
    (define totoi-82
      (nunjavni-morji
        (morji-nunjavni-je
          (list (morji-nunjavni-lerfu #\; porjahe: #t)
                (morji-nunjavni-*
                  (morji-nunjavni-je
                    (list (morji-nunjavni-! CRLF-80 porjahe: #t)
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
                  (list (morji-nunjavni-porjahe CRLF-80)
                        (morji-nunjavni-& FAhO-4 porjahe: #t))
                  porsumti:
                  #t
                  porjahe:
                  #t))
          porsumti:
          #t)))
    (define CR-84 (morji-nunjavni-lerfu #\return))
    (define LF-86 (morji-nunjavni-lerfu #\newline))
    (define CRLF-87
      (nunjavni-morji
        (morji-nunjavni-jonai
          (list (morji-nunjavni-je (list CR-83 LF-85)) CR-83 LF-85))))
    (define FAhO-88 (morji-nunjavni-fanmo))
    (tolmohi-nunjavni)
    cfari-5))
