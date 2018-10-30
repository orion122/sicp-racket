#lang racket/base

(require rackunit)

(define (square x)
  (* x x))

(define (cube x)
  (* x x x))

(define (double func x)
  (func (func x)))

(check-equal? (double square 2) 16)
(check-equal? (double cube 2) 512)