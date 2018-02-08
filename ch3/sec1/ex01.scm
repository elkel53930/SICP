(define (make-accumulator initial-value)
  (let ((value initial-value))
    (lambda (add)
      (begin (set! value (+ value add))
             value))))

(define A (make-accumulator 10))

(print (A 10))
(print (A 20))
