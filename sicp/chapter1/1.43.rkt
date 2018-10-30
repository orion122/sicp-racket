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

(define (repited func times)
  (if (= times 1)
      (lambda (x) (func x))
      (lambda (x) (compose (lambda (x) (func x)) (repited func (- times 1)) x))))

(check-equal? ((repited square 2) 5) 625)