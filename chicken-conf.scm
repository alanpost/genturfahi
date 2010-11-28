(define (dynld-name fn)		
  (make-pathname #f fn ##sys#load-dynamic-extension))	

(define genturfahi-cscflags  `(-O2 -d1))
