#lang racket
(define (abs x) (if (<  x 0) (- x) x))

(define (cube x) (* x x x))

(define (cubic-root-iter guess x)
  (if (good-enough? guess x)
       guess
       (cubic-root-iter (improve guess x) x)))

(define (improve guess x)
  (/ (+ (/ x
           (* guess guess))
        (* 2 guess))
     3 ))

(define (good-enough? guess x)
  (< (abs(- (cube guess) x)) 0.001))

(define (cubic-root x)
  (cubic-root-iter 1.0 x))

(cubic-root 27)
