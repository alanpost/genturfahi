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
(define (nunjavni-lerfu lerfu)
  (lambda (porsi mapti namapti)
    (if (char=? lerfu (lerfu-porsi-lerfu porsi))
        (mapti (make-lerfu-porsi-pabalvi-lerfu porsi)
               (lambda () (make-javni-valsi-nacmene lerfu)))
        (namapti porsi))))


;; selci: parse the end of input.
;;
;; Should this rule return the sentinel character, or should there
;; be a separate option for the value to return at the end of the file?
;;
(define (nunjavni-fanmo)
  (lambda (porsi mapti namapti)
    (if (lerfu-porsi-fanmo? porsi)
        (mapti porsi (lambda () (make-javni-valsi-nacmene #\nul)))
        (namapti porsi))))


;; selci: parse any single character. 
;;
(define (nunjavni-.)
  (lambda (porsi mapti namapti)
    (if (lerfu-porsi-fanmo? porsi)
        (namapti porsi)
        (mapti (make-lerfu-porsi-pabalvi-lerfu porsi)
               (lambda ()
                 (make-javni-valsi-nacmene (lerfu-porsi-lerfu porsi)))))))


;; empty-string: parse the empty string, which always succeeds without
;;               advancing input.
;;
(define (nunjavni-e)
  (lambda (porsi mapti namapti)
    (mapti porsi (lambda () (make-javni-valsi-nacmene "")))))


;; regular expression: match the provided in regular expression
;;
(define (nunjavni-re pattern)
  (let ((re (regexp (string-append "^" pattern))))
    (lambda (porsi mapti namapti)
      (define (javni-re lefpoi)
        (mapti (make-lerfu-porsi-pabalvi-valsi porsi (car lefpoi))
               (lambda () (make-javni-valsi-nacmene (car lefpoi)))))

      (let ((zva (lerfu-porsi-zva porsi))
            (poi (lerfu-porsi-poi porsi)))
                ; search the parse input, being careful to avoid
                ; the sentinel and already matched parse input.
        (cond ((string-search
                 re
                 poi
                 zva
                 (- (string-length poi) zva 1)) => javni-re)
              (else (namapti porsi)))))))


;; zero-or-more: parse zero or more javni out of the |lerfu-porsi|.
;;
(define (nunjavni-* javni)
  (define (javni-* porsi
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
      (javni-* porsi
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
      (mapti porsi (apply vejmina-nunvalsi (cdr cfari))))

    (javni porsi mapti-* namapti-*))
  javni-*)


;; one-or-more: parse one or more javni out of the |lerfu-porsi|.
;;
(define (nunjavni-+ javni)
  (let ((javni-* (nunjavni-* javni)))
    (lambda (porsi mapti namapti)
      (let ((mapti-+ (lambda (porsi nunvalsi)
                        (let ((fanmo (list nunvalsi)))
                          (javni-* porsi
                                   mapti
                                   namapti
                                   cfari: (cons (list '()) fanmo)
                                   fanmo: fanmo)))))
        (javni porsi mapti-+ namapti)))))


;; optional: parse an optional javni out of the |lerfu-porsi|.
;;
(define (nunjavni-? javni)
  (define (javni-? porsi mapti namapti)
    (let ((namapti-? (lambda (porsi)
                      ; ignore the failure in |ignore-nunvalsi|, as
                      ; this javni cannot fail.  |porsi| is not advanced
                      ; on failure, so we can use it.
                      ;
                      (mapti porsi
                             (lambda ()
                               (make-javni-valsi-nacmene ""))))))
      (javni porsi mapti namapti-?)))
  javni-?)


;; and-predicate: succeed or fail without consuming input.
;;
(define (nunjavni-& javni)
  (lambda (porsi mapti namapti)
    (define (mapti-& ignore-porsi nunvalsi)
      (mapti porsi nunvalsi))

    (define (namapti-& ignore-porsi)
      (namapti porsi))

    (javni porsi mapti-& namapti-&)))


;; not-predicate: require that javni is not able to be parsed from
;;                the |parsi-porsi|.
;;
(define (nunjavni-! javni)
  (lambda (porsi mapti namapti)
    (define (mapti-! ignore-porsi nunvalsi)
      (namapti porsi))

    (define (namapti-! ignore-porsi)
      (mapti porsi (lambda () (make-javni-valsi-nacmene ""))))

    (javni porsi mapti-! namapti-!)))


;; sequence: parse ro da javni out of the |lerfu-porsi|.
;;           if any of the do not match, none of them match.
;;
(define (nunjavni-je . rodajavni)
  (lambda (porsi mapti namapti)
    ; the (nun)valsi passed to us might
    ; include previously matched javni.  If
    ; we fail to match a javni, ignore the
    ; porsi passed to us and use the one from
    ; the start of this parse rule.
    ;
    (define (namapti-je ignore-porsi)
      (namapti porsi))

    (define (javni-je porsi
                      mapti
                      namapti
                      #!optional rodajavni
                                 ; a "dummy head" is a linked-list
                                 ; optimization we'll return the cdr
                                 ; of this list, but by using this
                                 ; extra cons we avoid checking for
                                 ; the beginning of the list below.
                                 ;
                      #!key     (cfari (list '()))
                                (fanmo cfari))
      (let ((javni (car rodajavni))
            (rest (cdr rodajavni)))
        (if (null? rest)
            ; called at the end of the list
            (let ((mapti-je (lambda (porsi nunvalsi)
                               (set-cdr! fanmo (list nunvalsi))
                               (mapti porsi
                                      (apply vejmina-nunvalsi (cdr cfari))))))
              (javni porsi mapti-je namapti-je))

            ; called when there are still elements in the list
            (let ((mapti-je (lambda (porsi nunvalsi)
                               (set-cdr! fanmo (list nunvalsi))
                               (javni-je porsi
                                         mapti
                                         namapti
                                         rest
                                         cfari: cfari
                                         fanmo: (cdr fanmo)))))
              (javni porsi mapti-je namapti-je)))))

    (javni-je porsi mapti namapti rodajavni)))


;; ordered-choice: parse the first matching javni out of the
;;                 |lerfu-porsi|.
;;
(define (nunjavni-jonai . rodajavni)
  (define (javni-jonai porsi
                       mapti
                       namapti
                       #!optional (rodajavni rodajavni))
    (let ((javni (car rodajavni))
          (rest (cdr rodajavni)))
      (if (null? rest)
          ; called at the end of the list
          (javni porsi mapti namapti)

          ; called when there are still elements in the list
          (let ((namapti-jonai (lambda (porsi)
                                (javni-jonai porsi mapti namapti rest))))
            (javni porsi mapti namapti-jonai)))))

  javni-jonai)


;; morji: memoization is done to ensure we run in linear time.
;;        Any javni can be memoized, but in practice we memoize
;;        na selci javni.
;;
(define-values (genturfahi-tolmohi nunjavni-morji)
  (let ((clear-mapti-caches '())
        (clear-namapti-caches '()))
    (values
      (lambda ()
        (map (lambda (x) (x)) clear-mapti-caches)
        (map (lambda (x) (x)) clear-namapti-caches)
        '())

      (lambda (javni)
        (let ((mapti-cache '())
              (namapti-cache '()))

          ; register this cache so we can clear if we want to use this
          ; parser on a new |lerfu-porsi|.
          ;
          (set! clear-mapti-caches
            (cons (lambda () (set! mapti-cache '()))
                  clear-mapti-caches))
          (set! clear-namapti-caches
            (cons (lambda () (set! namapti-cache '()))
                  clear-namapti-caches))

          (lambda (cache-porsi mapti namapti)
            (define (set-mapti-cache! cache-porsi porsi nunvalsi)
              (set! mapti-cache
                (cons (cons cache-porsi (list porsi nunvalsi))
                      mapti-cache)))

            (define (set-namapti-cache! cache-porsi porsi)
              (set! namapti-cache
                (cons (cons cache-porsi (list porsi))
                      namapti-cache)))

            ;; call the cached |mapti|
            (define (mapti-morji assv-valsi)
              (apply mapti (cdr assv-valsi)))

            ;; call the cached |nomapti|
            (define (namapti-morji assv-valsi)
              (apply namapti (cdr assv-valsi)))

            (define (javni-morji)
              (define (mapti-morji porsi nunvalsi)
                (set-mapti-cache! cache-porsi
                                  porsi
                                  nunvalsi)
                (mapti porsi nunvalsi))

              (define (namapti-morji porsi)
                (set-namapti-cache! cache-porsi porsi)
                (namapti porsi))

              (javni cache-porsi mapti-morji namapti-morji))

                   ; search the match results
            (cond ((assv cache-porsi mapti-cache) => mapti-morji)
                   ; search the non-match results
                  ((assv cache-porsi namapti-cache) => namapti-morji)
                   ; run the rule.
                  (else (javni-morji)))))))))

(define (nunjavni-samselpla-mapti samselpla javni)
  (lambda (porsi mapti namapti)
    (define (mapti-samselpla porsi nunvalsi)
      (define (nunvalsi-samselpla)
        (let* ((rodavalsi (nunvalsi))
               (rodacme   (filter javni-valsi-cme
                                  (flatten (if (list? rodavalsi)
                                               rodavalsi
                                               (list rodavalsi)))))
               (rodaval   (map javni-valsi-val rodacme))
               (valsi     (apply samselpla rodaval)))
          (make-javni-valsi-nacmene valsi)))
      (mapti porsi nunvalsi-samselpla))
    (javni porsi mapti-samselpla namapti)))

(define (nunjavni-cmene* cmene javni)
  (lambda (porsi mapti namapti)
    (define (mapti-cmene porsi nunvalsi)
      (define (nunvalsi-cmene)
        (make-javni-valsi cmene (javni-nunvalsi-val nunvalsi)))
      (mapti porsi nunvalsi-cmene))
    (javni porsi mapti-cmene namapti)))
