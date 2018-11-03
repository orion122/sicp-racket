#lang racket

(require rackunit)
(require "2.18.rkt")

(define (same-parity first . others)
  (define parity-cond?
    (if (even? first)
        even?
        odd?))
  (define (iter others acc)
    (if (null? others)
        (cons first (reverse acc))
        (cond ((parity-cond? (car others)) (iter (cdr others) (cons (car others) acc)))
              (else (iter (cdr others) acc)))))
  (iter others null))


(check-equal? (same-parity 1 2 3 4 5 6 7) (list 1 3 5 7))
(check-equal? (same-parity 2 3 4 5 6 7 8) (list 2 4 6 8))