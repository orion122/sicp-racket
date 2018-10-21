#lang racket/base

(require rackunit)

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (identity x) x)

(define (inc a)
  (+ a 1))

(define (factorial n)
  (product identity 1 inc n))

(check-equal? (factorial 6) 720)