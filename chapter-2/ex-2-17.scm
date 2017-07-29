; Exercise 2.17
; Define a procedure to return the last element in a given list
; There is a built in procedure for this called "last"
(define (last-pair l)
  (list-ref l (- (length l) 1)))

(define (last-pair-recursive l)
  (if (null? (cdr l))
       (car l)
       (last-pair-recursive (cdr l))))


; Exercise 2.18
; Define a procedure to reverse a list
; There is a built in procedure for this called "reverse"
(define (reverse-recursive l)
  (if (null? (cdr l))
      l
      (append (reverse-recursive (cdr l))
              (list (car l)))))
