#lang racket/base

(require rackunit)

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

; old version of 'good-enough?'
; (define (good-enough? guess x)
;   (< (abs (- (square guess) x)) 0.001))

; optimized version
(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(check-equal? (sqrt 9) 3.00009155413138)
(check-equal? (sqrt 0.0004) 0.02024031288207058)