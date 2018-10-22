#lang racket/base

(require rackunit)

(define (filtered-accumulate combiner null-value term a next b condition)
  (define (iter a acc)
    (if (> a b)
        acc
        (if (condition a)
            (iter (next a) (combiner acc (term a)))
            (combiner acc (term a)))))
  (iter a null-value))

(define (product-by-iter a b condition)
  (define (inc x) (+ x 1))
  (define (identity x) x)
  (filtered-accumulate * 1 identity a inc b condition))

(define (condition x) (< x 5))

(check-equal? (product-by-iter 1 6 condition) 120)