#lang racket/base

(require rackunit)

(define a '(1 3 (5 7) 9))
(define b '((7)))
(define c '(1 (2 (3 (4 (5 (6 7)))))))

(check-equal? (car (cdaddr a)) 7)
(check-equal? (caar b) 7)
(check-equal? (cadadr (cadadr (cadadr c))) 7)