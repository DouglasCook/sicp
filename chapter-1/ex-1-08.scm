; Define a procedure to calculate cube roots using Newton's method


(define (average a b)
  (/ (+ a b) 2))

(define (cube x)
  (* x x x))


(define (cube-root x)

  (define (cube-iter guess previous-guess)

    (define (good-enough?)
      (< (abs (- guess previous-guess))
         (/ guess 10000)))

    (define (improve-guess)
      (/ (+ (/ x (square guess))
            (* 2 guess))
          3))

    (if (good-enough?)
      guess
      (cube-iter (improve-guess) guess)))

  (cube-iter 1.0 0))
