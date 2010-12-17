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

;; the production used to begin parsing.  If not
;; specified, the first production parsed out of
;; the input buffer will be used.
;;
(define secuxna-start-production (make-parameter #f))

;; The name of the variable used to define the parser.
;;
(define secuxna-define-name  (make-parameter "gerna"))

;; Define all non-terminal tokens as top-level variables.
;;
;; By default, all non-terminal tokens will be kept inside
;; a let.
;;
(define secuxna-define-toplevel (make-parameter #f))

;; the exit status of the program
;;
(define secuxna-exit-status      (make-parameter 0))

(define secuxna-debug            (make-parameter #f))
(define secuxna-profile          (make-parameter #f))
(define secuxna-no-memoize       (make-parameter #f))

(define secuxna-sentinel         (make-parameter #\nul))
(define secuxna-empty-list       (make-parameter '()))
(define secuxna-empty-string     (make-parameter ""))
(define secuxna-nonmatch-token   (make-parameter #f))

;; The predicate symbol is not a parameter, as changing
;; it will affect the runtime parser.
;;
(define secuxna-nastura          (gensym "nastura-"))
