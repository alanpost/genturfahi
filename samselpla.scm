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
                    (let ((symbol
                            (gensym
                              (string->symbol
                                (string-append cmene "-")))))
                      (hash-table-set! samselpla-hash-table
                                       cmene
                                       symbol)
                      symbol))))

(define (samselpla-cmene->symbol* cmene)
  (hash-table-ref samselpla-hash-table*
                  cmene
                  (lambda ()
                    (let ((symbol
                             (gensym
                               (string->symbol
                                 (string-append cmene "-")))))
                      (hash-table-set! samselpla-hash-table*
                                       cmene
                                       symbol)
                      symbol))))

; a hash table containing rules that we won't be memoizing
;
(define samselpla-namorji (make-hash-table string=?))

(define (samselpla-namorji? naselci-cmene)
  (hash-table-exists? samselpla-namorji naselci-cmene))


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
                  `(define
                     ,tamgau
                     (nunjavni-secuxna (lambda () ,selci-cmene) ,cmene)))
               tamgau nunselci-cmene))

        (define (suhorecmene-enai-toplevel nunselci-cmene)
          `((values ,@(map (lambda (tamgau cmene)
                             `(nunjavni-secuxna
                                (lambda () ,selci-cmene)
                                ,cmene))))))

        (define (pacmene-e-toplevel tamgau nunselci-cmene)
          `((define
              ,tamgau
              (nunjavni-secuxna (lambda () selci-cmene) ,nunselci-cmene))))

        (define (pacmene-enai-toplevel nunselci-cmene)
          `((nunjavni-secuxna (lambda () ,selci-cmene) ,nunselci-cmene)))

        ; reset the start production.
        (secuxna-start-production #f)

        (let ((jalge
          (if (not (null? smuni))
              `(,@(if toplevel '() '(let ()))
                ,@smuni-nunselci
                ,@smuni
                (tolmohi-nunjavni)
                ,@(if (list? rodatamgau)

                      (let ((rodatamgau
                              (map string->symbol rodatamgau))
                            (nunselci-cmene
                              (map samselpla-cmene->symbol* selci-cmene)))
                        (if toplevel
                            (suhorecmene-e-toplevel rodatamgau nunselci-cmene)
                            (suhorecmene-enai-toplevel nunselci-cmene)))

                      (let ((rodatamgau
                              (string->symbol  rodatamgau))
                            (nunselci-cmene
                              (samselpla-cmene->symbol* selci-cmene)))
                        (if toplevel
                            (pacmene-e-toplevel rodatamgau nunselci-cmene)
                            (pacmene-enai-toplevel nunselci-cmene)))))
            '())))

          (hash-table-clear! samselpla-hash-table)
          (hash-table-clear! samselpla-hash-table*)

          jalge)))))

