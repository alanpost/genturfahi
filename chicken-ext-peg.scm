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

(module genturfahi-peg
  (genturfahi-env

   genturfahi-peg
   genturfahi-peg-gerna

   ; samselpla
   samselpla-hash-table
   samselpla-hash-table*

   samselpla-cmene->symbol
   samselpla-cmene->symbol*

   samselpla-smuni
   samselpla-naselci
   samselpla-je
   samselpla-nastura-javni
   samselpla-pajavni-cmene
   samselpla-jonai
   samselpla-?
   samselpla-*
   samselpla-+
   samselpla-&
   samselpla-fanmo
   samselpla-!
   samselpla-cmene-sumti
   samselpla-selci-naselci
   samselpla-stura-lerfu-selci
   samselpla-lerfu-selci
   samselpla-lerfu-space
   samselpla-lerfu-linefeed
   samselpla-lerfu-newline
   samselpla-lerfu-return
   samselpla-lerfu-tab
   samselpla-stura-valsi-selci
   samselpla-valsi-selci
   samselpla-valsi-newline
   samselpla-valsi-linefeed
   samselpla-valsi-tab
   samselpla-valsi-backslash
   samselpla-valsi-single-quote
   samselpla-valsi-double-quote
   samselpla-valsi-lerfu
   samselpla-alnum
   samselpla-alpha
   samselpla-ascii
   samselpla-blank
   samselpla-cntrl
   samselpla-digit
   samselpla-graph
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
   samselpla-klesi-selci
   samselpla-denpabu
   samselpla-samselpla-xadni
   samselpla-samselpla-cmene
   samselpla-samselpla-balvi
   samselpla-samselpla-cabna
   samselpla-stura-empty-string
   samselpla-empty-string
   samselpla-empty-list)

(import chicken)
(import scheme)

(include "chicken-declare.scm")

;(require-extension utf8)

(require-extension srfi-1)
(require-extension srfi-13)
(require-extension srfi-14)
(require-extension srfi-69)
(require-extension ports)
;(require-library extras)
(require-library sandbox)
(require-library genturfahi)

(import srfi-1)          ; unzip2
(import srfi-13)         ; string-append, string-copy
(import srfi-14)         ; character set library
(import srfi-69)         ; basic hash tables
(import ports)           ; Chicken Scheme srfi-6 and port extensions
;(import extras)         ; pretty-print, for debugging
(import sandbox)
(import genturfahi)

(include "eval.scm")
(include "samselpla.scm")
(include "bootstrap.scm")
(include "peg.scm"))
