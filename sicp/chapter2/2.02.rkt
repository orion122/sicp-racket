#lang racket/base

(require rackunit)

(define (make-segment a b) (cons a b))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (average x y) (/ (+ x y) 2))

(define (midpoint-segment segment)
  (make-point (average (x-point (start-segment segment))
                       (x-point (end-segment segment)))
              (average (y-point (start-segment segment))
                       (y-point (end-segment segment)))))

(define test-segment (make-segment (make-point -2 -5) (make-point 2 3)))

(check-equal? (midpoint-segment test-segment) (cons 0 -1))
