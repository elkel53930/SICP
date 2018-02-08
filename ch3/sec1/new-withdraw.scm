(define new-withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds"))))

(print (new-withdraw 10))
(print (new-withdraw 20))
(print (new-withdraw 100))
