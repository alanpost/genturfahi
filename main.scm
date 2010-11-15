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

(use srfi-28)    ; Basic Format Strings
(use srfi-37)    ; args-fold
(use srfi-39)    ; parameter objects
(use genturfahi)
(use extras)     ; pretty-print

(define status (make-parameter 0))

(define (cmene option name arg . seeds)
  (genturfahi-gerna (string->symbol arg)))

(define (help option name arg . seeds)
  (print "usage")
  (exit 0))

(define (version option name arg . seeds)
  (print (format "genturfa'i version ~a" genturfahi-version))
  (exit 0))

(define options
  (list (option '(#\c "cmene" "name")    #t #f cmene)
        (option '(#\h "sidju" "help")    #f #f help)
        (option '(#\v         "version") #f #f version)))

(define (usage option name args . seeds)
  (error (format "unrecognized option \"~a\"" name)))

(define (args name . seeds)
  (let ((jalge (call-with-input-file name (genturfahi-bootstrap))))
    (if (not jalge)
        (status 1))
    (pretty-print jalge)))


(define (main)
  (args-fold (cdr (argv)) options usage args)
  (exit (status)))

(main)
