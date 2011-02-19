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
;;; nunjavni - javni generators
;;;

;; selci: parse a single specified character.
;;
(define (nunjavni-lerfu lerfu #!key cmene (nastura #t) porjahe)
  (let ((nunvalsi-lerfu (make-nunvalsi cmene nastura porjahe)))
    (define (javni-lerfu porsi mapti namapti)
      (if (char=? lerfu (lerfu-porsi-lerfu porsi))
          (mapti (make-lerfu-porsi-pabalvi-lerfu porsi)
                 (nunvalsi-lerfu lerfu))
          (namapti porsi)))
    (nunjavni-secuxna
      (lambda ()
        (string-append "#\\" (make-string 1 lerfu)))
        javni-lerfu)))


;; selci: parse any single character. 
;;
(define (nunjavni-.* #!key cmene nastura porjahe)
  (let ((nunvalsi-.* (make-nunvalsi cmene nastura porjahe)))
    (define (javni-.* porsi mapti ignore-namapti)
      (mapti (make-lerfu-porsi-fanmo porsi)
             (nunvalsi-.* (lerfu-porsi-string porsi))))
    (nunjavni-secuxna (lambda () "#\\.*") javni-.*)))

(define (nunjavni-.+ #!key cmene nastura porjahe)
  (let ((nunvalsi-.+ (make-nunvalsi cmene nastura porjahe)))
    (define (javni-.+ porsi mapti namapti)
      (if (lerfu-porsi-fanmo? porsi)
          (namapti porsi)
          (mapti (make-lerfu-porsi-fanmo porsi)
                 (nunvalsi-.+ (lerfu-porsi-string porsi)))))
    (nunjavni-secuxna (lambda () "#\\.+") javni-.+)))

(define (nunjavni-.kuspe #!key cmene
                               nastura
                               porjahe
                               (my 0)
                               (ny most-positive-fixnum))
  (let ((nunvalsi-.kuspe (make-nunvalsi cmene nastura porjahe)))
    (define (javni-.kuspe porsi mapti namapti)
      (let* ((poi (lerfu-porsi-poi porsi))
             (zva (lerfu-porsi-zva porsi))
             (fam (fx- (fx- (string-length poi) 1) zva)))
        (if (fx>= fam my)
            (let ((stali (min fam ny)))
              (mapti (make-lerfu-porsi-pabalvi-valsi porsi stali)
                     (nunvalsi-.kuspe (string-copy poi zva (fx+ zva stali)))))
            (namapti porsi))))
    (nunjavni-secuxna (lambda () "#\\.kuspe") javni-.kuspe)))

(define (nunjavni-. #!key cmene nastura porjahe)
  (let ((nunvalsi-. (make-nunvalsi cmene nastura porjahe)))
    (define (javni-. porsi mapti namapti)
      (if (lerfu-porsi-fanmo? porsi)
          (namapti porsi)
          (mapti (make-lerfu-porsi-pabalvi-lerfu porsi)
                 (nunvalsi-. (lerfu-porsi-lerfu porsi)))))
    (nunjavni-secuxna (lambda () "#\\.") javni-.)))


;; empty-string: parse the empty string, which always succeeds without
;;               advancing input.
;;
(define (nunjavni-e #!key cmene (nastura #t) porjahe (empty-string ""))
  (let ((nunvalsi-e (make-nunvalsi cmene nastura porjahe)))
    (define (javni-e porsi mapti ignore-namapti)
      (mapti porsi (nunvalsi-e empty-string)))
    (nunjavni-secuxna (lambda () (make-string 2 #\")) javni-e)))


;; empty-list: parse the empty list, which always succeeds without
;;             advancing input.
;;
(define (nunjavni-nil #!key cmene nastura porjahe (empty-list '()))
  (let ((nunvalsi-nil (make-nunvalsi cmene nastura porjahe)))
    (define (javni-nil porsi mapti ignore-namapti)
      (mapti porsi (nunvalsi-nil empty-list)))
    (nunjavni-secuxna (lambda () "()") javni-nil)))


;; selci: parse the end of input.
;;
;; Should this rule return the sentinel character, or should there
;; be a separate option for the value to return at the end of the file?
;;
(define (nunjavni-fanmo #!key cmene (nastura #t) porjahe (sentinel #\nul))
  (let ((nunvalsi-fanmo (make-nunvalsi cmene nastura porjahe)))
    (define (javni-fanmo porsi mapti namapti)
      (if (lerfu-porsi-fanmo? porsi)
          (mapti porsi (nunvalsi-fanmo sentinel))
          (namapti porsi)))
  (nunjavni-secuxna (lambda () "!.") javni-fanmo)))


;; selci: parse the specified string
;;
(define (nunjavni-valsi valsi #!key cmene (nastura #t) porjahe)
  (let ((nilcla (string-length valsi))
        (nunvalsi-valsi (make-nunvalsi cmene nastura porjahe)))
    (define (javni-valsi porsi mapti namapti)
      (let ((poi (lerfu-porsi-poi porsi))
            (zva (lerfu-porsi-zva porsi)))
        (if (string-prefix? valsi
                            poi
                            0
                            nilcla
                            zva
                            (fx- (string-length poi) 1))
            (mapti (make-lerfu-porsi-pabalvi-valsi porsi nilcla)
                   (nunvalsi-valsi valsi))
            (namapti porsi))))
    (nunjavni-secuxna
      (lambda ()
        (string-append (make-string 1 #\") valsi (make-string 1 #\")))
        javni-valsi)))


(define (nunjavni-char-set-* char-set #!key cmene nastura porjahe)
  (let ((nunvalsi-char-set-* (make-nunvalsi cmene nastura porjahe)))
    (define (javni-char-set-* porsi
                              mapti
                              ignore-namapti
                              #!optional (poi (lerfu-porsi-poi porsi))
                                         (zva (lerfu-porsi-zva porsi)))
      (define (mapti-char-set-* zva)
        (let ((puzva (lerfu-porsi-zva porsi)))
          (mapti (make-lerfu-porsi-pabalvi-valsi porsi (fx- zva puzva))
                 (nunvalsi-char-set-* (string-copy poi puzva zva)))))

      (define (char-set-* poi zva)
        (if (char-set-contains? char-set (string-ref poi zva))
            (char-set-* poi (fx+ 1 zva))
            zva))

      (mapti-char-set-* (char-set-* poi zva)))
    (nunjavni-secuxna
      (lambda () (string-append "[" (char-set->string char-set) "]*"))
      javni-char-set-*)))


(define (nunjavni-char-set-+ char-set #!key cmene nastura porjahe)
  (let ((javni-char-set-* (nunjavni-char-set-* char-set
                                               cmene:   cmene
                                               nastura: nastura
                                               porjahe: porjahe)))
    (define (javni-char-set-+ porsi mapti namapti)
      (let ((poi        (lerfu-porsi-poi porsi))
            (zva        (lerfu-porsi-zva porsi)))
        (if (char-set-contains? char-set (string-ref poi zva))
            (javni-char-set-* porsi
                              mapti
                              namapti
                              poi
                              (fx+ 1 zva))
            (namapti porsi))))
    (nunjavni-secuxna
      (lambda () (string-append "[" (char-set->string char-set) "]+"))
      javni-char-set-+)))

(define (nunjavni-char-set-kuspe char-set #!key cmene
                                                nastura
                                                porjahe
                                                (my 0)
                                                (ny most-positive-fixnum))
  (let ((nunvalsi-char-set-kuspe (make-nunvalsi cmene nastura porjahe)))
    (define (javni-char-set-kuspe porsi
                                  mapti
                                  namapti
                                  #!optional (poi (lerfu-porsi-poi porsi))
                                             (zva (lerfu-porsi-zva porsi)))
      (define (mapti-char-set-kuspe klani)
        (mapti (make-lerfu-porsi-pabalvi-valsi porsi klani)
               (nunvalsi-char-set-kuspe (string-copy poi
                                                     zva
                                                     (fx+ zva klani)))))

      (define (char-set-kuspe poi zva klani)
        (if (and (fx< klani ny)
                 (char-set-contains? char-set (string-ref poi zva)))
            (char-set-kuspe poi (fx+ 1 zva) (fx+ 1 klani))
            klani))

      (let ((klani (char-set-kuspe poi zva 0)))
        (if (fx>= klani my)
            (mapti-char-set-kuspe klani)
            (namapti porsi))))

    (nunjavni-secuxna
      (lambda () (string-append "[" (char-set->string char-set) "]"
                                "{" (number->string ny)
                                "," (number->string my) "}"))
      javni-char-set-kuspe)))

(define (nunjavni-char-set char-set #!key cmene nastura porjahe)
  (let ((nunvalsi-char-set (make-nunvalsi cmene nastura porjahe)))
    (define (javni-char-set porsi mapti namapti)

      (let* ((poi        (lerfu-porsi-poi porsi))
             (zva        (lerfu-porsi-zva porsi)))
        (if (char-set-contains? char-set (string-ref poi zva))
            (mapti (make-lerfu-porsi-pabalvi-lerfu porsi)
                   (nunvalsi-char-set (lerfu-porsi-lerfu porsi)))
            (namapti porsi))))
    (nunjavni-secuxna
      (lambda () (string-append "[" (char-set->string char-set) "]"))
      javni-char-set)))

;; zero-or-more: parse zero or more javni out of the |lerfu-porsi|.
;;
(define (nunjavni-* javni #!key cmene nastura porjahe porsumti (default '()))
  (let ((vejmina   (venunjmina-rodanunvalsi-* cmene
                                              nastura
                                              porjahe
                                              porsumti))
        (novejmina (novejmina-nunvalsi cmene nastura porjahe default #f)))
    (define (suhopa-javni-* porsi
                            mapti
                            namapti
                                   ; a "dummy head" is a linked-list
                                   ; optimization we'll return the cdr
                                   ; of this list, but by using this
                                   ; extra cons we avoid checking for
                                   ; the beginning of the list below.
                                   ;
                            #!key (cfari (list '()))
                                  (fanmo cfari))
      (define (mapti-* porsi nunvalsi)
        ; append this result to the result list
        (set-cdr! fanmo (list nunvalsi))
        (suhopa-javni-* porsi
                        mapti
                        namapti
                        cfari: cfari
                        fanmo: (cdr fanmo)))

      (define (namapti-* porsi)
        ; ignore the failure in |ignore-nunjavni|, as
        ; this javni cannot fail.  |porsi| is not advanced
        ; on failure, so we can use it, capturing any
        ; cases that did succeed.
        ;
        (mapti porsi (vejmina (cdr cfari))))

      (javni porsi mapti-* namapti-*))

    (define (pamoi-javni-* porsi
                           mapti
                           namapti
                                  ; a "dummy head" is a linked-list
                                  ; optimization we'll return the cdr
                                  ; of this list, but by using this
                                  ; extra cons we avoid checking for
                                  ; the beginning of the list below.
                                  ;
                           #!key (cfari (list '()))
                                 (fanmo cfari))
      (define (mapti-* porsi nunvalsi)
        ; append this result to the result list
        (set-cdr! fanmo (list nunvalsi))
        (suhopa-javni-* porsi
                        mapti
                        namapti
                        cfari: cfari
                        fanmo: (cdr fanmo)))

      (define (namapti-* porsi)
        ; ignore the failure in |ignore-nunjavni|, as
        ; this javni cannot fail.  |porsi| is not advanced
        ; on failure, so we can use it, capturing any
        ; cases that did succeed.
        ;
        (mapti porsi novejmina))

      (javni porsi mapti-* namapti-*))

    (values (nunjavni-secuxna (lambda () "*") pamoi-javni-*)
            (nunjavni-secuxna (lambda () "*") suhopa-javni-*))))


;; one-or-more: parse one or more javni out of the |lerfu-porsi|.
;;
(define (nunjavni-+ javni #!key cmene nastura porjahe porsumti)
  (let ((javni-* (call-with-values
                   (lambda ()
                     (nunjavni-* javni
                                 cmene:    cmene
                                 nastura:  nastura
                                 porjahe:  porjahe
                                 porsumti: porsumti))
                   (lambda (pamoi suhopa)
                     suhopa))))
    (define (javni-+ porsi mapti namapti)
      (define (mapti-+ porsi nunvalsi)
        (let ((fanmo (list nunvalsi)))
          (javni-* porsi
                   mapti
                   namapti
                   cfari:   (cons '() fanmo)
                   fanmo:   fanmo)))
      (javni porsi mapti-+ namapti))
    (nunjavni-secuxna (lambda () "+") javni-+)))


;; range: parse N,M javni out of the |lerfu-porsi|.
;
;; javni{n,m}                 => match at least m and no more than n times.
;; javni{m}   => javni{n,n}   => match exactly m times.
;; javni{m,}  => javni{n,inf} => match m or more times.
;; javni{,n}  => javni{0,n}   => match zero to n times.
;; javni{,}   => javni{0,inf} => match zero-or-more times.
;; javni{}    => javni{0,inf} => match zero-or-more times.
;;
(define (nunjavni-kuspe javni #!key cmene
                                    nastura
                                    porjahe
                                    porsumti
                                    (default '())
                                    (my 0)
                                    (ny most-positive-fixnum))
  (let ((vejmina (venunjmina-rodanunvalsi-* cmene
                                            nastura
                                            porjahe
                                            porsumti))
        (novejmina (novejmina-nunvalsi cmene nastura porjahe default #f)))
    (define (suhopa-javni-kuspe porsi
                                mapti
                                namapti
                                        ; a "dummy head" is a linked-list
                                        ; optimization we'll return the cdr
                                        ; of this list, but by using this
                                        ; extra cons we avoid checking for
                                        ; the beginning of the list below.
                                        ;
                                 #!key (cfari (list '()))
                                       (fanmo cfari)
                                       (klani 1))
      (define (mapti-kuspe porsi nunvalsi)
        ; append this result to the result list
        (set-cdr! fanmo (list nunvalsi))

        ; if we have matched up to our limit, succeed.
        ; otherwise keep matching.
        ;
        (if (fx= ny klani)
            (mapti porsi (vejmina (cdr cfari)))
            (suhopa-javni-kuspe porsi
                                mapti
                                namapti
                                cfari: cfari
                                fanmo: (cdr fanmo)
                                klani: (fx+ 1 klani))))

      (define (namapti-kuspe porsi)
        (if (fx> klani my)
            (mapti porsi (vejmina (cdr cfari)))
            (namapti porsi)))

      (javni porsi mapti-kuspe namapti-kuspe))

    (define (pamoi-javni-kuspe porsi
                               mapti
                               namapti
                                       ; a "dummy head" is a linked-list
                                       ; optimization we'll return the cdr
                                       ; of this list, but by using this
                                       ; extra cons we avoid checking for
                                       ; the beginning of the list below.
                                       ;
                                #!key (cfari (list '()))
                                      (fanmo cfari)
                                      (klani 1))
      (define (mapti-kuspe porsi nunvalsi)
        ; append this result to the result list
        (set-cdr! fanmo (list nunvalsi))

        ; if we have matched up to our limit, succeed.
        ; otherwise keep matching.
        ;
        (if (fx= ny klani)
            (mapti porsi (vejmina (cdr cfari)))
            (suhopa-javni-kuspe porsi
                                mapti
                                namapti
                                cfari: cfari
                                fanmo: (cdr fanmo)
                                klani: (fx+ 1 klani))))

      (define (namapti-kuspe porsi)
        (if (fx> klani my)
            (mapti porsi novejmina)
            (namapti porsi)))

      (javni porsi mapti-kuspe namapti-kuspe))

    (nunjavni-secuxna (lambda () "kuspe") pamoi-javni-kuspe)))



;; optional: parse an optional javni out of the |lerfu-porsi|.
;;
(define (nunjavni-? javni #!key cmene
                                nastura
                                porjahe
                                porsumti
                                (default "")
                                ni)
  (let ((vejmina   (venunjmina-nunvalsi cmene nastura porjahe porsumti))
        (novejmina (novejmina-nunvalsi cmene nastura porjahe default ni)))
    (define (javni-? porsi mapti ignore-namapti)

      (define (mapti-? porsi nunvalsi)
        (mapti porsi (vejmina nunvalsi)))

      (define (namapti-? porsi)
        ; ignore the failure in |ignore-nunvalsi|, as
        ; this javni cannot fail.  |porsi| is not advanced
        ; on failure, so we can use it.
        ;
        (mapti porsi novejmina))

      (javni porsi mapti-? namapti-?))
    (nunjavni-secuxna (lambda () "?") javni-?)))


;; and-predicate: succeed or fail without consuming input.
;;
(define (nunjavni-& javni #!key porjahe)
  (let ((nunvalsi-& (make-nunvalsi-predicate porjahe)))
    (define (javni-& porsi mapti namapti)
      (define (mapti-& ignore-porsi ignore-nunvalsi)
        (mapti porsi nunvalsi-&))

      (define (namapti-& ignore-porsi)
        (namapti porsi))

      (javni porsi mapti-& namapti-&))
    (nunjavni-secuxna (lambda () "&") javni-&)))


;; not-predicate: require that |javni| is not able to be parsed from
;;                the |lerfu-porsi|.
;;
(define (nunjavni-! javni #!key porjahe)
  (let ((nunvalsi-! (make-nunvalsi-predicate porjahe)))
    (define (javni-! porsi mapti namapti)
      (define (mapti-! ignore-porsi ignore-nunvalsi)
        (namapti porsi))

      (define (namapti-! ignore-porsi)
        (mapti porsi nunvalsi-!))

      (javni porsi mapti-! namapti-!))
    (nunjavni-secuxna (lambda () "!") javni-!)))


;; sequence: parse |ro da javni| out of the |lerfu-porsi|.
;;           if any of the do not match, none of them match.
;;
(define (nunjavni-je rodajavni #!key cmene nastura porjahe porsumti)
  (let ((vejmina (venunjmina-rodanunvalsi-je cmene nastura porjahe porsumti)))
    (define (javni-je porsi
                      mapti
                      namapti
                                 ; capture the initial position, and
                                 ; then continue to pass it as we
                                 ; call ourselves recursively.
                      #!key     (cfari-porsi porsi)
                                 ; the current rule we're trying.
                                (rodajavni rodajavni)
                                 ; a "dummy head" is a linked-list
                                 ; optimization we'll return the cdr
                                 ; of this list, but by using this
                                 ; extra cons we avoid checking for
                                 ; the beginning of the list below.
                                 ;
                                (cfari (list '()))
                                (fanmo cfari))
      ; the (nun)valsi passed to us might
      ; include previously matched javni.  If
      ; we fail to match a javni, ignore the
      ; porsi passed to us and use the one from
      ; the start of this parse rule.
      ;
      (define (namapti-je ignore-porsi)
        (namapti cfari-porsi))

      (let ((javni (car rodajavni))
            (rest (cdr rodajavni)))
        (if (null? rest)

            ; called at the end of the list
            (let ((mapti-je (lambda (porsi nunvalsi)
                               (set-cdr! fanmo (list nunvalsi))
                               (mapti porsi (vejmina (cdr cfari))))))
              (javni porsi mapti-je namapti-je))

            ; called when there are still elements in the list
            (let ((mapti-je (lambda (porsi nunvalsi)
                               (set-cdr! fanmo (list nunvalsi))
                               (javni-je porsi
                                         mapti
                                         namapti
                                         cfari-porsi: cfari-porsi
                                         rodajavni: rest
                                         cfari: cfari
                                         fanmo: (cdr fanmo)))))
              (javni porsi mapti-je namapti-je)))))
  (nunjavni-secuxna (lambda () "je") javni-je)))


;; ordered-choice: parse the first matching javni out of the
;;                 |lerfu-porsi|.
;;
(define (nunjavni-jonai rodajavni #!key cmene nastura porjahe porsumti)
  (let ((vejmina   (venunjmina-nunvalsi cmene nastura porjahe porsumti)))
    (define (javni-jonai porsi
                         mapti
                         namapti
                         #!optional (rodajavni rodajavni))
      (define (mapti-jonai porsi nunvalsi)
        (mapti porsi (vejmina nunvalsi)))

      (let ((javni (car rodajavni))
            (rest (cdr rodajavni)))
        (if (null? rest)
            ; called at the end of the list
            (javni porsi mapti-jonai namapti)

            ; called when there are still elements in the list
            (let ((namapti-jonai (lambda (porsi)
                                  (javni-jonai porsi mapti namapti rest))))
              (javni porsi mapti-jonai namapti-jonai)))))
    (nunjavni-secuxna (lambda () "jonai") javni-jonai)))


;; convert a single result to a list.  Called with non-terminal
;; rules
;;
(define (nunjavni-porjahe javni)
  (define (javni-porjahe porsi mapti namapti)
    (define (mapti-porjahe porsi nunvalsi)
      (mapti porsi (lambda () `(,(nunvalsi)))))

    (javni porsi mapti-porjahe namapti))

  (nunjavni-secuxna (lambda () "porja'e") javni-porjahe))


;; morji: memoization is done to ensure we run in linear time.
;;        Any javni can be memoized, though the compiler only
;;        memoizes non-terminals above a certain level of
;;        complexity.
;;
(define-values (genturfahi-semorji genturfahi-tolmohi nunjavni-morji)
  (let ((rodasemorji '())
        (rodatolmohi '()))
    (values
      (lambda (nilcla)
        (map (lambda (semorji) (semorji nilcla)) rodasemorji))

      (lambda ()
        (map (lambda (tolmohi) (tolmohi)) rodatolmohi))

      (lambda (javni)
        (let ((morji '()))
          (define (semorji nilcla)
            (let ((klani (quotient nilcla 2)))
              (set! morji (make-hash-table = size: (if (= 0 klani) 1 klani)))))

          (define (tolmohi)
            (set! morji '()))

          (define (javni-morji morji-porsi mapti namapti)
            ;; mapti
            (define (set-mapti-morji! porsi nunvalsi)
              (define (mapti-morji mapti ignore-namapti)
                (mapti porsi nunvalsi))

              (hash-table-set! morji
                               (lerfu-porsi-zva morji-porsi)
                               mapti-morji))

            ;; namapti
            (define (set-namapti-morji! porsi)
              (define (namapti-morji ignore-mapti namapti)
                (namapti porsi))

              (hash-table-set! morji
                               (lerfu-porsi-zva morji-porsi)
                               namapti-morji))

            ;; recurse
            (define (set-recurse-morji!)
              (define (recurse-morji ignore-mapti namapti)
                (namapti morji-porsi))

              (hash-table-set! morji
                               (lerfu-porsi-zva morji-porsi)
                               recurse-morji))

            (define (javni-nomorji)
              (define (mapti-morji porsi nunvalsi)
                (set-mapti-morji! porsi nunvalsi)
                (mapti porsi nunvalsi))

              (define (namapti-morji porsi)
                (set-namapti-morji! porsi)
                (namapti porsi))

              ; register this parse position to detect left
              ; recursion.
              (set-recurse-morji!)

              (javni morji-porsi mapti-morji namapti-morji))

            (let ((nunjalge
                    (hash-table-ref/default morji
                                            (lerfu-porsi-zva morji-porsi)
                                            #f)))
              (if nunjalge (nunjalge mapti namapti) (javni-nomorji))))

          ; register this cache so we can initialize and clear.
          ; This routine customizes itself based on the input size,
          ; and we can free up a substantial amount of memory if
          ; we clear the caches after we're done parsing.
          ;
          (set! rodasemorji (cons semorji rodasemorji))
          (set! rodatolmohi (cons tolmohi rodatolmohi))

          javni-morji)))))

(define (nunjavni-samselpla samselpla javni #!key cmene porjahe)
  (let ((nunvalsi-samselpla (make-nunvalsi cmene #f porjahe)))
    (define (javni-samselpla porsi mapti namapti)
      (define (mapti-samselpla porsi nunvalsi)
        (define (samselpla-sumti rodavalsi)
          (call-with-values
            (lambda ()
              (define (vejmina javni-valsi)
                (if (list? javni-valsi)
                    (append-map vejmina javni-valsi)
                    `(,javni-valsi)))

              (let ((rodavalsi (append-map vejmina rodavalsi)))
                (partition (lambda (javni) (javni-valsi-cme javni)) rodavalsi)))
          
            (lambda (cmesumti sumti)
              (let ((key (append-map
                           (lambda (javni)
                             (let ((cme (javni-valsi-cme javni))
                                   (val (javni-valsi-val* javni)))
                               (if (javni-nastura? val)
                                   '()
                                   `(,(string->keyword cme) ,val))))
                           cmesumti))
                    (rest (javni-rodavalsi-samselpla-val sumti)))
                (append rest key)))))

        (define (samselpla-nunvalsi)
          (let* ((rodavalsi (nunvalsi))
                 (rodaval   (samselpla-sumti rodavalsi))
                 (valsi     (apply samselpla rodaval)))
             ; call the generator immediately.
             ((nunvalsi-samselpla valsi))))

        (mapti porsi samselpla-nunvalsi))

      (javni porsi mapti-samselpla namapti))
    javni-samselpla))

(define (nunjavni-samselpla-cabna samselpla javni #!key cmene porjahe)
  (let ((nunvalsi-samselpla-cabna (make-nunvalsi cmene #f porjahe))
        (javni-samselpla (nunjavni-samselpla samselpla javni
                                                       porjahe: porjahe)))
    (define (javni-samselpla-cabna porsi mapti namapti)
      (define (mapti-samselpla-cabna mapti-porsi nunvalsi)
        (let ((val (javni-nunvalsi-val* nunvalsi)))
          (if (eq? (secuxna-nonmatch-token) val)
              (namapti porsi)
              (mapti mapti-porsi (nunvalsi-samselpla-cabna val)))))

      (javni-samselpla porsi mapti-samselpla-cabna namapti))
    javni-samselpla-cabna))

(define (nunjavni-cmene javni #!key cmene nastura porjahe)
  (let ((nunvalsi-cmene (make-nunvalsi cmene nastura porjahe)))
    (define (javni-cmene porsi mapti namapti)
      (define (mapti-cmene porsi nunvalsi)
        (mapti porsi (nunvalsi-cmene (javni-nunvalsi-val* nunvalsi))))
      (javni porsi mapti-cmene namapti))
    javni-cmene))

;; backtick operator
;;
(define (nunjavni-nastura javni #!key porjahe)
  (let ((nunvalsi-nastura (make-nunvalsi-predicate porjahe)))
    (define (javni-nastura porsi mapti namapti)
      (define (mapti-nastura porsi ignore-nunvalsi)
        (mapti porsi nunvalsi-nastura))
      (javni porsi mapti-nastura namapti))
    javni-nastura))

;; decorate each rule according to the options specified.
;;
(define (nunjavni-secuxna nuncmene javni #!rest cmene-sumti)
  (define (cfisisku cmene javni)
    (if (secuxna-debug)
        (apply nunjavni-cfisisku cmene javni cmene-sumti)
        javni))

  (define (junla cmene javni)
    (if (secuxna-profile)
        (apply nunjavni-junla cmene javni cmene-sumti)
        javni))

  (if (or (secuxna-debug) (secuxna-profile))
      (let ((cmene (nuncmene)))
        (cfisisku cmene (junla cmene javni)))
      javni))
