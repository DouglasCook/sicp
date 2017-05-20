; Exercise 2.2
; Define a procedure for generating line segments as pairs of points and write
; a procedure for finding the midpoint of a segment

(define (make-segment point1 point2) (cons point1 point2))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (make-point x y) (cons x y))
(define (x-coord point) (car point))
(define (y-coord point) (cdr point))

(define (midpoint segment)
  (let ((point1 (start-segment segment))
        (point2 (end-segment segment)))
    (make-point (/ (+ (x-coord point1) (x-coord point2)) 2)
                (/ (+ (y-coord point1) (y-coord point2)) 2))))
