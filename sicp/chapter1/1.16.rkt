#lang racket/base

(require rackunit)

(define (square x)
  (* x x))

(define (fast-exp-iterative b n)
  (iter b n 1))

(define (iter b n a)
  (cond ((= n 0) a)
        ((even? n) (iter (square b) (/ n 2) a))
        (else (iter b (- n 1) (* a b)))))

(check-equal? (fast-exp-iterative 2 10) 1024)