(use data.random)

(define (random range)
  (* (/. (uint32s) (expt 2 32)) range))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (estimate-integral trials x-low y-low x-high y-high pred)
  (let ((total-area (* (- x-high x-low) (- y-high y-low))))
  (* total-area (* (monte-carlo trials pred)))))

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

(define (predicate-of-circle x y r x-low y-low x-high y-high)
  (let ((random-x (random-in-range x-low x-high))
        (random-y (random-in-range y-low y-high)))
    (<= (+ (expt (- x random-x) 2) (expt (- y random-y) 2) ) (expt r 2))))

(define (pred2)
  (let ((random-x (random-in-range x-low x-high))
        (random-y (random-in-range y-low y-high)))
  (lambda () (<= (+ (expt (- 5 random-x) 2) (expt (- 7 random-y) 2) ) (expt 3 2)) )))


(define center-x 5)
(define center-y 7)
(define radius 3)
(define x-low 2)
(define y-low 4)
(define x-high 8)
(define y-high 10)

(define predicate (predicate-of-circle center-x center-y radius x-low y-low x-high y-high))

  (print (monte-carlo 100 pred2))

;(print (estimate-integral 200 x-low y-low x-high y-high predicate))
