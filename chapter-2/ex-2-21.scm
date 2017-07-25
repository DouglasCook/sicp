; Exercise 2.21
; Complete two implementations of square-list which takes a list of numbers and
; returns a list of their squares

(define (square-list items)
  (if (null? items)
      nil
      (cons (* (car items) (car items))
            (square-list (cdr items)))))


(define (square-list items)
  (map (lambda (x) (* x x)) items))
