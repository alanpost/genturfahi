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

        ; toplevel definition with mulitple start productions
        ;
        (define (suhorecmene-e-toplevel tamgau selci-cmene nunselci-cmene)
          (map (lambda (tamgau cmene javni)
                  `(define
                     ,tamgau
                     ,javni))
               tamgau selci-cmene nunselci-cmene))

        ; (let ...) definition with multiple start productions
        ;
        (define (suhorecmene-enai-toplevel selci-cmene nunselci-cmene)
          `((values ,@(map (lambda (javni) javni) nunselci-cmene))))

        ; toplevel definition with a single start production.
        ;
        (define (pacmene-e-toplevel tamgau selci-cmene nunselci-cmene)
          `((define ,tamgau ,nunselci-cmene)))

        ; (let ...) definition with a single start production.
        ;
        (define (pacmene-enai-toplevel selci-cmene nunselci-cmene)
          `(,nunselci-cmene))

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
                              (map samselpla-cmene->symbol selci-cmene)))
                        (if toplevel
                            (suhorecmene-e-toplevel rodatamgau
                                                    selci-cmene
                                                    nunselci-cmene)
                            (suhorecmene-enai-toplevel selci-cmene
                                                       nunselci-cmene)))

                      (let ((rodatamgau
                              (string->symbol  rodatamgau))
                            (nunselci-cmene
                              (samselpla-cmene->symbol selci-cmene)))
                        (if toplevel
                            (pacmene-e-toplevel rodatamgau
                                                selci-cmene
                                                nunselci-cmene)
                            (pacmene-enai-toplevel selci-cmene
                                                   nunselci-cmene)))))
            '())))

          (hash-table-clear! samselpla-hash-table)
          (hash-table-clear! samselpla-hash-table*)
          (hash-table-clear! samselpla-namorji)

          jalge)))))

