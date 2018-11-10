#lang racket/base

(require rackunit)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) null sequence))

(define (append seq1 seq2)
  (accumulate cons seq1 seq2))

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

(define (square x)
  (* x x))

(define s1 '(1 2 3))
(define s2 '(4 5 6))

(check-equal? (map square s1) '(1 4 9))
(check-equal? (append s2 s1) '(1 2 3 4 5 6))
(check-equal? (length s1) 3)



