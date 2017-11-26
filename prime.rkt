#lang racket

(define (square x) (* x x))

(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((devides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (devides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(prime? 13)
(prime? 10)

(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)
