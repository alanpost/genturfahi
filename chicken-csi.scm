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

;;
;; A Chicken Scheme wrapper csi, so genturfahi can be used and
;; tested from a dynamic environment on the command-line.
;;

(use utf8)
(use srfi-1)
(use srfi-9)
(use utf8-srfi-13) ; String Libraries
(use utf8-srfi-14) ; Character Classes
(use srfi-28)      ; Basic Format Strings
(use srfi-37)      ; args-fold
(use srfi-39)      ; parameter objects
(use srfi-69)      ; hash tables
(use extras)       ; format, pretty-print
(use moremacros)   ; for type-case
(use matchable)
(use ports)
(use stack)
(use sandbox)      ; safe-eval
(use test)         ; test environment.

(include "chicken-platform.scm")

; genturfahi (lib)
;
(include "lerfu-porsi.scm")
(include "javni-valsi.scm")
(include "secuxna.scm")
(include "nunjavni.scm")
(include "morji.scm")
(include "nunvalsi.scm")
(include "cfisisku.scm")
(include "junla.scm")
(include "genturfahi.scm")
(include "version.scm")

; genturfahi-peg
;
(include "eval.scm")
(include "samselpla.scm")
(include "bootstrap.scm")
(include "peg.scm")

; genturfahi (bin)
;
(include "license.scm")
(include "main-srfi-37.scm")

(main)
(exit (secuxna-exit-status))

; tests
;
(change-directory "tests")
(include "empty-string.scm")
(include "empty-list.scm")
(include "end-of-input.scm")
(include "lerfu.scm")
(include "dot.scm")
(include "dot-star.scm")
(include "dot-plus.scm")
(include "valsi.scm")
(include "string-escape.scm")
(include "optional.scm")
(include "zero-or-more.scm")
(include "one-or-more.scm")
(include "kuspe.scm")
(include "je.scm")
(include "je-quote.scm")
(include "jonai.scm")
(include "and-predicate.scm")
(include "not-predicate.scm")
(include "jonai-naselci.scm")
(include "samselpla.scm")
(include "samselpla-cabna.scm")
(include "lerfu-klesi.scm")
(include "mex.scm")
(include "utf8.scm")
(include "rrecursion.scm")
(include "lrecursion.scm")
(include "girzu.scm")
(include "toljuhi-girzu.scm")
(exit (secuxna-exit-status))
