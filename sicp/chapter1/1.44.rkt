#lang racket/base

(require rackunit)
(require "1.43.rkt")

(define dx 0.0001)

(define (average a b c)
  (/ (+ a b c) 3))

(define (smooth f)
  (lambda (x) (average (f (- x dx)) (f x) (f (+ x dx)))))

(define (n-times-smooth f n)
  (repited (smooth f) n))

(define (square x)
  (* x x))

(check-equal? ((smooth square) 3) 9.000000006666667)
(check-equal? ((n-times-smooth square 2) 3) 81.00000012666668)