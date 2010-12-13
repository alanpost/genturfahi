(use srfi-1)
(use srfi-9)
(use srfi-13)    ; String Libraries
(use srfi-14)    ; Character Classes
(use srfi-28)    ; Basic Format Strings
(use srfi-37)    ; args-fold
(use srfi-39)    ; parameter objects
(use srfi-69)    ; hash tables
(use extras)     ; format, pretty-print
(use sandbox)    ; safe-eval

(include "chicken-platform.scm")

; genturfahi (lib)
;
(include "lerfu-porsi.scm")
(include "javni-valsi.scm")
(include "secuxna.scm")
(include "nunjavni.scm")
(include "morji.scm")
(include "nunvalsi.scm")
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
