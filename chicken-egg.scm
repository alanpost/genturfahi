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

(module genturfahi
  (genturfahi
   genturfahi*

   genturfahi-env

   genturfahi-peg
   genturfahi-peg-gerna

   genturfahi-version
   genturfahi-version-major
   genturfahi-version-minor
   genturfahi-version-patch

   ; lerfu-porsi
   ;
   make-lerfu-porsi
   make-lerfu-porsi-string
   make-lerfu-porsi-port
   make-lerfu-porsi-pabalvi-lerfu
   make-lerfu-porsi-pabalvi-valsi
   lerfu-porsi?
   lerfu-porsi-zva
   lerfu-porsi-poi
   lerfu-porsi-string

   lerfu-porsi->string

   lerfu-porsi-lerfu
   lerfu-porsi-fanmo?


   ; javni-valsi
   ;
   make-javni-valsi
   javni-valsi?
   javni-valsi-cme
   javni-valsi-val

   javni-nunvalsi-val
   javni-rodavalsi-val

   javni-valsi->string


   ; nunvalsi
   ;
   vejmina-nunvalsi

   ; nunjavni
   ;
   nunjavni-lerfu
   nunjavni-.
   nunjavni-e
   nunjavni-fanmo
   nunjavni-valsi
   nunjavni-char-set-*
   nunjavni-char-set-+
   nunjavni-char-set
   nunjavni-*
   nunjavni-+
   nunjavni-?
   nunjavni-&
   nunjavni-!
   nunjavni-je
   nunjavni-jonai

   genturfahi-tolmohi
   nunjavni-morji
   nunjavni-samselpla
   nunjavni-cmene

   ; morji
   ;
   tolmohi-nunjavni
   nunmorji-nunjavni

   morji-nunjavni-lerfu
   morji-nunjavni-.
   morji-nunjavni-e
   morji-nunjavni-fanmo
   morji-nunjavni-valsi
   morji-nunjavni-char-set-*
   morji-nunjavni-char-set-+
   morji-nunjavni-char-set
   morji-nunjavni-*
   morji-nunjavni-+
   morji-nunjavni-?
   morji-nunjavni-&
   morji-nunjavni-!
   morji-nunjavni-je
   morji-nunjavni-jonai

   morji-nunjavni-samselpla
   morji-nunjavni-cmene


   ; nunvalsi
   ;
   venunjmina-nunvalsi
   vejmina-nunvalsi
   vejmina-nunvalsi-nacmene

   venunjmina-rodanunvalsi
   vejmina-rodanunvalsi
   vejmina-rodanunvalsi-nacmene


   ; samselpla
   samselpla-gerna
   samselpla-smuni
   samselpla-naselci
   samselpla-je
   samselpla-pajavni-cmene
   samselpla-jonai-je
   samselpla-jonai
   samselpla-?
   samselpla-*
   samselpla-+
   samselpla-&
   samselpla-fanmo
   samselpla-!
   samselpla-cmene-sumti
   samselpla-selci-naselci
   samselpla-lerfu-selci
   samselpla-lerfu-space
   samselpla-lerfu-return
   samselpla-lerfu-linefeed
   samselpla-lerfu-newline
   samselpla-lerfu-return
   samselpla-lerfu-tab
   samselpla-valsi-selci
   samselpla-valsi-newline
   samselpla-valsi-linefeed
   samselpla-valsi-tab
   samselpla-valsi-backslash
   samselpla-valsi-single-quote
   samselpla-valsi-double-quote
   samselpla-valsi-lerfu
   samselpla-klesi-selci
   samselpla-denpabu
   samselpla-samselpla
   samselpla-samselpla-lerfu
   samselpla-girzu-javni
   samselpla-canlu

   ; secuxna
   secuxna-start-production
   secuxna-definition-name
   secuxna-exit-status
   secuxna-debug
   secuxna-profile
   secuxna-memoize
   secuxna-sentinel
   secuxna-empty-string
   secuxna-nonmatch-token)

(import chicken)
(import scheme)

(include "chicken-declare.scm")

;(require-extension utf8)

(require-extension srfi-1)
;(require-extension srfi-6)         ; built-in
;(require-extension srfi-9)         ; built-in
(require-extension srfi-13)
(require-extension srfi-14)
;(require-extension srfi-28)        ; built-in
;(require-extension srfi-39)        ; built-in
;(require-extension srfi-61)        ; built-in
(require-extension extras)
(require-extension ports)
(require-extension data-structures)
(require-library sandbox)

(import srfi-1)          ; filter
;(import srfi-6)          ; string ports
;(import srfi-9)          ; define-record-type
(import srfi-13)         ; string-copy
(import srfi-14)         ; character set library
;(import srfi-28)         ; basic format strings
;(import srfi-39)         ; parameter objects
;(import srfi-69)         ; A more general cond clause
(import extras)          ; format, pretty-print
(import ports)           ; Chicken Scheme srfi-6 and port extensions
(import data-structures) ; flatten
(import sandbox)

(include "chicken-platform.scm")

(include "lerfu-porsi.scm")
(include "javni-valsi.scm")
(include "secuxna.scm")
(include "nunjavni.scm")
(include "morji.scm")
(include "nunvalsi.scm")
(include "genturfahi.scm")
(include "eval.scm")
(include "samselpla.scm")
(include "bootstrap.scm")
(include "peg.scm")
(include "version.scm"))
