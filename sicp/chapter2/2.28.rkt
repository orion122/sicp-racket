#lang racket/base

(require rackunit)

(define x (list (list 1 2) (list 3 4)))

(define (fringe tree)
  (define (iter x acc)
    (cond ((null? x) acc)
          ((pair? (car x)) (iter (cdr x) (append acc (fringe (car x)))))
          (else (iter (cdr x) (append acc (list (car x)))))))
  (iter tree null))

(check-equal? (fringe x) '(1 2 3 4))
(check-equal? (fringe (list x x)) '(1 2 3 4 1 2 3 4))