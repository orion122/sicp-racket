#lang racket/base

(require rackunit)

(define (pascal-triangle n k)
  (if (or (= k 1) (= k n))
      1
      (+ (pascal-triangle (- n 1) (- k 1)) (pascal-triangle (- n 1) k))))

(check-equal? (pascal-triangle 4 2) 3)
(check-equal? (pascal-triangle 5 3) 6)
(check-equal? (pascal-triangle 6 4) 10)