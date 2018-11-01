#lang racket/base

(require rackunit)
(require "2.02.rkt")

(define (make-rectangle a b) (cons a b))

(define (width rct)
  (+ (abs (x-point (car rct)))
     (abs (x-point (cdr rct)))))

(define (height rct)
  (+ (abs (y-point (car rct)))
     (abs (y-point (cdr rct)))))

(define (perimeter rct)
  (* (+ (width rct)
        (height rct))
     2))

(define (square rct)
  (* (width rct)
     (height rct)))

(define test-rectangle
         (make-rectangle (make-point 0 0) (make-point 5 3)))

(check-equal? (perimeter test-rectangle) 16)
(check-equal? (square test-rectangle) 15)