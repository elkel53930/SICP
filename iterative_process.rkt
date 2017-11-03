#lang racket

#| http://d.hatena.ne.jp/dorayakitaro/20090413/p1 |#

(require racket/trace)

; 階乗計算

(define (fact n) (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (= counter max-count)
      (* product counter)
      (fact-iter (* product counter) (+ counter 1) max-count)))

; ハノイの塔
; ↓再帰版
(define (hanoi-rec n)
  (if (= n 0)
      0
      (+ (* 2 (hanoi-rec (- n 1))) 1)))

; ↓反復版
(define (hanoi n) (hanoi-iter 0 1 n))
(define (hanoi-iter h counter max-count)
  (if (< max-count counter)
      h
      (hanoi-iter (+ (* 2 h) 1) (+ counter 1) max-count)))

(trace hanoi-iter)

; フィボナッチ数列
(define (fib n) (fib-iter 1 0 1 n))
(define (fib-iter n-1 n-2 counter max-count)
  (if (< max-count counter)
      n-1
      (fib-iter (+ n-1 n-2) n-1 (+ counter 1) max-count )))

(trace fib-iter)

; test
(fact 6)
