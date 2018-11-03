#lang racket/base

(require rackunit)

(define items (list 1 2 3 4))

(define (square x)
  (* x x))

(define (square-list-1 items)
  (if (null? items)
      null
      (cons (square (car items)) (square-list-1 (cdr items)))))

(define (square-list-2 items)
  (map square items))

(check-equal? (square-list-1 items) (list 1 4 9 16))
(check-equal? (square-list-2 items) (list 1 4 9 16))