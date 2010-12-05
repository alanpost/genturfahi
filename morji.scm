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
;;; nunjavni memoization.
;;;
;;; This code detects cases like |(nunjavni-? canlu)|, which would
;;; generate a new javni each time it is called, and instead returns
;;; the same generated result when the input matches.
;;;

(define-values (tolmohi-nunjavni nunmorji-nunjavni)
  (let ((rodamorji '()))
    (values
      ;; clear the memoization cache.  This is called after
      ;; constructing the parser to free up memory.
      ;;
      (lambda ()
        (for-each (lambda (x) (x)) rodamorji)
        '())

      ;; return a memoizing version for each nunjavni.  There
      ;; isn't a good reason why I return one per rule instead
      ;; of wrapping the entire call, rule and all, in a
      ;; memoization routine.
      ;;
      (lambda (nunjavni)
        (let ((morji (make-hash-table equal?)))
          (define (morji-nunjavni . sumti)
            (hash-table-ref morji
                            sumti
                            (lambda ()
                              (let ((javni (apply nunjavni sumti)))
                                (hash-table-set! morji sumti javni)
                                javni))))

          ;; register our cache with the global cache so
          ;; we can delete our memoization rules when we
          ;; no longer need them.
          ;;
          (set! rodamorji
            (cons (lambda () (hash-table-clear! morji))
                  rodamorji))

          morji-nunjavni)))))
 

;; Create memoizing versions of all of the operators.
;;
(define morji-nunjavni-lerfu      (nunmorji-nunjavni nunjavni-lerfu))
(define morji-nunjavni-.          (nunmorji-nunjavni nunjavni-.))
(define morji-nunjavni-e          (nunmorji-nunjavni nunjavni-e))
(define morji-nunjavni-fanmo      (nunmorji-nunjavni nunjavni-fanmo))
(define morji-nunjavni-valsi      (nunmorji-nunjavni nunjavni-valsi))
(define morji-nunjavni-char-set-* (nunmorji-nunjavni nunjavni-char-set-*))
(define morji-nunjavni-char-set-+ (nunmorji-nunjavni nunjavni-char-set-+))
(define morji-nunjavni-char-set   (nunmorji-nunjavni nunjavni-char-set))
(define morji-nunjavni-*          (nunmorji-nunjavni nunjavni-*))
(define morji-nunjavni-+          (nunmorji-nunjavni nunjavni-+))
(define morji-nunjavni-?          (nunmorji-nunjavni nunjavni-?))
(define morji-nunjavni-&          (nunmorji-nunjavni nunjavni-&))
(define morji-nunjavni-!          (nunmorji-nunjavni nunjavni-!))
(define morji-nunjavni-je         (nunmorji-nunjavni nunjavni-je))
(define morji-nunjavni-jonai      (nunmorji-nunjavni nunjavni-jonai))

(define morji-nunjavni-samselpla  (nunmorji-nunjavni nunjavni-samselpla))
(define morji-nunjavni-cmene      (nunmorji-nunjavni nunjavni-cmene))
