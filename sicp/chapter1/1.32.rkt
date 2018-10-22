#lang racket/base

(require rackunit)

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a acc)
    (if (> a b)
        acc
        (iter (next a) (combiner acc (term a)))))
  (iter a null-value))

(define (product-by-iter a b)
  (define (inc x) (+ x 1))
  (define (identity x) x) 
  (accumulate-iter * 1 identity a inc b))

(define (product-by-recursive a b)
  (define (inc x) (+ x 1))
  (define (identity x) x) 
  (accumulate-recursive * 1 identity a inc b))

(define (accumulate-recursive combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-recursive combiner null-value term (next a) next b))))

(check-equal? (product-by-iter 1 6) 720)
(check-equal? (product-by-recursive 1 6) 720)
