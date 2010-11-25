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

;; ignore the FAhO tag in the file, and
;; just return the header code and grammar.
;;
(define (samselpla-cfari #!key rodasamselpla gerna)
  (if (null? rodasamselpla)
      gerna
      gerna
;      `(nunjavni-samselpla
;         (lambda ()
;           ,@(map (lambda (samselpla) (call-with-input-string samselpla read))
;                  rodasamselpla))
;         ,gerna)))

(define (samselpla-gerna #!key smuni)
  (let ((selci (start-production)))

    ; reset the start production.
    (start-production #f)

    (if (not (null? smuni))
        `(letrec (,@smuni)
           ,(string->symbol selci))
        '())))

;; emit the non-terminal with it's rule.
;;
;; we assume we're in a letrec.
;;
(define (samselpla-smuni #!key naselci javni)
  ; if this is the first non-terminal we've seen, it is the
  ; initial rule of the grammar.
  (if (not (start-production))
      (start-production naselci))

  `(,(string->symbol naselci)
     (nunjavni-morji ,javni)))


(define (samselpla-naselci #!key cfari fanmo)
  (string-append cfari fanmo))

(define (samselpla-je #!key samselpla rodajavni)
  (let* ((javni (if (null? (cdr rodajavni))
                         (car rodajavni)
                         `(nunjavni-je ,@rodajavni))))
    (if (equal? "" samselpla)
        javni
        `(nunjavni-samselpla ,(string->symbol samselpla) ,javni))))

(define (samselpla-pajavni-cmene #!key cmene javni)
  (if (equal? "" cmene)
      javni
      `(,@javni cmene: ,cmene)))

(define (samselpla-jonai-je #!key je)
  je)

(define (samselpla-jonai #!key cfari fanmo)
  `(nunjavni-jonai ,cfari ,@fanmo))

(define (samselpla-? #!key cmene javni)
  (if (equal? "" cmene)
      `(nunjavni-? ,javni)
      `(nunjavni-? ,javni cmene: ,cmene)))

(define (samselpla-* #!key cmene javni)
  (if (equal? "" cmene)
      `(nunjavni-* ,javni)
      `(nunjavni-* ,javni cmene: ,cmene)))

(define (samselpla-+ #!key cmene javni)
  (if (equal? "" cmene)
      `(nunjavni-+ ,javni)
      `(nunjavni-+ ,javni cmene: ,cmene)))

(define (samselpla-& #!key javni)
  `(nunjavni-& ,javni))

(define (samselpla-fanmo)
  `(nunjavni-fanmo))

(define (samselpla-! #!key javni)
  `(nunjavni-! ,javni))

(define (samselpla-cmene-sumti #!key cfari fanmo)
  `,(string-append cfari fanmo))

;; A naselci that appears on the right side of a definition.
;;
(define (samselpla-selci-naselci #!key naselci)
  `(nunjavni-naselci ,(string->symbol naselci)))

(define (samselpla-lerfu-selci #!key lerfu)
  `(nunjavni-lerfu ,lerfu))

(define (samselpla-lerfu-space)
  #\space)

(define (samselpla-lerfu-linefeed)
  #\return)

(define (samselpla-lerfu-linefeed)
  #\linefeed)

(define (samselpla-lerfu-newline)
  #\newline)

(define (samselpla-lerfu-return)
  #\return)

(define (samselpla-lerfu-tab)
  #\tab)

(define (samselpla-valsi-selci #!key valsi-lerfu)
  `(nunjavni-valsi ,(apply string-append valsi-lerfu)))

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

(define (samselpla-odigit)
  "0-7")

(define (samselpla-^odigit)
  "^0-7")

(define (samselpla-klesi-selci #!key klesi-lerfu repeat)
  `(nunjavni-re ,(string-append "["
                                (apply string-append klesi-lerfu)
                                "]"
                                repeat)))

(define (samselpla-klesi-lerfu #!key klesi-lerfu)
  (make-string 1 klesi-lerfu))

(define (samselpla-denpabu)
  `(nunjavni-.))

(define (samselpla-samselpla #!key rodalerfu)
  (apply string rodalerfu))

(define (samselpla-samselpla-lerfu #!key lerfu)
  lerfu)

(define (samselpla-girzu-javni #!key javni)
  javni)

;; ignore comments and space
;;
(define (samselpla-canlu)
  '())
