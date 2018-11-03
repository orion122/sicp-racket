#lang racket/base

(require rackunit)

(define a (list 1 2 3 4))

(define (reverse ls)
  (define (iter a acc)
    (if (null? a)
        acc
    (iter (cdr a) (cons (car a) acc))))
  (iter ls null))


(check-equal? (reverse a) (list 4 3 2 1))