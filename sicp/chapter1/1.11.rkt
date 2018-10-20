#lang racket/base

(require rackunit)

(define (f-recursive n)
  (if (< n 3)
      n
      (+ (f-recursive (- n 1))
         (f-recursive (- n 2))
         (f-recursive (- n 3)))))

(define (iter a b c n)
  (if (< n 3)
      a
      (iter (+ a b c) a b (- n 1))))

(define (f-iterative n)
  (iter 2 1 0 n))

(check-equal? (f-recursive 3) 3)
(check-equal? (f-iterative 3) 3)

(check-equal? (f-recursive 5) 11)
(check-equal? (f-iterative 5) 11)

(check-equal? (f-recursive 7) 37)
(check-equal? (f-iterative 7) 37)