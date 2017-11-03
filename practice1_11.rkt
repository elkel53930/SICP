#lang racket

(require racket/trace)

(define (f1 n)
  (if (< n 3)
      n
      (+ (f1 (- n 1))
         (* 2 (f1 (- n 2)))
         (* 3 (f1 (- n 3))))))

(trace f1)

(define (f2 n) (f2-iter 3 2 1 3 n))

(define (f2-iter n-1 n-2 n-3 counter max-count)
  (if (< max-count counter)
      n-1
      (f2-iter (+ n-1 (* 2 n-2) (* 3 n-3)) n-1 n-2 (+ counter 1) max-count)))

(f1 3)
