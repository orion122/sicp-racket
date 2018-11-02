#lang racket/base

(require rackunit)

(define (make-interval a b) (cons a b))

(define (upper-bound interval)
  (max (car interval)
       (cdr interval)))

(define (lower-bound interval)
  (min (car interval)
       (cdr interval)))

(check-equal? (upper-bound (make-interval 7 2)) 7)
(check-equal? (lower-bound (make-interval 7 2)) 2)

(provide (all-defined-out))