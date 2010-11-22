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
   genturfahi-peg
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
   nunjavni-re
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

   ; nunjavni syntax
   nunjavni-naselci


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
   samselpla-selci-naselci
   samselpla-lerfu-selci
   samselpla-valsi-selci
   samselpla-klesi-selci
   samselpla-denpabu
   samselpla-cfari
   samselpla-canlu
   samselpla-*
   samselpla-+
   samselpla-?
   samselpla-&
   samselpla-!
   samselpla-je
   samselpla-jonai

   ; secuxna
   genturfahi-status)

(import chicken)
(import scheme)

(require-extension utf8)

(require-extension srfi-1)
;(require-extension srfi-6)         ; built-in
;(require-extension srfi-9)         ; built-in
(require-extension srfi-13)
;(require-extension srfi-28)        ; built-in
;(require-extension srfi-39)        ; built-in
;(require-extension srfi-61)        ; built-in
;(require-extension extras)         ; only needed when I'm debugging
(require-extension ports)
(require-extension data-structures)
(require-library regex)

(import srfi-1)          ; filter
;(import srfi-6)          ; string ports
;(import srfi-9)          ; define-record-type
(import srfi-13)         ; string-copy
;(import srfi-28)         ; basic format strings
;(import srfi-39)         ; parameter objects
;(import srfi-69)         ; A more general cond clause
;(import extras)         ; pretty-print (only needed when I'm debugging)
(import ports)           ; Chicken Scheme srfi-6 and port extensions
(import data-structures) ; flatten
(import regex)           ; Irregular expressions

;(declare (unsafe))
;(declare fixnum)

(include "version.scm")
(include "lerfu-porsi.scm")
(include "javni-valsi.scm")
(include "nunjavni.scm")
(include "nunjavni-syntax.scm")
(include "nunvalsi.scm")
(include "genturfahi.scm")
(include "secuxna.scm")
(include "samselpla.scm")
(include "bootstrap.scm"))
