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
  (match `(,cmene ,nastura ,porjahe)
    ((_  #t #t) (lambda (ignore-valsi) `(,secuxna-nastura)))
    ((_  #t #f) (lambda (ignore-valsi) secuxna-nastura))
    ((#f #f #t) (lambda (valsi) `(,valsi)))
    ((_  #f #t) (lambda (valsi) `(,(make-javni-valsi cmene valsi))))
    ((#f #f #f) (lambda (valsi) valsi))
    ((_  #f #f) (lambda (valsi) (make-javni-valsi cmene valsi)))))


;; predicate rules (& and !) don't have names and never modify the
;; tree.  We sometimes do want to return lists, however.
;;
(define (make-nunvalsi-predicate porjahe)
  (if porjahe `(,secuxna-nastura) secuxna-nastura))


;; non-terminal rules are given a nunvalsi, rather than a valsi.
;; merge the nunvalsi into a new structure, possibly changing
;; the name, ignoring the token, &c.
;;
(define (venunjmina-nunvalsi cmene nastura porjahe porsumti)

  (match `(,cmene ,nastura ,porjahe ,porsumti)
    ; ignore cmene, it can't be combined with secuxna-nastura
    ;
    ((_  #t #t (or #t #f)) (lambda (ignore-valsi) `(,secuxna-nastura)))
    ((_  #t #f (or #t #f)) (lambda (ignore-valsi) secuxna-nastura))

    ; XXX: a cmene is not valid when returning a list?  Or I should
    ;      return a list with a single named element?
    ((#f #f #t #t) (lambda (rodavalsi) (remove javni-nastura? rodavalsi)))
    ((_  #f #t #t) (lambda (rodavalsi) (remove javni-nastura? rodavalsi)))

    ((#f #f #t #f) (lambda (valsi) `(,valsi)))
    ((_  #f #t #f) (lambda (valsi) `(,(make-javni-valsi cmene valsi))))

    ((#f #f #f #t) (lambda (rodavalsi)
                     (javni-rodavalsi-girzu rodavalsi)))
    ((_  #f #f #t) (lambda (rodavalsi)
                     (make-javni-valsi cmene
                                       (javni-rodavalsi-girzu rodavalsi))))

    ((#f #f #f #f) (lambda (valsi) valsi))
    ((_  #f #f #f) (lambda (valsi) (make-javni-valsi cmene valsi)))))


;; merge multiple nunvalsi with or without a cmene
;;
(define (venunjmina-rodavalsi-* cmene nastura porjahe porsumti)
  (match `(,cmene ,nastura ,porjahe ,porsumti)
    ((_  #t #t (or #t #f)) (lambda (ignore-rodavalsi) `(,secuxna-nastura)))
    ((_  #t #f (or #t #f)) (lambda (ignore-rodavalsi) secuxna-nastura))

    ((#f #f #t #t) (lambda (rodavalsi) `(,(javni-rodavalsi-* rodavalsi))))
    ((_  #f #t #t) (lambda (rodavalsi)
                     `(,(make-javni-valsi
                          cmene
                          (javni-rodavalsi-* rodavalsi)))))

    ((#f #f #t #f) (lambda (rodavalsi) `(,(javni-rodavalsi rodavalsi))))
    ((_  #f #t #f) (lambda (rodavalsi)
                     `(,(make-javni-valsi
                          cmene
                          (javni-rodavalsi rodavalsi)))))

    ((#f #f #f #t) (lambda (rodavalsi) (javni-rodavalsi-* rodavalsi)))
    ((_  #f #f #t) (lambda (rodavalsi)
                     (make-javni-valsi
                       cmene
                       (javni-rodavalsi-* rodavalsi))))

    ((#f #f #f #f) (lambda (rodavalsi) (javni-rodavalsi rodavalsi)))
    ((_  #f #f #f) (lambda (rodavalsi)
                     (make-javni-valsi
                       cmene
                       (javni-rodavalsi rodavalsi))))))


(define (venunjmina-rodavalsi-je cmene nastura porjahe porsumti)
  (match `(,cmene ,nastura ,porjahe ,porsumti)
    ((_  #t #t (or #t #f)) (lambda (ignore-rodavalsi) `(,secuxna-nastura)))
    ((_  #t #f (or #t #f)) (lambda (ignore-rodavalsi) secuxna-nastura))

                   ; cmene is ignored in this case.
    ((_  #f #t #t) (lambda (rodavalsi) (apply append rodavalsi)))
    ((_  #f #t #f) (lambda (rodavalsi) rodavalsi))

    ((#f #f #f #t) (lambda (rodavalsi)
                     (javni-rodavalsi-je (apply append rodavalsi))))
    ((#f #f #f #f) (lambda (rodavalsi)
                     (javni-rodavalsi-je rodavalsi)))

    ((_  #f #f #t) (lambda (rodavalsi)
                     (make-javni-valsi
                       cmene
                       (javni-rodavalsi-je (apply append rodavalsi)))))
    ((_  #f #f #f) (lambda (rodavalsi)
                     (make-javni-valsi
                       cmene
                       (javni-rodavalsi-je rodavalsi))))))



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
         (jalge       (if cmene (make-javni-valsi cmene val) val)))
    ; repeat acts like a porjahe flag, don't apply it twice.
    (if ni (repeat ni jalge)
           (if porjahe `(,jalge) jalge))))
