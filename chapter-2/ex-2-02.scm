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


; Exercise 2.3
; Implement a representation for rectangles in a plane and create procedures
; for calculating the perimeter and area


; helpers for combining points
(define (add-vectors vec1 vec2)
  ((combine-vectors +) vec1 vec2))

(define (subtract-vectors vec1 vec2)
  ((combine-vectors -) vec1 vec2))

(define (combine-vectors operator)
  (lambda (vec1 vec2)
    (make-point (operator (x-coord vec1) (x-coord vec2))
                (operator (y-coord vec1) (y-coord vec2)))))

; segment helpers
(define (seg-length segment)
  ; TODO better name than origin-relative!
  (let ((origin-relative (subtract-vectors (end-segment segment)
                                           (start-segment segment))))
    (sqrt (+ (square (x-coord origin-relative))
             (square (y-coord origin-relative))))))


; TODO should probably enforce that the edges share a point?
(define (make-rectangle edge1 edge2)
  (cons edge1 edge2))

(define (edge1 rectangle)
  (car rectangle))

(define (edge2 rectangle)
  (cdr rectangle))

(define (edge3 rectangle) ; edge parallel to edge1
  (make-segment
    (end-segment (edge2 rectangle))
    (outer-corner rectangle)))

(define (edge4 rectangle) ; edge parallel to edge2
  (make-segment
    (end-segment (edge1 rectangle))
    (outer-corner rectangle)))

(define (outer-corner rectangle)
  (add-vectors (end-segment (edge1 rectangle))
               (end-segment (edge2 rectangle))))

; calculations with rectangles
(define (perimeter rectangle)
  (* 2 (+ (seg-length (edge1 rectangle))
          (seg-length (edge2 rectangle)))))

(define (area rectangle)
  (* (seg-length (edge1 rectangle))
     (seg-length (edge2 rectangle))))


; Test rectangles
(define origin (make-point 0 0))

(define simple-rectangle
  (make-rectangle
    (make-segment origin (make-point 0 3))
    (make-segment origin (make-point 5 0))))

(define negative-rectangle
  (make-rectangle
    (make-segment origin (make-point -1 2))
    (make-segment origin (make-point 3 2))))

(define off-origin-rectangle
  (make-rectangle
    (make-segment (make-point 1 2) (make-point 1 8))
    (make-segment (make-point 1 2) (make-point 4 2))))
