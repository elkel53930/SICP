(use data.random)

(define (rand) (int32s))

(define (abs x)
  (if (< x 0)
      (- 0 x)
      x))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (estimatep-pi trials)
  (sqrt (/. 6 (monte-carlo trials cesaro-test))))

(define (cesaro-test)
  (= (abs (gcd (rand) (rand))) 1))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
            (/. trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1)
                 (+ trials-passed 1)))
          (else
            (iter (- trials-remaining 1)
                  trials-passed))))
  (iter trials 0))

(print (estimatep-pi 100000))
