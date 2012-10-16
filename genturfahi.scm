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
;;; genturfa'i
;;;

;; parse the cfari javni in the gernu.  This is the only
;; (nun)javni that does not require a |mapti| or |namapti|
;; continuation, as it instead generates and returns |val|
;; in |javni-valsi| to the caller.
;;
(define (genturfahi javni #!key nonmatch-token)
  (define (cfisisku)
    (if (secuxna-debug)
        (call-with-output-file
          (secuxna-debug-file)
          (lambda (port)
            (pretty-print (cfisisku-datni) port)))))

  (define (junla)
    (if (secuxna-profile)
        (call-with-output-file
          (secuxna-profile-file)
          (lambda (port)
            (pretty-print (junla-datni) port)))))

  (define (mapti porsi valsi)
    ; always clear memoizations, which aren't valid when we get
    ; a new |porsi|.
    (genturfahi-tolmohi)

    (cfisisku) ; if debugging is enabled, output the debugging report.
    (junla)    ; if profiling is enabled, output the profiling report.

    (values (javni-valsi-val valsi)
            (lerfu-porsi-string porsi)))

  (define (namapti porsi)
    ; always clear memoizations, which aren't valid when we get
    ; a new |porsi|.
    (genturfahi-tolmohi)

    (cfisisku) ; if debugging is enabled, output the debugging report.
    (junla)    ; if profiling is enabled, output the profiling report.

    ; set the exit status
    (secuxna-exit-status 1)

    (values nonmatch-token (lerfu-porsi-string porsi)))

  (lambda (lefpoi)
    (let ((porsi (if (port? lefpoi)
                     (make-lerfu-porsi-port lefpoi)
                     (make-lerfu-porsi-string lefpoi))))
      (genturfahi-semorji (length porsi))
      (javni porsi mapti namapti))))

(define (genturfahi* javni #!key nonmatch-token)
  (let ((gerna (genturfahi javni nonmatch-token: nonmatch-token)))
    (lambda (lefpoi)
      (call-with-values
        (lambda () (gerna lefpoi))
        (lambda rodasumti rodasumti)))))
