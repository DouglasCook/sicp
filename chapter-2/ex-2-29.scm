; Exercise 2.29 - Binary Mobiles

; A binary mobile has two branches
(define (make-mobile left right)
  (list left right))

; Each branch is a rod of certain length with a structure that is either a weight
; or another binary mobile
(define (make-branch length structure)
  (list length structure))


; (a) write selectors to return branches and parts of the branches

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

; FIXME - stuff below is wrong :( the structure on a branch must either be 
; a weight or a mobile, not a branch

; (b) write a procedure to calculate the total weight of a mobile

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (branch-weight branch)
  (let ((struct (branch-structure branch)))
   (if (not (pair? struct))
       struct
       (branch-weight struct))))

; (c) write a predicate to check whether a mobile is balanced

; torque is the length of a branch multiplied by weight on that branch
(define (torque branch)
  (* (branch-length branch)
     (branch-weight branch)))


; test data
(define lbranch (make-branch 1 2))
(define rbranch (make-branch 3 4))
(define nbranch (make-branch 2 (make-branch 2 3)))
(define mobile (make-mobile lbranch rbranch))
