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
    (define (javni-lerfu porsi zvati mapti namapti)
      (if (char=? lerfu (string-ref porsi zvati))
          (mapti porsi (fx+ 1 zvati) (nunvalsi-lerfu lerfu))
          (namapti porsi zvati)))
    javni-lerfu))


;; selci: parse any single character. 
;;
(define (nunjavni-.* #!key cmene nastura porjahe)
  (let ((nunvalsi-.* (make-nunvalsi cmene nastura porjahe)))
    (define (javni-.* porsi zvati mapti ignore-namapti)
      (mapti porsi
             (fx- (string-length porsi) 1)
             (nunvalsi-.* (lerfu-porsi-string porsi zvati))))
    javni-.*))

(define (nunjavni-.+ #!key cmene nastura porjahe)
  (let ((nunvalsi-.+ (make-nunvalsi cmene nastura porjahe)))
    (define (javni-.+ porsi zvati mapti namapti)
      (if (lerfu-porsi-fanmo? porsi zvati)
          (namapti porsi zvati)
          (mapti porsi
                 (fx- (string-length porsi) 1)
                 (nunvalsi-.+ (lerfu-porsi-string porsi zvati)))))
    javni-.+))

(define (nunjavni-.kuspe #!key cmene
                               nastura
                               porjahe
                               (my 0)
                               (ny most-positive-fixnum))
  (let ((nunvalsi-.kuspe (make-nunvalsi cmene nastura porjahe)))
    (define (javni-.kuspe porsi zvati mapti namapti)
      (let ((fam (fx- (fx- (string-length porsi) 1) zvati)))
        (if (fx>= fam my)
            (let ((stali (min fam ny)))
              (mapti porsi
                     (fx+ zvati stali)
                     (nunvalsi-.kuspe (string-copy porsi
                                                   zvati
                                                   (fx+ zvati stali)))))
            (namapti porsi zvati))))
    javni-.kuspe))

(define (nunjavni-. #!key cmene nastura porjahe)
  (let ((nunvalsi-. (make-nunvalsi cmene nastura porjahe)))
    (define (javni-. porsi zvati mapti namapti)
      (if (lerfu-porsi-fanmo? porsi zvati)
          (namapti porsi zvati)
          (mapti porsi (fx+ 1 zvati) (nunvalsi-.  (string-ref porsi zvati)))))
    javni-.))


;; empty-string: parse the empty string, which always succeeds without
;;               advancing input.
;;
(define (nunjavni-e #!key cmene (nastura #t) porjahe (empty-string ""))
  (let ((nunvalsi-e (make-nunvalsi cmene nastura porjahe)))
    (define (javni-e porsi zvati mapti ignore-namapti)
      (mapti porsi zvati (nunvalsi-e empty-string)))
    javni-e))


;; empty-list: parse the empty list, which always succeeds without
;;             advancing input.
;;
(define (nunjavni-nil #!key cmene nastura porjahe (empty-list '()))
  (let ((nunvalsi-nil (make-nunvalsi cmene nastura porjahe)))
    (define (javni-nil porsi zvati mapti ignore-namapti)
      (mapti porsi zvati (nunvalsi-nil empty-list)))
    javni-nil))


;; selci: parse the end of input.
;;
;; Should this rule return the sentinel character, or should there
;; be a separate option for the value to return at the end of the file?
;;
(define (nunjavni-fanmo #!key cmene (nastura #t) porjahe (sentinel #\nul))
  (let ((nunvalsi-fanmo (make-nunvalsi cmene nastura porjahe)))
    (define (javni-fanmo porsi zvati mapti namapti)
      (if (lerfu-porsi-fanmo? porsi zvati)
          (mapti porsi zvati (nunvalsi-fanmo sentinel))
          (namapti porsi zvati)))
  javni-fanmo))


;; selci: parse the specified string
;;
(define (nunjavni-valsi valsi #!key cmene (nastura #t) porjahe)
  (let ((nilcla (string-length valsi))
        (nunvalsi-valsi (make-nunvalsi cmene nastura porjahe)))
    (define (javni-valsi porsi zvati mapti namapti)
      (if (string-prefix? valsi
                          porsi
                          0
                          nilcla
                          zvati
                          (fx- (string-length porsi) 1))
          (mapti porsi (fx+ zvati nilcla) (nunvalsi-valsi valsi))
          (namapti porsi zvati)))
    javni-valsi))


(define (nunjavni-char-set-* char-set #!key cmene nastura porjahe)
  (let ((nunvalsi-char-set-* (make-nunvalsi cmene nastura porjahe)))
    (define (javni-char-set-* porsi
                              cfari-zvati
                              mapti
                              ignore-namapti
                                         ; if we're matching one or
                                         ; more, this will be advanced
                                         ; by one.
                              #!optional (zvati cfari-zvati))
      (define (mapti-char-set-* zvati)
        (mapti porsi
               zvati
               (nunvalsi-char-set-* (string-copy porsi cfari-zvati zvati))))

      (define (char-set-* zvati)
        (if (char-set-contains? char-set (string-ref porsi zvati))
            (char-set-* (fx+ 1 zvati))
            zvati))

      (mapti-char-set-* (char-set-* zvati)))
    javni-char-set-*))


(define (nunjavni-char-set-+ char-set #!key cmene nastura porjahe)
  (let ((javni-char-set-* (nunjavni-char-set-* char-set
                                               cmene:   cmene
                                               nastura: nastura
                                               porjahe: porjahe)))
    (define (javni-char-set-+ porsi zvati mapti namapti)
      (if (char-set-contains? char-set (string-ref porsi zvati))
          (javni-char-set-* porsi
                            zvati
                            mapti
                            namapti
                            (fx+ 1 zvati))
          (namapti porsi zvati)))
    javni-char-set-+))

(define (nunjavni-char-set-kuspe char-set #!key cmene
                                                nastura
                                                porjahe
                                                (my 0)
                                                (ny most-positive-fixnum))
  (let ((nunvalsi-char-set-kuspe (make-nunvalsi cmene nastura porjahe)))
    (define (javni-char-set-kuspe porsi
                                  zvati
                                  mapti
                                  namapti)
      (define (mapti-char-set-kuspe klani)
        (mapti porsi
               (fx+ zvati klani)
               (nunvalsi-char-set-kuspe (string-copy porsi
                                                     zvati
                                                     (fx+ zvati klani)))))

      (define (char-set-kuspe zvati klani)
        (if (and (fx< klani ny)
                 (char-set-contains? char-set (string-ref porsi zvati)))
            (char-set-kuspe (fx+ 1 zvati) (fx+ 1 klani))
            klani))

      (let ((klani (char-set-kuspe zvati 0)))
        (if (fx>= klani my)
            (mapti-char-set-kuspe klani)
            (namapti porsi zvati))))

    javni-char-set-kuspe))

(define (nunjavni-char-set char-set #!key cmene nastura porjahe)
  (let ((nunvalsi-char-set (make-nunvalsi cmene nastura porjahe)))
    (define (javni-char-set porsi zvati mapti namapti)
      (let ((lerfu (string-ref porsi zvati)))
        (if (char-set-contains? char-set lerfu)
            (mapti porsi (fx+ 1 zvati) (nunvalsi-char-set lerfu))
            (namapti porsi zvati))))
    javni-char-set))

;; zero-or-more: parse zero or more javni out of the |lerfu-porsi|.
;;
(define (nunjavni-* javni #!key cmene nastura porjahe porsumti (default '()))
  (let ((vejmina   (venunjmina-rodavalsi-* cmene
                                           nastura
                                           porjahe
                                           porsumti))
        (novejmina (novejmina-nunvalsi cmene nastura porjahe default #f)))
    (define (suhopa-javni-* porsi
                            zvati
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
      (define (mapti-* porsi zvati nunvalsi)
        ; append this result to the result list
        (set-cdr! fanmo (list nunvalsi))
        (suhopa-javni-* porsi
                        zvati
                        mapti
                        namapti
                        cfari: cfari
                        fanmo: (cdr fanmo)))

      (define (namapti-* porsi zvati)
        ; ignore the failure in |ignore-nunjavni|, as
        ; this javni cannot fail.  |porsi| is not advanced
        ; on failure, so we can use it, capturing any
        ; cases that did succeed.
        ;
        (mapti porsi zvati (vejmina (cdr cfari))))

      (javni porsi zvati mapti-* namapti-*))

    (define (pamoi-javni-* porsi
                           zvati
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
      (define (mapti-* porsi zvati nunvalsi)
        ; append this result to the result list
        (set-cdr! fanmo (list nunvalsi))
        (suhopa-javni-* porsi
                        zvati
                        mapti
                        namapti
                        cfari: cfari
                        fanmo: (cdr fanmo)))

      (define (namapti-* porsi zvati)
        ; ignore the failure in |ignore-nunjavni|, as
        ; this javni cannot fail.  |porsi| is not advanced
        ; on failure, so we can use it, capturing any
        ; cases that did succeed.
        ;
        (mapti porsi zvati novejmina))

      (javni porsi zvati mapti-* namapti-*))

    (values pamoi-javni-* suhopa-javni-*)))


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
    (define (javni-+ porsi zvati mapti namapti)
      (define (mapti-+ porsi zvati nunvalsi)
        (let ((fanmo (list nunvalsi)))
          (javni-* porsi
                   zvati
                   mapti
                   namapti
                   cfari:   (cons '() fanmo)
                   fanmo:   fanmo)))
      (javni porsi zvati mapti-+ namapti))
    javni-+))


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
  (let ((vejmina (venunjmina-rodavalsi-* cmene
                                         nastura
                                         porjahe
                                         porsumti))
        (novejmina (novejmina-nunvalsi cmene nastura porjahe default #f)))
    (define (suhopa-javni-kuspe porsi
                                zvati
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
      (define (mapti-kuspe porsi zvati nunvalsi)
        ; append this result to the result list
        (set-cdr! fanmo (list nunvalsi))

        ; if we have matched up to our limit, succeed.
        ; otherwise keep matching.
        ;
        (if (fx= ny klani)
            (mapti porsi zvati (vejmina (cdr cfari)))
            (suhopa-javni-kuspe porsi
                                zvati
                                mapti
                                namapti
                                cfari: cfari
                                fanmo: (cdr fanmo)
                                klani: (fx+ 1 klani))))

      (define (namapti-kuspe porsi zvati)
        (if (fx> klani my)
            (mapti porsi zvati (vejmina (cdr cfari)))
            (namapti porsi zvati)))

      (javni porsi zvati mapti-kuspe namapti-kuspe))

    (define (pamoi-javni-kuspe porsi
                               zvati
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
      (define (mapti-kuspe porsi zvati nunvalsi)
        ; append this result to the result list
        (set-cdr! fanmo (list nunvalsi))

        ; if we have matched up to our limit, succeed.
        ; otherwise keep matching.
        ;
        (if (fx= ny klani)
            (mapti porsi zvati (vejmina (cdr cfari)))
            (suhopa-javni-kuspe porsi
                                zvati
                                mapti
                                namapti
                                cfari: cfari
                                fanmo: (cdr fanmo)
                                klani: (fx+ 1 klani))))

      (define (namapti-kuspe porsi zvati)
        (if (fx> klani my)
            (mapti porsi zvati novejmina)
            (namapti porsi zvati)))

      (javni porsi zvati mapti-kuspe namapti-kuspe))

    pamoi-javni-kuspe))



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
    (define (javni-? porsi zvati mapti ignore-namapti)

      (define (mapti-? porsi zvati nunvalsi)
        (mapti porsi zvati (vejmina nunvalsi)))

      (define (namapti-? porsi zvati)
        ; ignore the failure in |ignore-nunvalsi|, as
        ; this javni cannot fail.  |porsi| is not advanced
        ; on failure, so we can use it.
        ;
        (mapti porsi zvati novejmina))

      (javni porsi zvati mapti-? namapti-?))
    javni-?))


;; and-predicate: succeed or fail without consuming input.
;;
(define (nunjavni-& javni #!key porjahe)
  (let ((nunvalsi-& (make-nunvalsi-predicate porjahe)))
    (define (javni-& porsi zvati mapti namapti)
      (define (mapti-& ignore-porsi ignore-zvati ignore-nunvalsi)
        (mapti porsi zvati nunvalsi-&))

      (define (namapti-& ignore-porsi ignore-zvati)
        (namapti porsi zvati))

      (javni porsi zvati mapti-& namapti-&))
    javni-&))


;; not-predicate: require that |javni| is not able to be parsed from
;;                the |lerfu-porsi|.
;;
(define (nunjavni-! javni #!key porjahe)
  (let ((nunvalsi-! (make-nunvalsi-predicate porjahe)))
    (define (javni-! porsi zvati mapti namapti)
      (define (mapti-! ignore-porsi ignore-zvati ignore-nunvalsi)
        (namapti porsi zvati))

      (define (namapti-! ignore-porsi ignore-zvati)
        (mapti porsi zvati nunvalsi-!))

      (javni porsi zvati mapti-! namapti-!))
    javni-!))


;; sequence: parse |ro da javni| out of the |lerfu-porsi|.
;;           if any of the do not match, none of them match.
;;
(define (nunjavni-je rodajavni #!key cmene nastura porjahe porsumti)
  (let ((vejmina (venunjmina-rodavalsi-je cmene nastura porjahe porsumti)))
    (define (javni-je porsi
                      zvati
                      mapti
                      namapti
                                 ; capture the initial position, and
                                 ; then continue to pass it as we
                                 ; call ourselves recursively.
                      #!key     (cfari-porsi porsi)
                                (cfari-zvati zvati)
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
      (define (namapti-je ignore-porsi ignore-zvati)
        (namapti cfari-porsi cfari-zvati))

      (let ((javni (car rodajavni))
            (rest (cdr rodajavni)))
        (if (null? rest)

            ; called at the end of the list
            (let ((mapti-je (lambda (porsi zvati nunvalsi)
                               (set-cdr! fanmo (list nunvalsi))
                               (mapti porsi zvati (vejmina (cdr cfari))))))
              (javni porsi zvati mapti-je namapti-je))

            ; called when there are still elements in the list
            (let ((mapti-je (lambda (porsi zvati nunvalsi)
                               (set-cdr! fanmo (list nunvalsi))
                               (javni-je porsi
                                         zvati
                                         mapti
                                         namapti
                                         cfari-porsi: cfari-porsi
                                         cfari-zvati: cfari-zvati
                                         rodajavni: rest
                                         cfari: cfari
                                         fanmo: (cdr fanmo)))))
              (javni porsi zvati mapti-je namapti-je)))))
  javni-je))


;; ordered-choice: parse the first matching javni out of the
;;                 |lerfu-porsi|.
;;
(define (nunjavni-jonai rodajavni #!key cmene nastura porjahe porsumti)
  (let ((vejmina   (venunjmina-nunvalsi cmene nastura porjahe porsumti)))
    (define (javni-jonai porsi
                         zvati
                         mapti
                         namapti
                         #!optional (rodajavni rodajavni))
      (define (mapti-jonai porsi zvati nunvalsi)
        (mapti porsi zvati (vejmina nunvalsi)))

      (let ((javni (car rodajavni))
            (rest (cdr rodajavni)))
        (if (null? rest)
            ; called at the end of the list
            (javni porsi zvati mapti-jonai namapti)

            ; called when there are still elements in the list
            (let ((namapti-jonai (lambda (porsi zvati)
                                   (javni-jonai porsi
                                                zvati
                                                mapti
                                                namapti
                                                rest))))
              (javni porsi zvati mapti-jonai namapti-jonai)))))
    javni-jonai))


;; convert a single result to a list.  Called with non-terminal
;; rules
;;
(define (nunjavni-porjahe javni)
  (define (javni-porjahe porsi zvati mapti namapti)
    (define (mapti-porjahe porsi zvati nunvalsi)
      (mapti porsi zvati `(,nunvalsi)))

    (javni porsi zvati mapti-porjahe namapti))

  javni-porjahe)


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

          (define (javni-morji morji-porsi morji-zvati mapti namapti)
            ;; mapti
            (define (set-mapti-morji! porsi zvati nunvalsi)
              (define (mapti-morji mapti ignore-namapti)
                (mapti porsi zvati nunvalsi))

              (hash-table-set! morji morji-zvati mapti-morji))

            ;; namapti
            (define (set-namapti-morji! porsi zvati)
              (define (namapti-morji ignore-mapti namapti)
                (namapti porsi zvati))

              (hash-table-set! morji morji-zvati namapti-morji))

            ;; recurse
            (define (set-recurse-morji!)
              (define (recurse-morji ignore-mapti namapti)
                (namapti morji-porsi morji-zvati))

              (hash-table-set! morji morji-zvati recurse-morji))

            (define (javni-nomorji)
              (define (mapti-morji porsi zvati nunvalsi)
                (set-mapti-morji! porsi zvati nunvalsi)
                (mapti porsi zvati nunvalsi))

              (define (namapti-morji porsi zvati)
                (set-namapti-morji! porsi zvati)
                (namapti porsi zvati))

              ; register this parse position to detect left
              ; recursion.
              (set-recurse-morji!)

              (javni morji-porsi morji-zvati mapti-morji namapti-morji))

            (let ((nunjalge
                    (hash-table-ref/default morji morji-zvati #f)))
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
    (define (javni-samselpla porsi zvati mapti namapti)
      (define (mapti-samselpla porsi zvati nunvalsi)
        (define (samselpla-sumti rodavalsi)
          (call-with-values
            (lambda ()
              (partition javni-valsi? rodavalsi))
          
            (lambda (cmesumti sumti)
              (let ((key (append-map
                           (lambda (javni)
                             (let ((cme (javni-valsi-cme javni))
                                   (val (javni-valsi-val* javni)))
                               `(,(string->keyword cme) ,val)))
                           cmesumti))
                    (rest (javni-rodavalsi-samselpla sumti)))
                (append rest key)))))

        (define (samselpla-nunvalsi)
          (let* ((rodaval   (samselpla-sumti nunvalsi))
                 (valsi     (apply samselpla rodaval)))
             (nunvalsi-samselpla valsi)))

        (mapti porsi zvati (samselpla-nunvalsi)))

      (javni porsi zvati mapti-samselpla namapti))
    javni-samselpla))

(define (nunjavni-samselpla-cabna samselpla javni #!key cmene porjahe)
  (let ((nunvalsi-samselpla-cabna (make-nunvalsi cmene #f porjahe))
        (javni-samselpla (nunjavni-samselpla samselpla javni
                                                       porjahe: porjahe)))
    (define (javni-samselpla-cabna porsi zvati mapti namapti)
      (define (mapti-samselpla-cabna mapti-porsi mapti-zvati nunvalsi)
        (if (eq? (secuxna-nonmatch-token) nunvalsi)
            (namapti porsi zvati)
            (mapti mapti-porsi
                   mapti-zvati
                   (nunvalsi-samselpla-cabna nunvalsi))))

      (javni-samselpla porsi zvati mapti-samselpla-cabna namapti))
    javni-samselpla-cabna))

(define (nunjavni-cmene javni #!key cmene nastura porjahe)
  (let ((nunvalsi-cmene (make-nunvalsi cmene nastura porjahe)))
    (define (javni-cmene porsi zvati mapti namapti)
      (define (mapti-cmene porsi zvati nunvalsi)
        (mapti porsi
               zvati
               (nunvalsi-cmene nunvalsi)))
      (javni porsi zvati mapti-cmene namapti))
    javni-cmene))

;; backtick operator
;;
(define (nunjavni-nastura javni #!key porjahe)
  (let ((nunvalsi-nastura (make-nunvalsi-predicate porjahe)))
    (define (javni-nastura porsi zvati mapti namapti)
      (define (mapti-nastura porsi zvati ignore-nunvalsi)
        (mapti porsi zvati nunvalsi-nastura))
      (javni porsi zvati mapti-nastura namapti))
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
