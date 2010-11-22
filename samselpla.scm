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

(define-values (samselpla-gerna samselpla-smuni)
  (let ((cfari #f))
    (values
      ;; emit the entire grammar
      ;;
      (lambda (#!key smuni)
        (let ((selci cfari))
          (set! cfari #f)
          (if (not (null? smuni))
              `(letrec (,@smuni)
                 ,(string->symbol selci))
              '())))

      ;; emit the non-terminal with it's rule.
      ;;
      ;; we assume we're in a letrec.
      ;;
      (lambda (#!key naselci javni)
        ; if this is the first non-terminal we've seen, it is the
        ; initial rule of the grammar.
        (if (not cfari)
            (set! cfari naselci))

        `(,(string->symbol naselci)
           (nunjavni-morji ,javni))))))


(define (samselpla-naselci cfari fanmo)
  (string-append cfari fanmo))

(define (samselpla-je #!key samselpla rodajavni)
  (let* ((javni (if (null? (cdr rodajavni))
                         (car rodajavni)
                         `(nunjavni-je ,@rodajavni))))
    (if (equal? "" samselpla)
        javni
        `(nunjavni-samselpla ,(string->symbol samselpla) ,javni))))

(define (samselpla-selci-javni #!key cmene selci-javni)
  (if (equal? "" cmene)
      selci-javni
      `(,@selci-javni cmene: ',cmene)))

(define (samselpla-jonai . rodajavni)
  `(nunjavni-jonai ,@rodajavni))

(define (samselpla-? #!key cmene selci-javni)
  (if (equal? "" cmene)
      `(nunjavni-? ,selci-javni)
      `(nunjavni-? ,selci-javni cmene: ',cmene)))

(define (samselpla-* #!key cmene selci-javni)
  (if (equal? "" cmene)
      `(nunjavni-* ,selci-javni)
      `(nunjavni-* ,selci-javni cmene: ',cmene)))

(define (samselpla-+ #!key cmene selci-javni)
  (if (equal? "" cmene)
      `(nunjavni-+ ,selci-javni)
      `(nunjavni-+ ,selci-javni cmene: ',cmene)))

(define (samselpla-& #!key selci-javni)
  `(nunjavni-& ,selci-javni))

(define (samselpla-fanmo)
  `(nunjavni-fanmo))

(define (samselpla-! #!key selci-javni)
  `(nunjavni-! ,selci-javni))

(define (samselpla-cmene-sumti #!key cfari fanmo)
  `,(string->symbol (string-append cfari fanmo ":")))

;; A naselci that appears on the right side of a definition.
;;
(define (samselpla-selci-naselci #!key naselci)
  `(nunjavni-naselci ,(string->symbol naselci)))

(define (samselpla-lerfu-selci #!key lerfu)
  `(nunjavni-lerfu ,lerfu))

(define (samselpla-valsi-selci #!key valsi-lerfu)
  `(nunjavni-valsi ,(apply string-append valsi-lerfu)))

(define (samselpla-klesi-selci klesi)
  `(nunjavni-re ,klesi))

(define (samselpla-denpabu)
  `(nunjavni-.))

;; ignore the FAhO tag in the file, and
;; just return the grammar.
;;
(define (samselpla-cfari gerna)
  gerna)

;; ignore comments and space
;;
(define (samselpla-canlu)
  '())
