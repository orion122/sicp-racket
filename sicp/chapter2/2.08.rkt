#lang racket/base

(require rackunit)
(require "2.07.rkt")

(define (sub-interval x y)
  (make-interval (- (lower-bound x)
                    (upper-bound y))
                 (- (upper-bound x)
                    (lower-bound y))))

(define a (make-interval 7 10))
(define b (make-interval 2 3))


(check-equal? (sub-interval a b) (make-interval 4 8))