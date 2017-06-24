; Church numerals are a way to represent numbers as procedures

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; Exercise 2.6
; Define 1 and 2 as Church numerals
(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

; Define the addition procedure
(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

; Tests
(define (inc x) (+ x 1))
((zero inc) 0) ; should be 0
((one inc) 0) ; should be 1
((two inc) 0) ; should be 2
(((add one two) inc) 0) ; should be 3
