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
(define (samselpla-cfari #!key gerna)
  gerna)
;      `(nunjavni-samselpla
;         (lambda ()
;           ,@(map (lambda (samselpla) (call-with-input-string samselpla read))
;                  rodasamselpla))
;         ,gerna)))

(define (samselpla-cfari-samselpla #!key rodalerfu)
  (let* ((valsi     (apply string rodalerfu))
         (samselpla (call-with-input-string valsi read)))
    (safe-eval samselpla environment: genturfahi-env)))

(define (samselpla-gerna #!key smuni)
  (let ((selci (secuxna-start-production)))

    ; reset the start production.
    (secuxna-start-production #f)

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
  (if (not (secuxna-start-production))
      (secuxna-start-production naselci))

  `(,(string->symbol naselci)
    ,(if (secuxna-memoize)
         `(nunjavni-morji ,javni)
         javni)))


(define (samselpla-naselci #!key cfari fanmo)
  (string-append (make-string 1 cfari) fanmo))

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
      (if (eq? 'lambda (car javni))
          `(nunjavni-cmene ,javni cmene: ,cmene)
          `(,@javni cmene: ,cmene))))

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
  `,(string-append (make-string 1 cfari) fanmo))

;; A naselci that appears on the right side of a definition.
;;
(define (samselpla-selci-naselci #!key naselci)
  `(lambda (porsi mapti namapti)
     (,(string->symbol naselci) porsi mapti namapti)))

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
                 (char-set (secuxna-sentinel))))

(define (samselpla-^alpha)
  `(char-set-xor (char-set-complement char-set:letter)
                 (char-set (secuxna-sentinel))))

(define (samselpla-^ascii)
  `(char-set-xor (char-set-complement char-set:ascii)
                 (char-set (secuxna-sentinel))))

(define (samselpla-^blank)
  `(char-set-xor (char-set-complement char-set:blank)
                 (char-set (secuxna-sentinel))))

(define (samselpla-^cntrl)
  `(char-set-xor (char-set-complement char-set:iso-control)
                 (char-set (secuxna-sentinel))))

(define (samselpla-^digit)
  `(char-set-xor (char-set-complement char-set:digit)
                 (char-set (secuxna-sentinel))))

(define (samselpla-^graph)
  `(char-set-xor (char-set-complement char-set:graphic)
                 (char-set (secuxna-sentinel))))

(define (samselpla-^lower)
  `(char-set-xor (char-set-complement char-set:lower-case)
                 (char-set (secuxna-sentinel))))

(define (samselpla-^odigit)
  `(char-set-xor (char-set-complement
                   (char-set #\0 #\1 #\2 #\3 #\4 #\5 #\6 #\7))
                 (char-set (secuxna-sentinel))))

(define (samselpla-^print)
  `(char-set-xor (char-set-complement char-set:printing)
                 (char-set (secuxna-sentinel))))

(define (samselpla-^punct)
  `(char-set-xor (char-set-complement char-set:punctuation)
                 (char-set (secuxna-sentinel))))

(define (samselpla-^space)
  `(char-set-xor (char-set-complement char-set:whitespace)
                 (char-set (secuxna-sentinel))))

(define (samselpla-^upper)
  `(char-set-xor (char-set-complement char-set:upper-case)
                 (char-set (secuxna-sentinel))))

(define (samselpla-^xdigit)
  `(char-set-xor (char-set-complement char-set:hex-digit)
                 (char-set (secuxna-sentinel))))


(define (samselpla-klesi-lerfu #!key klesi-lerfu)
  `(char-set ,klesi-lerfu))


(define (samselpla-klesi-selci-* #!key klesi-lerfu)
  (if (null? (cdr klesi-lerfu))
      `(nunjavni-char-set-* ,(car klesi-lerfu))
      `(nunjavni-char-set-* (char-set-union ,@klesi-lerfu))))

(define (samselpla-klesi-selci-+ #!key klesi-lerfu)
  (if (null? (cdr klesi-lerfu))
      `(nunjavni-char-set-+ ,(car klesi-lerfu))
      `(nunjavni-char-set-+ (char-set-union ,@klesi-lerfu))))

(define (samselpla-klesi-selci #!key klesi-lerfu)
  (if (null? (cdr klesi-lerfu))
      `(nunjavni-char-set ,(car klesi-lerfu))
      `(nunjavni-char-set (char-set-union ,@klesi-lerfu))))


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
