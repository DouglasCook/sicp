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


; (b) write a procedure to calculate the total weight of a mobile

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define (branch-weight branch)
  (let ((struct (branch-structure branch)))
   (if (not (pair? struct))
       struct
       (total-weight struct))))


; (c) write a predicate to check whether a mobile is balanced

(define (balanced? mobile)
  (let ((left (left-branch mobile))
        (right (right-branch mobile)))
  ; a mobile is balanced if each side has equal torque and each sub-mobile is balanced
  (and (= (torque left)
          (torque right))
       (branch-balanced? left)
       (branch-balanced? right))))

; torque is the length of a branch multiplied by weight on that branch
(define (torque branch)
  (* (branch-length branch)
     (branch-weight branch)))

(define (branch-balanced? branch)
  (let ((struct (branch-structure branch)))
   (if (not (pair? struct))
       #t
       (balanced? struct))))


; test data
(define lbranch (make-branch 1 2))
(define rbranch (make-branch 3 4))
(define nbranch (make-branch 2 (make-mobile lbranch rbranch)))

(define mobile (make-mobile lbranch nbranch))
(define balanced (make-mobile rbranch rbranch))
(define almost-balanced (make-mobile nbranch nbranch))

(define deep-balanced
  (make-mobile (make-branch 1 8)
               (make-branch 1
                            (make-mobile (make-branch 1 4)
                                         (make-branch 1
                                                      (make-mobile (make-branch 1 2)
                                                                   (make-branch 1 2)))))))
