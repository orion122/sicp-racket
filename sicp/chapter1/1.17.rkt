#lang racket/base

(require rackunit)

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (* a b)
  (cond ((= b 1) a)
        ((even? b) (* (double a) (halve b)))
        (else (+ a (* (double a) (halve (- b 1)))))))

(check-equal? (* 3 4) 12)
(check-equal? (* 3 5) 15)