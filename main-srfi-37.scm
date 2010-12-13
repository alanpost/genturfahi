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

(define (debug option name arg . seeds)
  (secuxna-debug #t))

(define (help option name arg . seeds)
  (print #<<EOS
usage: genturfahi [-dhmpv] [-help] [-version]
                  [-debug] [-no-memoize] [-profile]
                  [file]
EOS
  )
  (exit 0))

(define (define-name option name arg . seeds)
  (secuxna-define-name arg))

(define (define-toplevel option name arg . seeds)
  (secuxna-define-toplevel #t))

(define (no-memoize option name arg . seeds)
  (secuxna-memoize #f))

(define (profile option name arg . seeds)
  (secuxna-profile #t))

(define (start-production option name arg . seeds)
  (secuxna-start-production arg))

(define (version option name arg . seeds)
  (print (format "genturfa'i version ~a" genturfahi-version))
  (exit 0))

(define options
  (list (option '(#\d "debug")            #f         #f debug)
        (option '(#\h "sidju" "help")     #f         #f help)
        (option '(#\m "no-memoize")       #f         #f no-memoize)
        (option '(#\n "define-name")      #:required #f define-name)
        (option '(#\p "profile")          #f         #f profile)
        (option '(#\s "start-production") #:required #f start-production)
        (option '(#\t "define-toplevel")  #f         #f define-toplevel)
        (option '(#\v "version")          #f         #f version)))

(define (usage option name args . seeds)
  (error (format "unrecognized option \"~a\"" name)))

(define (args name . seeds)
  (let ((jalge    (call-with-input-file name genturfahi-peg))
        (tamgau   (secuxna-define-name))
        (toplevel (secuxna-define-toplevel)))
    (if (not jalge)
        (secuxna-exit-status 1))
    (display genturfahi-license)
    (if toplevel
        (for-each pretty-print jalge)
        (if (pair? tamgau)
            (pretty-print `(define-values ,(map string->symbol tamgau) ,jalge))
            (pretty-print `(define ,(string->symbol tamgau) ,jalge))))))

(define (main)
  (args-fold (cdr (argv)) options usage args))
