; Exercise 2.28
; Write a procedure that takes a tree in list form as an argument and returns
; the leaves of the tree in order ie flattens the given list

(define (fringe l)
  (cond ((null? l) 
          l)
        ((not (pair? l))
          (list l))
        (else
          (append (fringe (car l)) (fringe (cdr l))))))


(define tree (list (list 1 2) (list 3 4)))
(define wide-tree (list tree tree tree))
(define deep-tree (list (list (list tree 5) 6) 7))
