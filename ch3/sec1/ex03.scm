(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch pass m)
    (if (eq? pass password)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request : MAKE-ACCOUNT"
                         m)))
      (lambda (arg) "Insufficient password")))
  dispatch)

(define acc (make-account 100 'pass))
(print ((acc 'pass 'withdraw) 50))
(print ((acc 'passd 'deposit) 30))
(print ((acc 'pass 'withdraw) 100))
