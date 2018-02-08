(define (myCons x y)
  (define (diapatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "error"))))
  dispatch)

(define (myCar z) (z 0))
(define (myCar z) (z 1))

(myCar (myCons 1 2))
