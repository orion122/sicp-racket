#lang racket/base

(require rackunit)

(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (fast-* a b)
  (cond ((= b 1) a)
        ((even? b) (* (double a) (halve b)))
        (else (+ a (* (double a) (halve (- b 1)))))))

(fast-* 3 5)