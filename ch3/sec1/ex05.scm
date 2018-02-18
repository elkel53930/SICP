(use data.random)

(define (random range)
  (* (/. (uint32s) (expt 2 32)) range))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (estimate-integral trials area)
  (* area (monte-carlo trials predicate-of-circle)))

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

(define (predicate-of-circle)
  (let ((random-x (random-in-range x-low x-high))
        (random-y (random-in-range y-low y-high)))
    (<= (+ (expt (- random-x center-x) 2) (expt (- random-y center-y) 2) ) (expt radius 2))))

(define center-x 5)
(define center-y 7)
(define radius 3)
(define x-low 2)
(define y-low 4)
(define x-high 8)
(define y-high 10)
(define area (* (- x-high x-low) (- y-high y-low)))

(print (estimate-integral 10000 area))
