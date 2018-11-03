#lang racket/base

(require rackunit)

(define z (list 1 2 3))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (last-pair ls)
  (if (= 1 (length ls))
      (car ls)
      (last-pair (cdr ls))))



(check-equal? (last-pair z) 3)