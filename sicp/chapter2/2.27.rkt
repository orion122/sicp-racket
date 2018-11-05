#lang racket/base

(require rackunit)

(define x (list (list 1 2) (list 3 4)))

(define (deep-reverse tree)
  (define (iter z acc)
    (if (null? z)
        acc
        (if (pair? (car z))
            (iter (cdr z) (cons (deep-reverse (car z)) acc))
            (iter (cdr z) (cons (car z) acc)))))
  (iter tree null))

(check-equal? (deep-reverse x) '((4 3) (2 1)))