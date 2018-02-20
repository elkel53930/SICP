(define prev 0)
(define (f x)
  (let((res prev))
    (begin
      (set! res prev)
      (set! prev x)
           res)))

(print (+ (f 0) (f 1)))
;(print (+ (f 1) (f 0)))
