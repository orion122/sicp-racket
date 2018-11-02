#lang racket/base

(require rackunit)

(define (cons a b) (* (expt 2 a) (expt 3 b)))

(define (raised-part x y)
  (if (= (remainder x y) 0)
      (raised-part (quotient x y) y)
      x))

(define (car z)
  (/ (log (raised-part z 3))
     (log 2)))

(define (cdr z)
  (/ (log (raised-part z 2))
     (log 3)))

; 2^4 * 3^3 = 432
(check-equal? (car 432) 4.0)
(check-equal? (cdr 432) 3.0)