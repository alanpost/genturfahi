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
  (let ((cfari+ '())
        (cfari-samselpla+ '())
        (gerna+ '())
        (smuni+ '())
        (naselci+ '())
        (javni+ '())
        (jonai+ '())
        (je+ '())
        (pajavni+ '())
        (optional+ '())
        (repetition0+ '())
        (repetition1+ '())
        (and-predicate+ '())
        (end-of-input+ '())
        (not-predicate+ '())
        (cmene-sumti+ '())
        (selci-javni+ '())
        (selci-naselci+ '())
        (lerfu-selci+ '())
        (lerfu-cmene+ '())
        (valsi-selci+ '())
        (valsi-lerfu+ '())
        (klesi-selci+ '())
        (klesi-lerfu+ '())
        (klesi-cmene+ '())
        (denpabu+ '())
        (samselpla+ '())
        (girzu-javni+ '())
        (canlu+ '())
        (canlubu+ '())
        (totoi+ '())
        (CR+ '())
        (LF+ '())
        (CRLF+ '())
        (FAhO+ '()))
    (let ((cfari (lambda (porsi mapti namapti) (cfari+ porsi mapti namapti)))
          (cfari-samselpla
            (lambda (porsi mapti namapti)
              (cfari-samselpla+ porsi mapti namapti)))
          (gerna (lambda (porsi mapti namapti) (gerna+ porsi mapti namapti)))
          (smuni (lambda (porsi mapti namapti) (smuni+ porsi mapti namapti)))
          (naselci
            (lambda (porsi mapti namapti) (naselci+ porsi mapti namapti)))
          (javni (lambda (porsi mapti namapti) (javni+ porsi mapti namapti)))
          (jonai (lambda (porsi mapti namapti) (jonai+ porsi mapti namapti)))
          (je (lambda (porsi mapti namapti) (je+ porsi mapti namapti)))
          (pajavni
            (lambda (porsi mapti namapti) (pajavni+ porsi mapti namapti)))
          (optional
            (lambda (porsi mapti namapti) (optional+ porsi mapti namapti)))
          (repetition0
            (lambda (porsi mapti namapti) (repetition0+ porsi mapti namapti)))
          (repetition1
            (lambda (porsi mapti namapti) (repetition1+ porsi mapti namapti)))
          (and-predicate
            (lambda (porsi mapti namapti)
              (and-predicate+ porsi mapti namapti)))
          (end-of-input
            (lambda (porsi mapti namapti) (end-of-input+ porsi mapti namapti)))
          (not-predicate
            (lambda (porsi mapti namapti)
              (not-predicate+ porsi mapti namapti)))
          (cmene-sumti
            (lambda (porsi mapti namapti) (cmene-sumti+ porsi mapti namapti)))
          (selci-javni
            (lambda (porsi mapti namapti) (selci-javni+ porsi mapti namapti)))
          (selci-naselci
            (lambda (porsi mapti namapti)
              (selci-naselci+ porsi mapti namapti)))
          (lerfu-selci
            (lambda (porsi mapti namapti) (lerfu-selci+ porsi mapti namapti)))
          (lerfu-cmene
            (lambda (porsi mapti namapti) (lerfu-cmene+ porsi mapti namapti)))
          (valsi-selci
            (lambda (porsi mapti namapti) (valsi-selci+ porsi mapti namapti)))
          (valsi-lerfu
            (lambda (porsi mapti namapti) (valsi-lerfu+ porsi mapti namapti)))
          (klesi-selci
            (lambda (porsi mapti namapti) (klesi-selci+ porsi mapti namapti)))
          (klesi-lerfu
            (lambda (porsi mapti namapti) (klesi-lerfu+ porsi mapti namapti)))
          (klesi-cmene
            (lambda (porsi mapti namapti) (klesi-cmene+ porsi mapti namapti)))
          (denpabu
            (lambda (porsi mapti namapti) (denpabu+ porsi mapti namapti)))
          (samselpla
            (lambda (porsi mapti namapti) (samselpla+ porsi mapti namapti)))
          (girzu-javni
            (lambda (porsi mapti namapti) (girzu-javni+ porsi mapti namapti)))
          (canlu (lambda (porsi mapti namapti) (canlu+ porsi mapti namapti)))
          (canlubu
            (lambda (porsi mapti namapti) (canlubu+ porsi mapti namapti)))
          (totoi (lambda (porsi mapti namapti) (totoi+ porsi mapti namapti)))
          (CR (lambda (porsi mapti namapti) (CR+ porsi mapti namapti)))
          (LF (lambda (porsi mapti namapti) (LF+ porsi mapti namapti)))
          (CRLF (lambda (porsi mapti namapti) (CRLF+ porsi mapti namapti)))
          (FAhO (lambda (porsi mapti namapti) (FAhO+ porsi mapti namapti))))
      (let ((cfari*
              (nunjavni-morji
                (morji-nunjavni-samselpla
                  samselpla-cfari
                  (morji-nunjavni-je
                    canlu
                    (morji-nunjavni-* cfari-samselpla)
                    canlu
                    (morji-nunjavni-cmene gerna cmene: "gerna")
                    FAhO))))
            (cfari-samselpla*
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
            (gerna*
              (nunjavni-morji
                (morji-nunjavni-samselpla
                  samselpla-gerna
                  (morji-nunjavni-* smuni cmene: "smuni"))))
            (smuni*
              (nunjavni-morji
                (morji-nunjavni-samselpla
                  samselpla-smuni
                  (morji-nunjavni-je
                    (morji-nunjavni-cmene naselci cmene: "naselci")
                    (morji-nunjavni-valsi "<-")
                    canlu
                    (morji-nunjavni-cmene javni cmene: "javni")))))
            (naselci*
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
            (javni* (nunjavni-morji (morji-nunjavni-jonai jonai je)))
            (jonai*
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
            (je* (nunjavni-morji
                   (morji-nunjavni-samselpla
                     samselpla-je
                     (morji-nunjavni-je
                       (morji-nunjavni-+ pajavni cmene: "rodajavni")
                       (morji-nunjavni-? cmene-sumti cmene: "cmene")
                       (morji-nunjavni-? samselpla cmene: "samselpla")))))
            (pajavni*
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
            (optional*
              (nunjavni-morji
                (morji-nunjavni-samselpla
                  samselpla-?
                  (morji-nunjavni-je
                    (morji-nunjavni-? cmene-sumti cmene: "cmene")
                    (morji-nunjavni-cmene selci-javni cmene: "javni")
                    (morji-nunjavni-lerfu #\?)
                    canlu))))
            (repetition0*
              (nunjavni-morji
                (morji-nunjavni-samselpla
                  samselpla-*
                  (morji-nunjavni-je
                    (morji-nunjavni-? cmene-sumti cmene: "cmene")
                    (morji-nunjavni-cmene selci-javni cmene: "javni")
                    (morji-nunjavni-lerfu #\*)
                    canlu))))
            (repetition1*
              (nunjavni-morji
                (morji-nunjavni-samselpla
                  samselpla-+
                  (morji-nunjavni-je
                    (morji-nunjavni-? cmene-sumti cmene: "cmene")
                    (morji-nunjavni-cmene selci-javni cmene: "javni")
                    (morji-nunjavni-lerfu #\+)
                    canlu))))
            (and-predicate*
              (nunjavni-morji
                (morji-nunjavni-samselpla
                  samselpla-&
                  (morji-nunjavni-je
                    (morji-nunjavni-lerfu #\&)
                    canlu
                    (morji-nunjavni-cmene selci-javni cmene: "javni")))))
            (end-of-input*
              (nunjavni-morji
                (morji-nunjavni-samselpla
                  samselpla-fanmo
                  (morji-nunjavni-je
                    (morji-nunjavni-lerfu #\!)
                    canlu
                    (morji-nunjavni-lerfu #\.)
                    canlu))))
            (not-predicate*
              (nunjavni-morji
                (morji-nunjavni-samselpla
                  samselpla-!
                  (morji-nunjavni-je
                    (morji-nunjavni-lerfu #\!)
                    canlu
                    (morji-nunjavni-cmene selci-javni cmene: "javni")))))
            (cmene-sumti*
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
            (selci-javni*
              (nunjavni-morji
                (morji-nunjavni-jonai
                  selci-naselci
                  lerfu-selci
                  valsi-selci
                  klesi-selci
                  denpabu
                  girzu-javni)))
            (selci-naselci*
              (nunjavni-morji
                (morji-nunjavni-samselpla
                  samselpla-selci-naselci
                  (morji-nunjavni-je
                    (morji-nunjavni-cmene naselci cmene: "naselci")
                    (morji-nunjavni-! (morji-nunjavni-valsi "<-"))))))
            (lerfu-selci*
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
            (lerfu-cmene*
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
            (valsi-selci*
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
            (valsi-lerfu*
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
            (klesi-selci*
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
            (klesi-lerfu*
              (nunjavni-morji
                (morji-nunjavni-jonai
                  klesi-cmene
                  (morji-nunjavni-samselpla
                    samselpla-klesi-lerfu
                    (morji-nunjavni-je
                      (morji-nunjavni-! (morji-nunjavni-lerfu #\]))
                      (morji-nunjavni-. cmene: "klesi-lerfu"))))))
            (klesi-cmene*
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
            (denpabu*
              (nunjavni-morji
                (morji-nunjavni-samselpla
                  samselpla-denpabu
                  (morji-nunjavni-je (morji-nunjavni-lerfu #\.) canlu))))
            (samselpla*
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
            (girzu-javni*
              (nunjavni-morji
                (morji-nunjavni-samselpla
                  samselpla-girzu-javni
                  (morji-nunjavni-je
                    (morji-nunjavni-lerfu #\()
                    canlu
                    (morji-nunjavni-cmene javni cmene: "javni")
                    (morji-nunjavni-lerfu #\))
                    canlu))))
            (canlu*
              (nunjavni-morji
                (morji-nunjavni-samselpla
                  samselpla-canlu
                  (morji-nunjavni-* (morji-nunjavni-jonai canlubu totoi)))))
            (canlubu*
              (nunjavni-morji
                (morji-nunjavni-jonai
                  (morji-nunjavni-lerfu #\space)
                  (morji-nunjavni-lerfu #\tab)
                  CR
                  LF)))
            (totoi*
              (nunjavni-morji
                (morji-nunjavni-je
                  (morji-nunjavni-lerfu #\;)
                  (morji-nunjavni-*
                    (morji-nunjavni-je
                      (morji-nunjavni-! CRLF)
                      (morji-nunjavni-.)))
                  (morji-nunjavni-jonai CRLF (morji-nunjavni-& FAhO)))))
            (CR* (nunjavni-morji (morji-nunjavni-lerfu #\return)))
            (LF* (nunjavni-morji (morji-nunjavni-lerfu #\newline)))
            (CRLF* (nunjavni-morji
                     (morji-nunjavni-jonai (morji-nunjavni-je CR LF) CR LF)))
            (FAhO* (nunjavni-morji (morji-nunjavni-fanmo))))
        (tolmohi-nunjavni)
        (set! cfari+ cfari*)
        (set! cfari-samselpla+ cfari-samselpla*)
        (set! gerna+ gerna*)
        (set! smuni+ smuni*)
        (set! naselci+ naselci*)
        (set! javni+ javni*)
        (set! jonai+ jonai*)
        (set! je+ je*)
        (set! pajavni+ pajavni*)
        (set! optional+ optional*)
        (set! repetition0+ repetition0*)
        (set! repetition1+ repetition1*)
        (set! and-predicate+ and-predicate*)
        (set! end-of-input+ end-of-input*)
        (set! not-predicate+ not-predicate*)
        (set! cmene-sumti+ cmene-sumti*)
        (set! selci-javni+ selci-javni*)
        (set! selci-naselci+ selci-naselci*)
        (set! lerfu-selci+ lerfu-selci*)
        (set! lerfu-cmene+ lerfu-cmene*)
        (set! valsi-selci+ valsi-selci*)
        (set! valsi-lerfu+ valsi-lerfu*)
        (set! klesi-selci+ klesi-selci*)
        (set! klesi-lerfu+ klesi-lerfu*)
        (set! klesi-cmene+ klesi-cmene*)
        (set! denpabu+ denpabu*)
        (set! samselpla+ samselpla*)
        (set! girzu-javni+ girzu-javni*)
        (set! canlu+ canlu*)
        (set! canlubu+ canlubu*)
        (set! totoi+ totoi*)
        (set! CR+ CR*)
        (set! LF+ LF*)
        (set! CRLF+ CRLF*)
        (set! FAhO+ FAhO*)
        cfari*))))
