; Interval arithmetic - extended exercise
; Intervals are meant to represent the range of values imprecise quantities can take


; Given procedures for manipulating intervals
; Simply add the lower and upper bounds to form the sum
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

; Find the min and max of all bound-pairs to form the product
(define (multiply-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

; Multiply one interval by the reciprocal of the other, the bounds of the
; reciprocal are reversed ie upper then lower bound
(define (divide-interval x y)
  (multiply-interval x
                     (make-interval (/ 1.0 (upper-bound y))
                                    (/ 1.0 (lower-bound y)))))

; Width is half the distance between upper and lower bounds
(define (width interval)
  (/ (- (upper-bound interval)
        (lower-bound interval))
     2))


; Exercise 2.7
; Define selectors for upper and lower bounds
(define (make-interval a b) (cons a b))

(define (lower-bound interval) (car interval))

(define (upper-bound interval) (cdr interval))


; Exercise 2.8
; Define a procedure for subtraction
(define (subtract-interval a b)
  (make-interval (- (lower-bound a) (upper-bound b))
                 (- (upper-bound a) (lower-bound b))))
