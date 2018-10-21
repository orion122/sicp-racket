#lang racket/base

(require rackunit)

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  (iter a 0))

(define (identity x) x)

(define (inc a)
  (+ a 1))

(check-equal? (sum identity 1 inc 10) 55)