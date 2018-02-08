(define balance 100)
(define (withdraw amount)
  (if (>= balance amount)
    (begin (set! balance (- balance amount))
           balance)
    "Insufficient funds"))


(print (withdraw 10))
(print (withdraw 20))
(print (withdraw 100))
