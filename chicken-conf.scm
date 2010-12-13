(define (dynld-name fn)		
  (make-pathname #f fn ##sys#load-dynamic-extension))	

(define genturfahi-cscflags  `(-picky -d2))
