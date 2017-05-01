(define tolerance 0.00001)

; Find the a fixed point of the given function by repeatedly applying f
; to a given starting value
(define (fixed-point f first-guess)

  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

  (define (try guess)
    (let ((next (f guess)))
     (display "next guess ")
     (display next)
     (newline)
     (if (close-enough? guess next)
         next
         (try next))))

  (try first-guess))


; Exercise 1.35
; Compute phi as a fixed point of the transformation x -> 1 + 1/x

(define phi
  (fixed-point
    (lambda (x) (+ 1 (/ 1.0 x)))
    1))


; Exercise 1.36
; Calculate a solution to x^x = 1000 as a fixed point of x -> log(1000)/log(x)

(define undamped
  (fixed-point
    (lambda (x) (/ (log 1000) (log x)))
    2))

; with average damping
(define damped
  (fixed-point
    (lambda (x)
      (/ (+ x (/ (log 1000)
                 (log x)))
         2))
    2))
