#lang racket/base

(require rackunit)

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(check-equal? (fixed-point (lambda (x) (/ (log 1000) (log x))) 2) 4.555532270803653) ; 34 steps
(check-equal? (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2) 4.555537551999825) ; 9 steps

