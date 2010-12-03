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
;;; code for PEG parser.
;;;

;; We gensym all non-terminal names in order to avoid name
;; collisions.  This is particularly important if
;; |define-toplevel| is #t.
;;
(define samselpla-hash-table  (make-hash-table string=?))
(define samselpla-hash-table* (make-hash-table string=?))

(define (samselpla-cmene->symbol cmene)
  (hash-table-ref samselpla-hash-table
                  cmene
                  (lambda ()
                    (let ((symbol (gensym (string->symbol cmene))))
                      (hash-table-set! samselpla-hash-table
                                       cmene
                                       symbol)
                      symbol))))

(define (samselpla-cmene->symbol* cmene)
  (hash-table-ref samselpla-hash-table*
                  cmene
                  (lambda ()
                    (let ((symbol (gensym (string->symbol cmene))))
                      (hash-table-set! samselpla-hash-table*
                                       cmene
                                       symbol)
                      symbol))))


;; ignore the FAhO tag in the file, and
;; just return the header code and grammar.
;;
(define (samselpla-cfari #!key gerna)
  (call-with-values
    (lambda () (unzip2 gerna))
    (lambda (smuni-nunselci smuni)
      (let ((selci-cmene (secuxna-start-production))
            (rodatamgau  (secuxna-define-name))
            (toplevel    (secuxna-define-toplevel)))

        (define (suhorecmene-e-toplevel tamgau nunselci-cmene)
          (map (lambda (tamgau cmene)
                  `(define ,tamgau ,cmene))
               tamgau nunselci-cmene))

        (define (suhorecmene-enai-toplevel nunselci-cmene)
          `((values ,@nunselci-cmene)))

        (define (pacmene-e-toplevel tamgau nunselci-cmene)
          `((define ,tamgau ,nunselci-cmene)))

        (define (pacmene-enai-toplevel nunselci-cmene)
          `(,nunselci-cmene))

        ; reset the start production.
        (secuxna-start-production #f)

        (if (not (null? smuni))
            `(,@(if toplevel '() '(let ()))
              ,@smuni-nunselci
              ,@smuni
              (tolmohi-nunjavni)
              ,@(if (list? rodatamgau)

                    (let ((rodatamgau
                            (map samselpla-cmene->symbol  rodatamgau))
                          (nunselci-cmene
                            (map samselpla-cmene->symbol* selci-cmene)))
                      (if toplevel
                          (suhorecmene-e-toplevel rodatamgau nunselci-cmene)
                          (suhorecmene-enai-toplevel nunselci-cmene)))

                    (let ((rodatamgau
                            (samselpla-cmene->symbol  rodatamgau))
                          (nunselci-cmene
                            (samselpla-cmene->symbol* selci-cmene)))
                      (if toplevel
                          (pacmene-e-toplevel rodatamgau nunselci-cmene)
                          (pacmene-enai-toplevel nunselci-cmene)))))
            '())))))

(define (samselpla-cfari-samselpla #!key rodalerfu)
  (let* ((valsi     (apply string rodalerfu))
         (samselpla (call-with-input-string valsi read)))
    ; evaluate parameters before compiling the code.
    (safe-eval samselpla environment: genturfahi-env)))

;; emit the non-terminal with it's rule.
;;
;; we assume we're in a letrec.
;;
(define (samselpla-smuni #!key naselci javni)
  ; if this is the first non-terminal we've seen, it is the
  ; initial rule of the grammar.
  (if (not (secuxna-start-production))
      (secuxna-start-production naselci))

  ; we create three symbols, two of which, because of the grammar
  ; rules, can't be created by the user.  (so there is no symbol
  ; collision)
  ;
  ; the non-decorated symbol is used when this rule is referenced
  ; in other rules.  The decorated symbol is the actual grammar
  ; rule.
  ;
  (let ((symbol-nunselci (samselpla-cmene->symbol  naselci))
        (symbol          (samselpla-cmene->symbol* naselci)))

          ; outer letrec (which stores references)
          ;
    (list `(define (,symbol-nunselci porsi mapti namapti)
             (,symbol porsi mapti namapti))

          ; inner let (which stores grammar rules)
          ;
          `(define ,symbol
            ,(if (secuxna-memoize)
                 `(nunjavni-morji ,javni)
                 javni)))))


(define (samselpla-naselci #!key cfari fanmo)
  (string-append (make-string 1 cfari) fanmo))

(define (samselpla-je #!key samselpla rodajavni)
  (let* ((javni (if (null? (cdr rodajavni))
                           (car rodajavni)
                           `(morji-nunjavni-je ,@rodajavni))))
    (if (equal? "" samselpla)
        javni
        `(morji-nunjavni-samselpla ,(string->symbol samselpla) ,javni))))

(define (samselpla-pajavni-cmene #!key cmene javni)
  (if (equal? "" cmene)
      javni
      (if (symbol? javni)
          `(morji-nunjavni-cmene ,javni cmene: ,cmene)
          `(,@javni cmene: ,cmene))))

(define (samselpla-jonai-je #!key je)
  je)

(define (samselpla-jonai #!key cfari fanmo)
  `(morji-nunjavni-jonai ,cfari ,@fanmo))

(define (samselpla-? #!key cmene javni)
  (let ((empty-string (secuxna-empty-string)))
    `(morji-nunjavni-? ,javni
                       ,@(if (equal? "" cmene)
                             '()
                             `(cmene: ,cmene))
                       ,@(if (equal? "" empty-string)
                             '()
                             `(empty-string: ,empty-string)))))

(define (samselpla-* #!key cmene javni)
  `(morji-nunjavni-* ,javni ,@(if (equal? "" cmene) '() `(cmene: ,cmene))))

(define (samselpla-+ #!key cmene javni)
  `(morji-nunjavni-+ ,javni ,@(if (equal? "" cmene) '() `(cmene: ,cmene))))

(define (samselpla-& #!key javni)
  (let ((empty-string (secuxna-empty-string)))
    `(morji-nunjavni-& ,javni
                       ,@(if (equal? "" empty-string)
                             '()
                             `(empty-string: ,empty-string)))))

(define (samselpla-fanmo)
  (let ((sentinel (secuxna-sentinel)))
    `(morji-nunjavni-fanmo ,@(if (eq? #\nul sentinel)
                                 '()
                                 `(sentinel: ,sentinel)))))

(define (samselpla-! #!key javni)
  (let ((empty-string (secuxna-empty-string)))
    `(morji-nunjavni-! ,javni
                       ,@(if (equal? "" empty-string)
                             '()
                             `(empty-string: ,empty-string)))))

(define (samselpla-cmene-sumti #!key cfari fanmo)
  `,(string-append (make-string 1 cfari) fanmo))

;; A naselci that appears on the right side of a definition.
;;
(define (samselpla-selci-naselci #!key naselci)
  (samselpla-cmene->symbol naselci))

(define (samselpla-lerfu-selci #!key lerfu)
  `(morji-nunjavni-lerfu ,lerfu))

(define (samselpla-lerfu-space)
  #\space)

(define (samselpla-lerfu-linefeed)
  #\linefeed)

(define (samselpla-lerfu-newline)
  #\newline)

(define (samselpla-lerfu-return)
  #\return)

(define (samselpla-lerfu-tab)
  #\tab)

(define (samselpla-valsi-selci #!key valsi-lerfu)
  `(morji-nunjavni-valsi ,(apply string-append valsi-lerfu)))

(define (samselpla-valsi-selci-lerfu #!key lerfu)
  lerfu)

(define (samselpla-valsi-newline)
  "\\n")

(define (samselpla-valsi-linefeed)
  "\\r")

(define (samselpla-valsi-tab)
  "\\t")

(define (samselpla-valsi-backslash)
  "\\")

(define (samselpla-valsi-single-quote)
  "\'")

(define (samselpla-valsi-double-quote)
  "\"")

(define (samselpla-valsi-lerfu #!key lerfu)
  (make-string 1 lerfu))

(define (samselpla-alnum)
  'char-set:letter+digit)

(define (samselpla-alpha)
  'char-set:letter)

(define (samselpla-ascii)
  'char-set:ascii)

(define (samselpla-blank)
  'char-set:blank)

(define (samselpla-cntrl)
  'char-set:iso-control)

(define (samselpla-digit)
  'char-set:digit)

(define (samselpla-graph)
  'char-set:graphic)

(define (samselpla-lower)
  'char-set:lower-case)

(define (samselpla-odigit)
  (char-set #\0 #\1 #\2 #\3 #\4 #\5 #\6 #\7))

(define (samselpla-print)
  'char-set:printing)

(define (samselpla-punct)
  'char-set:punctuation)

(define (samselpla-space)
  'char-set:whitespace)

(define (samselpla-upper)
  'char-set:upper-case)

(define (samselpla-xdigit)
  'char-set:hex-digit)

(define (samselpla-^alnum)
  `(char-set-xor (char-set-complement char-set:letter+digit)
                 (char-set ,(secuxna-sentinel))))

(define (samselpla-^alpha)
  `(char-set-xor (char-set-complement char-set:letter)
                 (char-set ,(secuxna-sentinel))))

(define (samselpla-^ascii)
  `(char-set-xor (char-set-complement char-set:ascii)
                 (char-set ,(secuxna-sentinel))))

(define (samselpla-^blank)
  `(char-set-xor (char-set-complement char-set:blank)
                 (char-set ,(secuxna-sentinel))))

(define (samselpla-^cntrl)
  `(char-set-xor (char-set-complement char-set:iso-control)
                 (char-set ,(secuxna-sentinel))))

(define (samselpla-^digit)
  `(char-set-xor (char-set-complement char-set:digit)
                 (char-set ,(secuxna-sentinel))))

(define (samselpla-^graph)
  `(char-set-xor (char-set-complement char-set:graphic)
                 (char-set ,(secuxna-sentinel))))

(define (samselpla-^lower)
  `(char-set-xor (char-set-complement char-set:lower-case)
                 (char-set ,(secuxna-sentinel))))

(define (samselpla-^odigit)
  `(char-set-xor (char-set-complement
                 (char-set #\0 #\1 #\2 #\3 #\4 #\5 #\6 #\7))
                 (char-set ,(secuxna-sentinel))))

(define (samselpla-^print)
  `(char-set-xor (char-set-complement char-set:printing)
                 (char-set ,(secuxna-sentinel))))

(define (samselpla-^punct)
  `(char-set-xor (char-set-complement char-set:punctuation)
                 (char-set ,(secuxna-sentinel))))

(define (samselpla-^space)
  `(char-set-xor (char-set-complement char-set:whitespace)
                 (char-set ,(secuxna-sentinel))))

(define (samselpla-^upper)
  `(char-set-xor (char-set-complement char-set:upper-case)
                 (char-set ,(secuxna-sentinel))))

(define (samselpla-^xdigit)
  `(char-set-xor (char-set-complement char-set:hex-digit)
                 (char-set ,(secuxna-sentinel))))


(define (samselpla-klesi-lerfu #!key klesi-lerfu)
  `(char-set ,klesi-lerfu))


(define (samselpla-klesi-selci-* #!key klesi-lerfu)
  (if (null? (cdr klesi-lerfu))
      `(morji-nunjavni-char-set-* ,(car klesi-lerfu))
      `(morji-nunjavni-char-set-* (char-set-union ,@klesi-lerfu))))

(define (samselpla-klesi-selci-+ #!key klesi-lerfu)
  (if (null? (cdr klesi-lerfu))
      `(morji-nunjavni-char-set-+ ,(car klesi-lerfu))
      `(morji-nunjavni-char-set-+ (char-set-union ,@klesi-lerfu))))

(define (samselpla-klesi-selci #!key klesi-lerfu)
  (if (null? (cdr klesi-lerfu))
      `(morji-nunjavni-char-set ,(car klesi-lerfu))
      `(morji-nunjavni-char-set (char-set-union ,@klesi-lerfu))))


(define (samselpla-denpabu)
  `(morji-nunjavni-.))

(define (samselpla-samselpla #!key rodalerfu)
  (apply string rodalerfu))

(define (samselpla-samselpla-lerfu #!key lerfu)
  lerfu)

(define (samselpla-girzu-javni #!key javni)
  javni)

(define (samselpla-empty-string)
  (let ((empty-string (secuxna-empty-string)))
    `(morji-nunjavni-e ,@(if (equal? "" empty-string)
                             '()
                             `(empty-string: ,empty-string)))))

;; ignore comments and space
;;
(define (samselpla-canlu)
  '())
