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
  secuxna-start-production)

(safe-environment-set!
  genturfahi-env
  'define-name
  secuxna-define-name)

(safe-environment-set!
  genturfahi-env
  'define-toplevel
  secuxna-define-toplevel)

(safe-environment-set!
  genturfahi-env
  'output-file
  (lambda (file)
    (let ((port (open-output-file file)))
      (lambda () port))))

(safe-environment-set!
  genturfahi-env
  'debug-file
  secuxna-debug-file)

(safe-environment-set!
  genturfahi-env
  'profile-file
  secuxna-profile-file)

(safe-environment-set!
  genturfahi-env
  'debug
  secuxna-debug)

(safe-environment-set!
  genturfahi-env
  'profile
  secuxna-profile)

(safe-environment-set!
  genturfahi-env
  'no-memoize
  secuxna-no-memoize)

(safe-environment-set!
  genturfahi-env
  'sentinel
  secuxna-sentinel)

(safe-environment-set!
  genturfahi-env
  'empty-list
  secuxna-empty-list)

(safe-environment-set!
  genturfahi-env
  'empty-string
  secuxna-empty-string)

(safe-environment-set!
  genturfahi-env
  'nonmatch-token
  secuxna-nonmatch-token)
