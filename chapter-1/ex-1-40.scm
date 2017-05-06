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


; Newton's method for finding roots of g(x)
; works by finding a fixed point of f(x) = x - g(x)/Dg(x)
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)
            ((deriv g) x)))))

; Derivative of g(x) (as dx -> 0)
(define (deriv g)
  (define dx 0.00001)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (newton-sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))


; Exercise 1.40
; Define a procedure cubic to be used with Newton's method to find roots of
; x^3 + ax^2 + bx + c

(define (cube x) (* x x x))

(define (cubic a b c)
  (lambda (x)
    (+ (cube x) (* a (square x)) (* b x) c)))
