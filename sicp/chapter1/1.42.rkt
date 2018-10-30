#lang racket/base

(require rackunit)

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (inc x)
  (+ x 1))

(define (compose f1 f2 x)
  (f1 (f2 x)))

(check-equal? (compose inc cube 2) 9)
(check-equal? (compose square inc 6) 49)