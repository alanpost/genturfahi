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

   genturfahi-version
   genturfahi-version-major
   genturfahi-version-minor
   genturfahi-version-patch

   ; lerfu-porsi
   ;
   make-lerfu-porsi-string
   make-lerfu-porsi-port
   lerfu-porsi-string

   lerfu-porsi-fanmo?


   ; javni-valsi
   ;
   make-javni-valsi
   javni-valsi?
   javni-valsi-cme
   javni-valsi-val*

   javni-nastura?

   javni-valsi-val
   javni-rodavalsi
   javni-rodavalsi-je
   javni-rodavalsi-*
   javni-rodavalsi-samselpla

   javni-valsi->string


   ; nunjavni
   ;
   nunjavni-lerfu
   nunjavni-.*
   nunjavni-.+
   nunjavni-.kuspe
   nunjavni-.
   nunjavni-e
   nunjavni-nil
   nunjavni-fanmo
   nunjavni-valsi
   nunjavni-char-set-*
   nunjavni-char-set-+
   nunjavni-char-set-kuspe
   nunjavni-char-set
   nunjavni-*
   nunjavni-+
   nunjavni-kuspe
   nunjavni-?
   nunjavni-&
   nunjavni-!
   nunjavni-je
   nunjavni-jonai
   nunjavni-porjahe

   genturfahi-semorji
   genturfahi-tolmohi
   nunjavni-morji
   nunjavni-samselpla
   nunjavni-samselpla-cabna
   nunjavni-cmene
   nunjavni-nastura

   nunjavni-secuxna

   ; morji
   ;
   tolmohi-nunjavni
   nunmorji-nunjavni

   morji-nunjavni-lerfu
   morji-nunjavni-.*
   morji-nunjavni-.+
   morji-nunjavni-.kuspe
   morji-nunjavni-.
   morji-nunjavni-e
   morji-nunjavni-nil
   morji-nunjavni-fanmo
   morji-nunjavni-valsi
   morji-nunjavni-char-set-*
   morji-nunjavni-char-set-+
   morji-nunjavni-char-set-kuspe
   morji-nunjavni-char-set
   morji-nunjavni-*
   morji-nunjavni-+
   morji-nunjavni-kuspe
   morji-nunjavni-?
   morji-nunjavni-&
   morji-nunjavni-!
   morji-nunjavni-je
   morji-nunjavni-jonai
   morji-nunjavni-porjahe

   morji-nunjavni-samselpla
   morji-nunjavni-samselpla-cabna
   morji-nunjavni-cmene
   morji-nunjavni-nastura


   ; nunvalsi
   ;
   make-nunvalsi
   make-nunvalsi-predicate
   venunjmina-nunvalsi
   venunjmina-rodavalsi-*
   venunjmina-rodavalsi-je
   novejmina-nunvalsi


   ; cfiselsisku
   cfisisku-datni
   nunjavni-cfisisku

   ; junla
   junla-datni
   nunjavni-junla


   ; secuxna
   secuxna-start-production
   secuxna-define-name
   secuxna-define-toplevel
   secuxna-exit-status
   secuxna-debug-file
   secuxna-profile-file
   secuxna-debug
   secuxna-profile
   secuxna-no-memoize
   secuxna-sentinel
   secuxna-empty-string
   secuxna-empty-list
   secuxna-?-default
   secuxna-*-default
   secuxna-nonmatch-token
   secuxna-nastura)

(import chicken)
(import scheme)

(include "chicken-declare.scm")

(require-extension utf8)

(require-extension srfi-1)
;(require-extension srfi-6)         ; built-in
;(require-extension srfi-9)         ; built-in
(require-extension utf8-srfi-13)
(require-extension utf8-srfi-14)
(require-extension srfi-18)
;(require-extension srfi-28)        ; built-in
;(require-extension srfi-39)        ; built-in
(require-extension srfi-69)
;(require-extension srfi-95)
(require-extension data-structures)
(require-extension extras)
(require-extension matchable)
(require-extension ports)

(import utf8)
(import srfi-1)          ; filter
;(import srfi-6)          ; string ports
;(import srfi-9)          ; define-record-type
(import utf8-srfi-13)    ; string-copy
(import utf8-srfi-14)    ; character set library
(import srfi-18)         ; multi-threading support
;(import srfi-28)         ; basic format strings
;(import srfi-39)         ; parameter objects
(import srfi-69)         ; basic hash tables
;(import srfi-95)         ; sorting and merging
(import data-structures) ; should be srfi-95
(import extras)          ; format, pretty-print
(import matchable)
(import ports)           ; Chicken Scheme srfi-6 and port extensions

(include "chicken-platform.scm")

(include "lerfu-porsi.scm")
(include "javni-valsi.scm")
(include "secuxna.scm")
(include "nunjavni.scm")
(include "morji.scm")
(include "nunvalsi.scm")
(include "cfisisku.scm")
(include "junla.scm")
(include "genturfahi.scm")
(include "version.scm"))
