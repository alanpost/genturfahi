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
;;; profile - parser profiling
;;;

(define-record-type javni-merli
  (make-javni-merli temci mapti namapti)
  javni-merli?
  (temci   javni-merli-temci   set-javni-merli-temci!)
  (mapti   javni-merli-mapti   set-javni-merli-mapti!)
  (namapti javni-merli-namapti set-javni-merli-namapti!))

(define-values (junla-datni nunjavni-junla)
  (let ((rodamerli (make-hash-table string=?)))
    (values
      (lambda ()
        (define (hash->? x y)
          (javni-merli->? (cdr x) (cdr y)))

        ; we want reverse sorting, use greater-than.
        (define (javni-merli->? x y)
          (> (javni-merli-temci x) (javni-merli-temci y)))

        (define (datni cmene javni-merli)
          (let ((temci   (javni-merli-temci   javni-merli))
                (mapti   (javni-merli-mapti   javni-merli))
                (namapti (javni-merli-namapti javni-merli)))

            ; output an association list of non-terminal name
            ; and that non-terminal's profile measurment, which
            ; itself is an association list of measurements to
            ; values.
            ;
            `(,cmene (("temci"   ,temci)
                      ("mapti"   ,mapti)
                      ("namapti" ,namapti)))))

        (map (lambda (x) (datni (car x) (cdr x)))
             (sort! (hash-table->alist rodamerli) hash->?)))

      (lambda (cmene javni)
        (let ((javni-merli (make-javni-merli 0 0 0)))
          (define (javni-junla porsi mapti namapti #!rest cmene-sumti)
                  ; start the timer
            (let ((cfari (time->seconds (current-time))))

              (define (sisti)
                      ; stop the timer
                (let ((fanmo (time->seconds (current-time)))
                      (temci (javni-merli-temci javni-merli)))
                  (set-javni-merli-temci! javni-merli
                                          (+ temci (- fanmo cfari)))))

              (define (mapti-junla porsi nunvalsi)
                (sisti)
                (let ((mapti-klani (javni-merli-mapti javni-merli)))
                  (set-javni-merli-mapti! javni-merli (fx+ 1 mapti-klani)))
                (mapti porsi nunvalsi))

              (define (namapti-junla porsi)
                (sisti)
                (let ((namapti-klani (javni-merli-namapti javni-merli)))
                  (set-javni-merli-namapti! javni-merli (fx+ 1 namapti-klani)))
                (namapti porsi))

              (apply javni porsi mapti-junla namapti-junla cmene-sumti)))

            ; register our profile metrics for the profile report.
            (hash-table-set! rodamerli cmene javni-merli)

            javni-junla)))))
