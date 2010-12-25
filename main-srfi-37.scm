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
  (if arg (sexuna-debug-file arg))
  (secuxna-debug #t))

(define (help option name arg . seeds)
  (print #<<EOS
usage: genturfahi [-:?]
                  [-d | --debug]
                  [-h | --help]
                  [-i | --input-file NAME]
                  [-m | --no-memoize]
                  [-n | --define-name NAME]
                  [-o | --output-file NAME]
                  [-p | --profile]
                  [-s | --start-production NAME]
                  [-t | --define-toplevel]
                  [-v | --version]
                  [file]*
EOS
  )
  (exit 0))

(define (define-name option name arg . seeds)
  (secuxna-define-name arg))

(define (define-toplevel option name arg . seeds)
  (secuxna-define-toplevel #t))

(define (input-file option name arg . seeds)
  (call-with-input-file arg current-input-port))

(define (no-memoize option name arg . seeds)
  (secuxna-memoize #f))

(define (output-file option name arg . seeds)
  (call-with-output-file arg current-output-port))

(define (profile option name arg . seeds)
  (if arg (sexuna-profile-file arg))
  (secuxna-profile #t))

(define (start-production option name arg . seeds)
  (secuxna-start-production arg))

(define (version option name arg . seeds)
  (print (format "genturfa'i version ~a" genturfahi-version))
  (exit 0))

; handled by the Chicken runtime.
(define (runtime option name arg . seeds)
  '())

(define options
  (list (option '(#\d "debug")            #f #t debug)
        (option '(#\h "sidju" "help")     #f #f help)
        (option '(#\i "input-file")       #t #f input-file)
        (option '(#\m "no-memoize")       #f #f no-memoize)
        (option '(#\n "define-name")      #t #f define-name)
        (option '(#\o "output-file")      #t #f output-file)
        (option '(#\p "profile")          #f #t profile)
        (option '(#\s "start-production") #t #f start-production)
        (option '(#\t "define-toplevel")  #f #f define-toplevel)
        (option '(#\v "version")          #f #f version)
        (option '(#\:)                    #t #f runtime)))

(define (usage option name args . seeds)
  (error (format "unrecognized option \"~a\"" name)))

(define (peg name . seeds)
  (call-with-input-file name for-port))

(define (for-port port)
  (let ((jalge    (genturfahi-peg port))
        (tamgau   (secuxna-define-name))
        (toplevel (secuxna-define-toplevel))
        (port     (current-output-port)))
    (if (not jalge)
        (secuxna-exit-status 1))
    (display genturfahi-license port)
    (if toplevel
        (for-each (lambda (jalge) (pretty-print jalge port)) jalge)
        (pretty-print
          (if (pair? tamgau)
              `(define-values ,(map string->symbol tamgau) ,jalge)
              `(define ,(string->symbol tamgau) ,jalge))
          port))))

(define (main)
  (let ((args (cdr (argv))))
    (if (null? args)
        (for-port (current-input-port))
        (args-fold args options usage peg))))
