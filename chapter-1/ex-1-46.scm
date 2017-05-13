; Exercise 1.46
; Write a procedure to iteratively improve a guess using a given procedure until
; the guess is adequate according to another procedure

(define (iterative-improve improve good-enough?)
  (define (check guess)
    (if (good-enough? guess)
        guess
        (check (improve guess))))
  (lambda (x) (check x)))


; Use iterative-improve to define a procedure for calculating square roots
(define (average a b)
  (/ (+ a b) 2))

(define (square-root x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x))
       0.001))
  (define (improve-guess guess)
    (average guess (/ x guess)))

  ((iterative-improve improve-guess good-enough?) 1.0))


; Use iterative-improve to define a procedure for finding fixed points of functions
; TODO to fit into the iterative improve procedure we need to call f here as
; well as when improving the guess, any way to remove this duplicate
; computation?
(define (fixed-point f first-guess)
  (define (close-enough? x)
    (< (abs (- x (f x))) 0.00001))
  ((iterative-improve f close-enough?) first-guess))
