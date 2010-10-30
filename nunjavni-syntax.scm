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

;; naselci: delay-binding for a non-terminal to avoid recursive
;;          evaluation of the parser.
;;
(define-syntax nunjavni-naselci
  (syntax-rules ()
    ((nunjavni-nasalci javni)
       (lambda sumti (apply javni sumti)))))

(define-syntax nunjavni-samselpla
  (syntax-rules ()
     ; first expansion:
     ;
     ; expand the samselpla into a form containing the cmene
     ; and the samselpla.  create a copy of the parser that we
     ; won't mutate, and preserve the parser that we will
     ; mutate.
     ;
    ((nunjavni-samselpla samselpla javni)
     (nunjavni-samselpla-midju (() samselpla javni) javni))))

;; emit the final definition of samselpla, which includes all of
;; the cmene as lambda sumti.
;;
(define-syntax nunjavni-samselpla-fanmo
  (syntax-rules ()
    ((nunjavni-samselpla-fanmo rodacmene samselpla javni)
     (nunjavni-samselpla-mapti (lambda rodacmene samselpla) javni))))

(define-syntax nunjavni-samselpla-midju
  (syntax-rules (nunjavni-cmene)
     ; if we have no more element in the current branch or in
     ; the backtrace, we can emit the samselpla.
     ;
    ((nunjavni-samselpla-midju (rodacmene samselpla javni))
     (nunjavni-samselpla-fanmo rodacmene samselpla javni))

     ; if we've found a cmene expansion, use the cmene as a
     ; lambda sumti for our samselpla, and continue searching
     ; javni.
     ;
    ((nunjavni-samselpla-midju ((rodacmene ...) samselpla javni)
                           (nunjavni-cmene symbol next) rest ...)
     (nunjavni-samselpla-midju ((rodacmene ... symbol) samselpla javni)
                           next rest ...))

     ; pull apart any non-cmene forms and continue searching.
     ;
    ((nunjavni-samselpla-midju (rodacmene samselpla javni)
                           (form . next) rest ...)
     (nunjavni-samselpla-midju (rodacmene samselpla javni)
                           form next rest ...))

     ; if we've down to a single form, it wasn't a cmene.
     ; copy the backtrack list over to the working area.
     ;
    ((nunjavni-samselpla-midju (rodacmene samselpla javni) form next rest ...)
     (nunjavni-samselpla-midju (rodacmene samselpla javni) next rest ...))

    ((nunjavni-samselpla-midju (rodacmene samselpla javni) form rest ...)
     (nunjavni-samselpla-midju (rodacmene samselpla javni) rest ...))))

(define-syntax nunjavni-cmene
  (syntax-rules ()
    ((nunjavni-cmene cmene javni)
     (nunjavni-cmene* `cmene javni))))
