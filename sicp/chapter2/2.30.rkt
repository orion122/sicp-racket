#lang racket/base

(require rackunit)

(define (square x)
  (* x x))

(define (square-tree-1 tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree-1 (car tree))
                    (square-tree-1 (cdr tree))))))

(define (square-tree-2 tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-2 sub-tree)
             (square sub-tree)))
       tree))

(define x (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(check-equal? (square-tree-1 x) '(1 (4 (9 16) 25) (36 49)))
(check-equal? (square-tree-2 x) '(1 (4 (9 16) 25) (36 49)))
