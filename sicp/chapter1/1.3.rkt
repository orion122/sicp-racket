#lang racket/base

(require rackunit)

(define (solution a b c)
  (if (< a b)
      (if (< a c)
          (+ (* b b) (* c c))
          (+ (* b b) (* a a)))
      (+ (* a a) (* c c))))

(check-equal? (solution 1 2 3) 13)