(define (samselpla-cfari-samselpla #!key rodalerfu)
  (let* ((valsi     (apply string rodalerfu))
         (samselpla (call-with-input-string valsi read)))
    ; evaluate parameters before compiling the code.
    (safe-eval samselpla environment: genturfahi-env)

    ; update the list of non-terminals that we don't memoize
    ;
    (let ((no-memoize (secuxna-no-memoize)))
      (if (string? no-memoize)
          (begin
            (hash-table-set! samselpla-namorji no-memoize #t)
            (secuxna-no-memoize #f)))
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
            morji-nunjavni-.*
            morji-nunjavni-.+
            morji-nunjavni-.kuspe
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
               (lambda () ',(string->symbol naselci))
                 (lambda (porsi zvati mapti namapti)
                   (,symbol porsi zvati mapti namapti))))

          ; inner let (which stores grammar rules)
          ;
          `(define ,symbol
                   ; If a non-terminal production is a sequence, wrap that
                   ; call in a javni-valsi so that the non-terminal only
                   ; returns a single value when it is used in other
                   ; productions.
                   ;
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
(define (samselpla-je #!key samselpla javni)
         ; if any of the rules are in a group (denoted by the
         ; porsumti flag being true), distributed a porja'e flag
         ; to all of the rules so we can splice the group.
         ;
  (let ((porsumti?  (fold (lambda (x y) (or x y)) #f
                      (map
                        (match-lambda
                          ((_ ... 'porsumti: #t) #t)
                          (_ #f))
                        javni)))

         ; a single rule?
         ;
        (pavjavni?  (null? (cdr javni)))

         ; is there code to attach?
         ;
        (samselpla? (not (and (string? samselpla) (string=? "" samselpla)))))

      ; if any of the javni are a group, have all javni return their
      ; result as a list so we can splice the group.
      ;
      (define (nunporjahe javni)
        (define (porjahe javni)
          (if (symbol? javni)
              `(morji-nunjavni-porjahe ,javni)
              `(,@javni porjahe: #t)))

            ; a single javni doesn't need to distributed porjahe
            ; flags, exclude them.
            ;
        (if (and porsumti? (not pavjavni?))
            (map porjahe javni)
            javni))

      ; if there is more than one javni, wrap it in a sequence operator.
      ; After this point there is only a single javni, though we
      ; still might treat it differently.
      ;
      (define (nunpavjavni javni)
        (let ((javni (if pavjavni?
                         (car javni)
                         `(morji-nunjavni-je (list ,@javni)))))

          ; if our rules are returning lists, join them together.
          ;
          (if (and porsumti? (not pavjavni?))
              `(,@javni porsumti: #t)
              javni)))

      ; if we have code to attach, do that.  The routine returning
      ; to the code must have porjahe set to true, but that might
      ; have been done before we got here.
      ;
      (define (nunsamselpla samselpla javni)
        (if samselpla?
            `(,@samselpla
               ,(match javni
                  ; if we have a symbol, wrap it
                  ;
                  ((? symbol? _) `(morji-nunjavni-porjahe ,javni))

                  ; if porjahe is already set, either
                  ; as a wrap or a #!key argument, don't
                  ; set it twice.
                  ;
                  (`(morji-nunjavni-porjahe ,_) javni)
                  ((_ ... 'porjahe: #t) javni)

                  ; if we have a rule, set the porjahe
                  ; flag.
                  ;
                  (_ `(,@javni porjahe: #t))))
            javni))

    (nunsamselpla samselpla (nunpavjavni (nunporjahe javni)))))

;; backquote: the following operator should not modify the parse tree.
;;
(define (samselpla-nastura-javni #!key javni)
  (if (symbol? javni)
      ; if we have a non-terminal, we must use |morji-nunjavni-nastura|.
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
  `(morji-nunjavni-jonai (list ,cfari ,@fanmo)))

(define (samselpla-girzu-javni javni)
  ; with nested parenthesis, we may try to
  ; decorate a rule more than once.  Detect
  ; that case and skip adding the porjahe
  ; flag.
  ;
  (define (porjahe javni)
    (match javni
      ((? symbol? _)                `(morji-nunjavni-porjahe ,javni))
      (`(morji-nunjavni-porjahe ,_) javni)
      ((_ ... 'porjahe: #t)         javni)
      (_                            `(,@javni porjahe: #t))))

  ; check for an existing porsumti #!key before writing one.
  ;
  (define (porsumti? sumti jalge)
    (or jalge (match sumti (`(porsumti: #t . ,_) #t) (_ #f))))

  (match javni
    (((or 'morji-nunjavni-je
          'morji-nunjavni-jonai) . _)

     `(,(car javni)
       (list ,@(map (lambda (javni) (porjahe javni)) (cdadr javni)))
       ,@(cddr javni)
       ; set the porsumti flag, unless it has been set already.
       ,@(if (pair-fold porsumti? #f (cddr javni)) '() '(porsumti: #t))))

    ; anything else means the () was optional, and can be skipped.
    ;
    (_ javni)))


(define (samselpla-.* #!key cmene)
  `(morji-nunjavni-.* ,@(if (string=? "" cmene) '() `(cmene: ,cmene))))

(define (samselpla-.+ #!key cmene)
  `(morji-nunjavni-.+ ,@(if (string=? "" cmene) '() `(cmene: ,cmene))))

(define (samselpla-.kuspe #!key cmene my slakabu ny)
  ; if I have a single range with no comma, match exactly that many
  ; times.
  ;
  (if (not (or slakabu (string=? "" my)))
      (set! ny my))

  `(morji-nunjavni-.kuspe ,@(if (string=? "" cmene)
                                '()
                                `(cmene: ,cmene))
                          ,@(if (string=? "" my)
                                '()
                                `(my: ,(string->number my)))
                          ,@(if (string=? "" ny)
                                '()
                               `(ny: ,(string->number ny)))))

(define (samselpla-? #!key cmene javni)
  (define porsumti? (match javni
                      ((_ ... 'porsumti: #t) #t)
                      (_ #f)))

  (define (nilnarstura javni)
    ; some rules don't modify the parse tree by default.
    ;
    (define (stura? sumti jalge)
      (or jalge (match sumti (`(nastura: #f . ,_) #t) (_ #f))))

    ; other rules do modify the parse tree by default.
    ;
    (define (narstura? sumti jalge)
      (or jalge (match sumti (`(nastura: #t . ,_) #t) (_ #f))))

    ; if an embedded rule has a ni #!key, return that count so
    ; we can sum it with our own.
    (define (nilstura sumti jalge)
      (match sumti (`(ni: ,klani . ,_) klani) (_ jalge)))

    (match javni
       ; look for backquoted non-terminal rules.
       ;
      (`(morji-nunjavni-nastura . ,_)
        0)

       ; these rules don't return a result, unless nastura is #f.
       ;
      (((or 'morji-nunjavni-lerfu
            'morji-nunjavni-e
            'morji-nunjavni-fanmo
            'morji-nunjavni-valsi
            'morji-nunjavni-&
            'morji-nunjavni-!) _ . sumti)
         (if (pair-fold stura? #f sumti) 1 0))

     (`(morji-nunjavni-? . ,sumti)
         (pair-fold nilstura 1 sumti))

       ; check if nastura is true.
       ;
      ((_ . sumti)
         (if (pair-fold narstura? #f sumti) 0 1))))


  ; |#f| if we don't need to pass a count.  Otherwise, the count
  ; of elements to return when this rule doesn't match.
  ;
  ; XXX: we miss one case here, which is where we have a
  ;      non-terminal rule that isn't backquoted, but the rule
  ;      itself doesn't modify the tree.  We could determine
  ;      whether we have one of these by loking at the definition
  ;      of the rule, but we can't do that here--it needs to wait
  ;      until the full grammar is parsed.  As there is a workaround
  ;      (backquote a non-terminal) I don't yet solve this problem.
  ;
  (define niljavni (match javni
                     (('morji-nunjavni-je `(list . ,javni) . _)
                      (fold fx+ 0 (map nilnarstura javni)))
                     (_ #f)))

  (let ((default (secuxna-?-default)))
    `(morji-nunjavni-? ,(if porsumti?
                            `(,@javni porjahe: #t)
                            javni)
                       ,@(if (string=? "" cmene)
                             '()
                             `(cmene: ,cmene))
                       ,@(if niljavni
                             `(ni: ,niljavni)
                             '())
                       ,@(if (equal? "" default)
                             '()
                             `(default: ,default))
                       ,@(if porsumti?
                             '(porsumti: #t)
                             '()))))

;; zero-or-more
;;
(define (samselpla-* #!key cmene javni)
  (define porsumti? (match javni
                      ((_ ... 'porsumti: #t) #t)
                      (_ #f)))

  (let ((default (secuxna-*-default)))
    `(morji-nunjavni-* ,(if porsumti?
                            `(,@javni porjahe: #t)
                            javni)
                       ,@(if (string=? "" cmene)
                             '()
                             `(cmene: ,cmene))
                       ,@(if (null? default)
                             '()
                             `(default: ,default))
                       ,@(if porsumti?
                             '(porsumti: #t)
                             '()))))

;; one-or-more
;;
(define (samselpla-+ #!key cmene javni)
  (define porsumti? (match javni
                      ((_ ... 'porsumti: #t) #t)
                      (_ #f)))

  `(morji-nunjavni-+ ,(if porsumti?
                          `(,@javni porjahe: #t)
                          javni)
                     ,@(if (string=? "" cmene)
                           '()
                           `(cmene: ,cmene))
                     ,@(if porsumti?
                           '(porsumti: #t)
                           '())))

;; range
;;
(define (samselpla-kuspe #!key cmene javni my slakabu ny)
  ; if I have a single range with no comma, match exactly that many
  ; times.
  ;
  (if (not (or slakabu (string=? "" my)))
      (set! ny my))

  (define porsumti? (match javni
                      ((_ ... 'porsumti: #t) #t)
                      (_ #f)))

  (let ((default (secuxna-*-default)))
    `(morji-nunjavni-kuspe ,(if porsumti?
                                `(,@javni porjahe: #t)
                                javni)
                           ,@(if (string=? "" cmene)
                                 '()
                                 `(cmene: ,cmene))
                           ,@(if (null? default)
                                 '()
                                 `(default: ,default))
                           ,@(if porsumti?
                                 '(porsumti: #t)
                                 '())
                           ,@(if (string=? "" my)
                                 '()
                                 `(my: ,(string->number my)))
                           ,@(if (string=? "" ny)
                                 '()
                                 `(ny: ,(string->number ny))))))

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

(define (samselpla-lerfu-page)
  #\page)

(define (samselpla-stura-valsi-selci #!key valsi-lerfu)
  `(morji-nunjavni-valsi ,(apply string-append valsi-lerfu) nastura: #f))

(define (samselpla-valsi-selci #!key valsi-lerfu)
  `(morji-nunjavni-valsi ,(apply string-append valsi-lerfu)))

(define (samselpla-valsi-newline)
  "\n")

(define (samselpla-valsi-return)
  (make-string 1 #\return))

(define (samselpla-valsi-tab)
  (make-string 1 #\tab))

(define (samselpla-valsi-page)
  (make-string 1 #\page))

(define (samselpla-valsi-backslash)
  (make-string 1 #\\))

(define (samselpla-valsi-single-quote)
  (make-string 1 #\'))

(define (samselpla-valsi-double-quote)
  (make-string 1 #\"))

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
  `(char-set-xor
     (char-set-union char-set:letter+digit (char-set #\'))
     (char-set #\q #\w)))

(define (samselpla-jbocahu)
  `(char-set-xor
     (char-set-union char-set:whitespace
                     char-set:punctuation
                     (char-set #\.))
     (char-set #\' #\,)))

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

(define (samselpla-klesi-newline)
  #\newline)

(define (samselpla-klesi-return)
  #\return)

(define (samselpla-klesi-tab)
  #\tab)

(define (samselpla-klesi-page)
  #\page)

(define (samselpla-klesi-lbracket)
  #\[)

(define (samselpla-klesi-rbracket)
  #\])

(define (samselpla-klesi-backslash)
  #\\)

(define (samselpla-klesi-lerfu #!key klesi-lerfu)
  klesi-lerfu)


(define (samselpla-klesi-selci-* #!key klesi-lerfu)
  (samselpla-klesi-selci klesi-lerfu: klesi-lerfu
                         javni: 'morji-nunjavni-char-set-*))

(define (samselpla-klesi-selci-+ #!key klesi-lerfu)
  (samselpla-klesi-selci klesi-lerfu: klesi-lerfu
                         javni: 'morji-nunjavni-char-set-+))

(define (samselpla-klesi-selci #!key klesi-lerfu
                                     (javni 'morji-nunjavni-char-set)
                                     (key '()))
  (define (union char-sets)
    (call-with-values
      (lambda ()
        (partition char? char-sets))

      (lambda (char char-set)
        (let ((cs `(,@char-set
                    ,@(if (null? char) '() `((char-set ,@char))))))
          (if (null? (cdr cs))
              (car cs)
              `(char-set-union ,@cs))))))

  `(,javni ,(union klesi-lerfu) ,@key))

(define (samselpla-klesi-selci-kuspe #!key klesi-lerfu my slakabu ny)
  ; if I have a single range with no comma, match exactly that many
  ; times.
  ;
  (if (not (or slakabu (string=? "" my)))
      (set! ny my))

  (let ((key `(,@(if (string=? "" my)
                     '()
                     `(my: ,(string->number my)))
               ,@(if (string=? "" ny)
                     '()
                     `(ny: ,(string->number ny))))))
    (samselpla-klesi-selci klesi-lerfu: klesi-lerfu
                           javni:       'morji-nunjavni-char-set-kuspe
                           key:         key)))


(define (samselpla-denpabu)
  `(morji-nunjavni-.))

(define (samselpla-samselpla-xadni #!key rodalerfu)
  (read (open-input-string (apply string rodalerfu))))

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
