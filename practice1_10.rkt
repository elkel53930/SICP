#lang racket

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (f n) (A 0 n))
(define (g n) (A 1 n))
(define (h n) (A 2 n))
(define (k n) (* 5 n n))

(A 1 10)
(A 2 4)
(A 3 3)

#|
f => n * 2
g => n ^ 2
h => これは…なんだろ
(h 1) = 2 = 2 ^ 1
(h 2) = 4 = 2 ^ 2
(h 3) = 16 = 2 ^ 8
(h 4) = 65536 = 2 ^ 16

|#
