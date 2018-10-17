#lang racket/base

(require rackunit)

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ (+ (/ x (square guess)) (* 2 guess)) 3)))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) 0.00001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt3 x)
  (sqrt-iter 1.0 x))

(check-equal? (sqrt3 27) 3.0000146245848005)
(check-equal? (sqrt3 0.000027) 0.030012099121185312)