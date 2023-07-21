
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

(define (sequence low high stride)
  (if (> low high)
      null
      (cons low (sequence (+ low stride) high stride))))

(define (string-append-map xs suffix)
  (map (lambda (s) (string-append s suffix)) xs))

(define (list-nth-mod xs n)
  (if (< n 0)
      (error "list-nth-mod: negative number")
      (if (null? xs)
          (error "list-nth-mod: empty list")
          (car (list-tail xs (remainder n (length xs)))))))

(define (stream-for-n-steps s n)
  (if (< n 1)
      null
      (cons (car(s)) (stream-for-n-steps (cdr(s)) (- n 1)))))

(define funny-number-stream (letrec ([f (lambda (x)
                                          (if (= (remainder x 5) 0)
                                          (cons (* x -1) (lambda () (f (+ x 1))))
                                          (cons x (lambda () (f (+ x 1))))))])
                              (lambda () (f 1))))

(define dan-then-dog (letrec (
                              [dan (lambda () (cons "dan.jpg" dog))]
                              [dog (lambda () (cons "dog.jpg" dan))])
                       (lambda () (dan))))

(define (stream-add-zero s)
  (lambda () (cons (cons 0 (car (s))) (stream-add-zero (cdr(s))))))

(define (cycle-lists xs ys)
  (letrec (
           [aux (lambda (n) (cons (cons (list-nth-mod xs n) (list-nth-mod ys n)) (lambda () (aux(+ n 1)))))])
    (lambda () (aux 0))))

;non skippa i non pairs
(define (vector-assoc v vec)
  (letrec (
           [aux (lambda (n) (if (>= n (vector-length vec))
                                #f
                                (if (equal? (car(vector-ref vec n)) v)
                                    (vector-ref vec n)
                                    (aux (+ 1 n)))))])
  (aux 0)))

;ci sarebbe da aggiungere l'effetto pacman alla pos
(define (cached-assoc xs n)
  (letrec ([cache (make-vector n (cons #f #f))]
           [pos 0]
           [aux (lambda (v)
                  (let ([v-assoc (vector-assoc v cache)])
                  (if v-assoc
                      v-assoc
                      (begin
                        (let ([l-assoc (assoc v xs)])
                        (if l-assoc
                            (begin (vector-set! cache pos (cons v pos)) (set! pos (+ pos 1)) l-assoc)
                            #f))))))])
    aux 
           ))