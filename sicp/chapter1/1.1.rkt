#lang racket/base

10                  ; 10
(+ 5 3 4)           ; 5 + 3 + 4 = 12
(- 9 1)             ; 9 - 1 = 8
(/ 6 2)             ; 6 / 2 = 3
(+ (* 2 4) (- 4 6)) ; (2 * 4) + (4 - 6) = 6

(define a 3)        ; a = 3
(define b (+ a 1))  ; b = a + 1 = 4

(+ a b (* a b))     ; a + b + (a * b) = 19
(= a b)             ; #f (false)

(if (and (> b a) (< b (* a b)))
    b
    a)                 ; if ((b > a) and (b < (a * b)))
                       ; then b
                       ; else a
                       ; => 4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))       ; if (a = 4) then 6
                       ; else if (b = 4) then (6 + 7 + a)
                       ; else 25
                       ; => 16

(+ 2 (if (> b a) b a)) ; 2 + (if (b > a) then b else a) = 6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1))            ; (if (a > b) then a
                       ;  else if (a < b) then b
                       ;  else -1)
                       ; * (a + 1) = 4 * 4 = 16
