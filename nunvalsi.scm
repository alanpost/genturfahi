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
;;; nunvalsi - valsi generators
;;;

;; Each rule has a flag describing whether to make a javni-valsi
;; on a successful match of that rule.  This routine returns an
;; appropriate constructor, depending on that flag.
;;
(define (make-nunvalsi cmene nastura porjahe)
  (match `(,nastura ,porjahe)
    ((#t #t) (lambda (ignore-valsi)
               (lambda () `(,(make-javni-valsi cmene secuxna-nastura)))))
    ((#t #f) (lambda (ignore-valsi)
               (lambda () (make-javni-valsi cmene secuxna-nastura))))
    ((#f #t) (lambda (valsi)
               (lambda () `(,(make-javni-valsi cmene valsi)))))
    ((#f #f) (lambda (valsi)
               (lambda () (make-javni-valsi cmene valsi))))))


;; predicate rules (& and !) don't have names and never modify the
;; tree.  We sometimes do want to return lists, however.
;;
(define (make-nunvalsi-predicate porjahe)
  (match porjahe
    (#t (lambda () `(,(make-javni-valsi #f secuxna-nastura))))
    (#f (lambda () (make-javni-valsi #f secuxna-nastura)))))


;; non-terminal rules are given a nunvalsi, rather than a valsi.
;; merge the nunvalsi into a new structure, possibly changing
;; the name, ignoring the token, &c.
;;
(define (venunjmina-nunvalsi cmene nastura porjahe porsumti)
  (match `(,nastura ,porjahe ,porsumti)
    ((#t #t (or #t #f)) (lambda (ignore-nunvalsi)
                          (lambda ()
                            `(,(make-javni-valsi cmene secuxna-nastura)))))
    ((#t #f (or #t #f)) (lambda (ignore-nunvalsi)
                          (lambda ()
                            (make-javni-valsi cmene secuxna-nastura))))

    ((#f #t #t) (lambda (nunvalsi)
                  nunvalsi))
    ((#f #t #f) (lambda (nunvalsi)
                  (lambda ()
                    `(,(make-javni-valsi cmene
                                         (javni-nunvalsi-val* nunvalsi))))))
    ((#f #f #t) (lambda (nunvalsi)
                  (lambda ()
                    (make-javni-valsi cmene
                                      (javni-rodavalsi-val (nunvalsi))))))
    ((#f #f #f) (lambda (nunvalsi)
                  (lambda ()
                    (make-javni-valsi cmene
                                      (javni-nunvalsi-val* nunvalsi)))))))


;; merge multiple nunvalsi with or without a cmene
;;
(define (venunjmina-rodanunvalsi-* cmene nastura porjahe porsumti)
  (match `(,nastura ,porjahe ,porsumti)
    ((#t #t (or #t #f)) (lambda (ignore-rodanunvalsi)
                          (lambda ()
                            `(,(make-javni-valsi cmene secuxna-nastura)))))
    ((#t #f (or #t #f)) (lambda (ignore-rodanunvalsi)
                           (lambda ()
                             (make-javni-valsi cmene secuxna-nastura))))
    ((#f #t #t) (lambda (rodanunvalsi)
                  (lambda ()
                    `(,(make-javni-valsi
                         cmene
                         (javni-rodanunvalsi-*-val rodanunvalsi))))))
    ((#f #t #f) (lambda (rodanunvalsi)
                  (lambda ()
                    `(,(make-javni-valsi
                         cmene
                         (javni-rodanunvalsi-val rodanunvalsi))))))
    ((#f #f #t) (lambda (rodanunvalsi)
                  (lambda ()
                    (make-javni-valsi
                      cmene
                      (javni-rodanunvalsi-*-val rodanunvalsi)))))
    ((#f #f #f) (lambda (rodanunvalsi)
                  (lambda ()
                    (make-javni-valsi
                      cmene
                      (javni-rodanunvalsi-val rodanunvalsi)))))))


(define (venunjmina-rodanunvalsi-je cmene nastura porjahe ignore-porsumti)
  (match `(,nastura ,porjahe)
    ((#t #t) (lambda (ignore-rodanunvalsi)
               (lambda ()
                 `(,(make-javni-valsi cmene secuxna-nastura)))))
    ((#t #f) (lambda (ignore-rodanunvalsi)
               (lambda ()
                 (make-javni-valsi cmene secuxna-nastura))))

             ; cmene is ignored in this case.
    ((#f #t) (lambda (rodanunvalsi)
               (lambda ()
                 (map (lambda (nunvalsi) (nunvalsi)) rodanunvalsi))))
    ((#f #f) (lambda (rodanunvalsi)
               (lambda ()
                 (make-javni-valsi
                   cmene
                   (javni-rodanunvalsi-je-val rodanunvalsi)))))))


;; called when the choice is between returning the default and the
;; non-structure token.  Used in cases when when not-matching the
;; input still counts as a match.
;;
(define (novejmina-nunvalsi cmene nastura porjahe default ni)
  ;; evaluate |body ...| once and return a list with the value
  ;; repeated |n| times.
  ;;
  (define-syntax repeat
    (syntax-rules ()
      ((_ n body ...)
       (let ((r ((lambda () body ...))))
         (unfold-right (lambda (x) (fx= x 0))
                       (lambda (x) r)
                       (lambda (x) (fx- x 1))
                       n)))))

  (let* ((val         (if nastura secuxna-nastura default))
         (javni-valsi (if ni (repeat ni (make-javni-valsi cmene val))
                             (make-javni-valsi cmene val))))
    (if porjahe
        (lambda () `(,javni-valsi))
        (lambda () javni-valsi))))
