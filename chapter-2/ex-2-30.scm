; Exercise 2.30
; Define a square-tree procedure that takes a tree and squares the values at
; all the leaves

; without higher order procedures
(define (square-tree tree)
  (cond ((null? tree)
          nil)
        ((not (pair? tree))
          (square tree))
        (else
          (cons (square-tree (car tree))
                (square-tree (cdr tree))))))

; using map
(define (square-tree-map tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree-map sub-tree)
             (square sub-tree)))
       tree))


; Exercise 2.31
; Abstract the map version to produce a procedure tree-map that takes a tree
; and maps the given function over it
(define (tree-map function tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map function sub-tree)
             (function sub-tree)))
       tree))