(define (samselpla-cfari-samselpla #!key rodalerfu)
  (let* ((valsi     (apply string rodalerfu))
         (samselpla (call-with-input-string valsi read)))
    ; evaluate parameters before compiling the code.
    (safe-eval samselpla environment: genturfahi-env)

    ; update the list of non-terminals that we don't memoize
    ;
    (let ((no-memoize (secuxna-no-memoize)))
      (if (list? no-memoize)
          (begin
            (for-each (lambda (naselci)
                        (hash-table-set! samselpla-namorji naselci #t))
                      no-memoize)
            ; since we've registered all of the rules not to
            ; memoize, make sure we do memoize the rest of them.
            ;
            (secuxna-no-memoize #f))))))

;; emit the non-terminal with it's rule.
;;
;; we assume we're in a letrec.
;;
(define (samselpla-smuni #!key naselci javni)
  ; if this is the first non-terminal we've seen, it is the
  ; initial rule of the grammar.
  (if (not (secuxna-start-production))
      (secuxna-start-production naselci))

  ; we create two symbols for each terminal rule.  One is the
  ; definition and the other is the reference.
  ;
  (let ((symbol-nunselci (samselpla-cmene->symbol  naselci))
        (symbol          (samselpla-cmene->symbol* naselci)))

    (if (pair? javni)
        ; there are a set of productions that we should never
        ; memoize.  memoization in this case is more expensive
        ; than running the rule.
        ;
        (case (car javni)
          ((morji-nunjavni-lerfu
            morji-nunjavni-.
            morji-nunjavni-e
            morji-nunjavni-nil
            morji-nunjavni-fanmo
            morji-nunjavni-valsi)
           (hash-table-set! samselpla-namorji naselci #t)))

        ; don't memoize a non-terminal production which consists
        ; only of another non-terminal production.
        ;
        (hash-table-set! samselpla-namorji naselci #t))

          ; outer letrec (which stores references)
          ;
    (list `(define ,symbol-nunselci
             (nunjavni-secuxna
               (lambda () ,naselci)
               (lambda (porsi mapti namapti)
                 (,symbol porsi mapti namapti))))

          ; inner let (which stores grammar rules)
          ;
          `(define ,symbol
            ,(if (or (samselpla-namorji? naselci) (secuxna-no-memoize))
                 javni
                 `(nunjavni-morji ,javni))))))


(define (samselpla-naselci #!key cfari fanmo)
  (string-append (make-string 1 cfari) fanmo))

;; sequence: wrap the current rule in a sequence operator, unless
;;           it is only a single rule, in which case we pass it
;;           untouched.
;;
;;           this is where we attach code to a production as well,
;;
(define (samselpla-je #!key cmene samselpla javni)
  ; if there is more than one javni, wrap in a sequence operator.
  ;
  (define (nunje javni)
    (if (null? (cdr javni))
        (car javni)
        `(morji-nunjavni-je ,@javni)))

  ; if code was specified, wrap in a code operator.
  ;
  (define (nunsamselpla samselpla javni)
    (if (and (string? samselpla) (string=? "" samselpla))
        javni
        `(,@samselpla ,javni)))

  ; if this production is named, attach the name to the rule,
  ; sequence operator, or code.
  ;
  (define (nuncmene cmene javni)
    (if (string=? "" cmene)
        javni
        `(,@javni cmene: ,cmene)))

  (nuncmene cmene (nunsamselpla samselpla (nunje javni))))

;; backquote: the following operator should not modify the parse tree.
;;
(define (samselpla-nastura-javni #!key javni)
  (if (symbol? javni)
      ; if we have a non-terminal, we must use |morji-nunjavni-quote|.
      ;
      `(morji-nunjavni-nastura ,javni)
      `(,@javni nastura: #t)))

;; tag: attach a name to the rule.  If the rule is a non-terminal,
;; we must wrap the rule in a tagging call, but other rules directly
;; accept a name argument.
;;
(define (samselpla-pajavni-cmene #!key cmene javni)
  (if (string=? "" cmene)
      javni
      (if (symbol? javni)
          ; if we have a non-terminal, we must use |morji-nunjavni-cmene|.
          ;
          `(morji-nunjavni-cmene ,javni cmene: ,cmene)
          `(,@javni cmene: ,cmene))))

;; ordered choice: the passed in rules are an ordered choice.
;;
(define (samselpla-jonai #!key cfari fanmo)
  `(morji-nunjavni-jonai ,cfari ,@fanmo))

(define (samselpla-? #!key cmene javni)
  (let ((empty-string (secuxna-empty-string)))
    `(morji-nunjavni-? ,javni
                       ,@(if (string=? "" cmene)
                             '()
                             `(cmene: ,cmene))
                       ,@(if (string=? "" empty-string)
                             '()
                             `(empty-string: ,empty-string)))))

;; zero-or-more
;;
(define (samselpla-* #!key cmene javni)
  `(morji-nunjavni-* ,javni ,@(if (string=? "" cmene) '() `(cmene: ,cmene))))

;; one-or-more
;;
(define (samselpla-+ #!key cmene javni)
  `(morji-nunjavni-+ ,javni ,@(if (string=? "" cmene) '() `(cmene: ,cmene))))

;; and-predicate
;;
(define (samselpla-& #!key javni)
  `(morji-nunjavni-& ,javni))

;; not-predicate
;;
(define (samselpla-! #!key javni)
  `(morji-nunjavni-! ,javni))

(define (samselpla-fanmo)
  (let ((sentinel (secuxna-sentinel)))
    `(morji-nunjavni-fanmo ,@(if (eq? #\nul sentinel)
                                 '()
                                 `(sentinel: ,sentinel)))))

(define (samselpla-cmene-sumti #!key cfari fanmo)
  `,(string-append (make-string 1 cfari) fanmo))

;; A naselci that appears on the right side of a definition.
;;
(define (samselpla-selci-naselci #!key naselci)
  (samselpla-cmene->symbol naselci))

(define (samselpla-stura-lerfu-selci #!key lerfu)
  `(morji-nunjavni-lerfu ,lerfu nastura: #f))

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

(define (samselpla-stura-valsi-selci #!key valsi-lerfu)
  `(morji-nunjavni-valsi ,(apply string-append valsi-lerfu) nastura: #f))

(define (samselpla-valsi-selci #!key valsi-lerfu)
  `(morji-nunjavni-valsi ,(apply string-append valsi-lerfu)))

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

(define (samselpla-jbolehu)
  `(char-set-union
     (char-set-xor char-set:letter+digit (char-set #\q #\w))
     (char-set #\' #\. #\,)))

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

(define (samselpla-samselpla-xadni #!key rodalerfu)
  (list (read (open-input-string (apply string rodalerfu)))))

(define (samselpla-samselpla-cmene #!key cfari fanmo)
  (string->symbol (string-append (make-string 1 cfari) fanmo)))

(define (samselpla-samselpla-balvi samselpla)
  `(morji-nunjavni-samselpla ,samselpla))

(define (samselpla-samselpla-cabna samselpla)
  `(morji-nunjavni-samselpla-cabna ,samselpla))

(define (samselpla-stura-empty-string)
  (let ((empty-string (secuxna-empty-string)))
    `(morji-nunjavni-e nastura: #f
                       ,@(if (string=? "" empty-string)
                             '()
                             `(empty-string: ,empty-string)))))

(define (samselpla-empty-string)
  (let ((empty-string (secuxna-empty-string)))
    `(morji-nunjavni-e ,@(if (string=? "" empty-string)
                             '()
                             `(empty-string: ,empty-string)))))

(define (samselpla-empty-list)
  (let ((empty-list (secuxna-empty-list)))
    `(morji-nunjavni-nil ,@(if (eq? '() empty-list)
                               '()
                               `(empty-list: ,empty-list)))))
