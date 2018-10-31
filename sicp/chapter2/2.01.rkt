#lang racket/base

(require rackunit)

(define (make-rat n d)
  (let ((g (gcd n d)))
    (if (< d 0)
        (cons (/ (* n -1) g) (/ (abs d) g))
        (cons (/ n g) (/ d g)))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define one-half (make-rat 3 -2))
(define one-third (make-rat 1 3))

(check-equal? (mul-rat one-half one-third) (cons -1 2))