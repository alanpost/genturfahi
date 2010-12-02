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
;;; This environment is used to evaluate header code in .peg files. 
;;;
(define genturfahi-env
  (make-safe-environment parent: default-safe-environment))

;; extend the regular safe environment with genturfa'i parameters.
;;
;; for the parameters that affect the parser generator, set the
;; values immediately.  For parameters that apply to the parser
;; return an expression that will be included in the output.
;;
(safe-environment-set!
  genturfahi-env
  'start-production
  (lambda rodasumti (apply secuxna-start-production rodasumti) '()))

(safe-environment-set!
  genturfahi-env
  'definition-name
  (lambda rodasumti (apply secuxna-definition-name rodasumti) '()))

(safe-environment-set!
  genturfahi-env
  'debug
  (lambda rodasumti (apply secuxna-debug rodasumti) '()))

(safe-environment-set!
  genturfahi-env
  'profile
  (lambda rodasumti (apply secuxna-profile rodasumti) '()))

(safe-environment-set!
  genturfahi-env
  'memoize
  (lambda rodasumti (apply secuxna-memoize rodasumti) '()))

(safe-environment-set!
  genturfahi-env
  'sentinel
  (lambda rodasumti `(secuxna-sentinel ,@rodasumti)))

(safe-environment-set!
  genturfahi-env
  'empty-string
  (lambda rodasumti `(secuxna-empty-string ,@rodasumti)))

(safe-environment-set!
  genturfahi-env
  'nonmatch-token
  (lambda rodasumti `(secuxna-nonmatch-token ,@rodasumti)))
