#lang racket
(provide (all-defined-out))

(define (pow1 x y)
  (if (= y 0)
      1
      (* x (pow1 x (- y 1))))
  )

(define (map f xs)
  (if (null? xs)
       null
       (cons (f (car xs)) (map f (cdr xs)))
       ))

(define (filter f xs)
  (if (null? xs)
       null
      (if (f (car xs))
           (cons (car xs) (filter f (cdr xs)))
           (filter f (cdr xs)))))

           
(filter (lambda x (if (= x 1) 'true 'false)) '(3 4 1 2 1 3 1))

(define (higher x y)
  (if (> x y)
      'true
      'false))