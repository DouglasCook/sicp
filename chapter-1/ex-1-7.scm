; Define a procedure to calculate square roots using Newton's method, checking
; for completion based on rate of change in subsequent guesses


(define (average a b)
  (/ (+ a b) 2))


; original square root procedure
(define (square-root x)

  (define (improve-guess guess)
    (average guess (/ x guess)))

  (define (good-enough? guess)
    (< (abs (- (square guess)
               x))
       0.001))

  (define (square-iter guess)
    (if (good-enough? guess)
      guess
      (square-iter (improve-guess guess))))

  (square-iter 1.0))


; with improved good enough check
(define (square-root-again x)

  (define (square-iter guess previous-guess)

    (define (good-enough?)
      (< (abs (- guess previous-guess))
         (/ guess 10000)))

    (define (improve-guess)
      (average guess (/ x guess)))

    (if (good-enough?)
      guess
      (square-iter (improve-guess) guess)))

  (square-iter 1.0 0))
