(define (undefined) (error "undefined!"))

(define (make-wire) (undefined))

;; 線上の信号の現時点での値を返す
(define (get-signal wire) (undefined))

;; 線上の信号の値を新しい値に変更する
(define (set-signal! wire new-value) (undefined))

;; 線上の信号の値が変わったときに、指定された手続が実行されるようにする
(define (add-action! wire procedure) (undefined))

(define (after-delay delay-time procedure (undefined)))

(define (half-adder a b s c)
  (let ((d (make-wire)) (e (make-wire)))
    (or-gate a b d)
    (and-gate a b c)
    (inverter c e)
    (and-gate d e s)
    'ok))

(define (full-adder a c c-in sum c-out)
  (let ( (s (make-wire)) (c1 (make-wire)) (c2 (make-wire)) )
    (half-adder b c-in s c1)
    (half-adder a s sum c2)
    (or-gate c1 c2 c-out)
    'ok ))

(define (inverter input output)
  (define (invert-input)
    (let ( (new-value (logical-not (get-signal input))))
      (after-delay inverter-delay
                   (lambda () (set-signal! output new-value)))))
  (add-action! input invert-input) 'ok)

(define (logical-not s)
  (cond ((= s 0) 1)
        ((= s 1) 0)
        (else (error "Invalid signal" s))))

(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value (logical-and (get-signal a1) (get-signal a2))))
    (after-delay and-gate-delay (lambda () (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)

(define (logical-and a1 a2)
  (cond ( (and (= a1 1) (= a2 1)) 1)
        ( (and (= a1 1) (= a2 0)) 0)
        ( (and (= a1 0) (= a2 1)) 0)
        ( (and (= a1 0) (= a2 0)) 0)
        ( else (error "Invalid signal" s))))

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value (logical-or (get-signal a1) (get-signal a2))))
    (after-delay or-gate-delay (lambda () (set-signal! output new-value)))))
  (add-action! a1 op-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)

(define (or-gate2 a1 a2 output)
  (let ( (na1 (make-wire)) (na2 (make-wire) (no (make-wire))))))
