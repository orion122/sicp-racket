#lang racket/base

(require rackunit)

(define (square x)
  (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repited func times)
  (if (= times 1)
      func
      (compose func (repited func (- times 1)))))

(check-equal? ((repited square 2) 5) 625)

(provide repited)