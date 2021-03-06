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
;; A Chicken Scheme wrapper for creating the genturfahi-peg package.
;; This package includes the PEG file parser written on top of the
;; runtime library, genturfahi (in the file chicken-ext.scm)
;;

(module genturfahi-peg
  (genturfahi-env

   genturfahi-peg
   genturfahi-peg-gerna

   ; samselpla
   samselpla-hash-table
   samselpla-hash-table*

   samselpla-cmene->symbol
   samselpla-cmene->symbol*

   samselpla-namorji
   samselpla-namorji?

   samselpla-smuni
   samselpla-naselci
   samselpla-je
   samselpla-nastura-javni
   samselpla-pajavni-cmene
   samselpla-jonai
   samselpla-.*
   samselpla-.+
   samselpla-.kuspe
   samselpla-?
   samselpla-*
   samselpla-+
   samselpla-kuspe
   samselpla-&
   samselpla-fanmo
   samselpla-!
   samselpla-cmene-sumti
   samselpla-selci-naselci
   samselpla-stura-lerfu-selci
   samselpla-lerfu-selci
   samselpla-lerfu-space
   samselpla-lerfu-nul
   samselpla-lerfu-linefeed
   samselpla-lerfu-newline
   samselpla-lerfu-return
   samselpla-lerfu-tab
   samselpla-lerfu-page
   samselpla-stura-valsi-selci
   samselpla-valsi-selci
   samselpla-valsi-nul
   samselpla-valsi-newline
   samselpla-valsi-return
   samselpla-valsi-tab
   samselpla-valsi-page
   samselpla-valsi-backslash
   samselpla-valsi-single-quote
   samselpla-valsi-left-single-quote
   samselpla-valsi-right-single-quote
   samselpla-valsi-double-quote
   samselpla-valsi-left-double-quote
   samselpla-valsi-right-double-quote
   samselpla-valsi-lerfu
   samselpla-alnum
   samselpla-alpha
   samselpla-ascii
   samselpla-blank
   samselpla-cntrl
   samselpla-digit
   samselpla-graph
   samselpla-jbolehu
   samselpla-jbocahu
   samselpla-lower
   samselpla-odigit
   samselpla-print
   samselpla-punct
   samselpla-space
   samselpla-upper
   samselpla-xdigit
   samselpla-^alnum
   samselpla-^alpha
   samselpla-^ascii
   samselpla-^blank
   samselpla-^cntrl
   samselpla-^digit
   samselpla-^graph
   samselpla-^lower
   samselpla-^odigit
   samselpla-^print
   samselpla-^punct
   samselpla-^space
   samselpla-^upper
   samselpla-^xdigit
   samselpla-klesi-nul
   samselpla-klesi-newline
   samselpla-klesi-return
   samselpla-klesi-tab
   samselpla-klesi-page
   samselpla-klesi-lbracket
   samselpla-klesi-rbracket
   samselpla-klesi-backslash
   samselpla-klesi-selci
   samselpla-klesi-selci-*
   samselpla-klesi-selci-+
   samselpla-klesi-selci-kuspe
   samselpla-denpabu
   samselpla-samselpla-xadni
   samselpla-samselpla-cmene
   samselpla-samselpla-balvi
   samselpla-samselpla-cabna
   samselpla-stura-empty-string
   samselpla-empty-string
   samselpla-empty-list
   samselpla-girzu-javni)

(import chicken)
(import scheme)

(include "chicken-declare.scm")

(require-extension utf8)

(require-extension srfi-1)
(require-extension utf8-srfi-13)
(require-extension utf8-srfi-14)
(require-extension srfi-69)
(require-extension ports)
;(require-library extras)
(require-library moremacros)
(require-library matchable)
(require-library sandbox)
(require-library genturfahi)

(import utf8)
(import srfi-1)          ; unzip2
(import utf8-srfi-13)    ; string-append, string-copy
(import utf8-srfi-14)    ; character set library
(import srfi-69)         ; basic hash tables
(import ports)           ; Chicken Scheme srfi-6 and port extensions
;(import extras)         ; pretty-print, for debugging
(import moremacros)      ; type-case
(import matchable)
(import sandbox)
(import genturfahi)

(include "eval.scm")
(include "samselpla.scm")
(include "bootstrap.scm")
(include "peg.scm"))
