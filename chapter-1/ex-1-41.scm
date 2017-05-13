; Exercise 1.41
; Define a procedure that takes a procedure and produces a procedure that
; applies the given procedure twice

(define (double f)
  (lambda (x) (f (f x))))


; Exercise 1.42
; Define a procedure to compose two functions f and g to give x -> f(g(x))

(define (compose f g)
  (lambda (x) (f (g x))))


; Exercise 1.43
; Define a procedure to take a function and a number and to return a procedure
; that applies the given function the given number of times

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))


; Exercise 1.44
; Write a procedure to return a smoothed version of a given function by
; averaging (f(x - dx), f(x), f(x + dx)) for small dx

(define (smooth f)
  (define dx 0.0001)
  (lambda (x)
    (/ (+ (f (+ x dx)) (f x) (f (- x dx)))
       3)))

(define (n-fold-smooth f n)
  (repeated smooth n))


; Exercise 1.45
; Write a procedure to compute nth roots as fixed points of x -> x/y^(n-1) by
; applying repeated average damping as necessary

; TODO is it possible to import things from other modules?
(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
     (if (close-enough? guess next)
         next
         (try next))))
  (try first-guess))

(define (average-damp f)
  (lambda (x)
    (/ (+ x (f x))
       2)))

(define (nth-root n x)
  (let ((damp-repeats 2)) ; TODO calculate this based on n
   (fixed-point
     ((repeated average-damp damp-repeats)
      (lambda (y) (/ x
                     (expt y (- n 1)))))
     1.0)))
