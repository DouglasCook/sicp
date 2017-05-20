; Exercise 2.1
; Define a version of make-rat that handles negative arguments
(define (make-rat num denom)
  (let ((common-divisor (gcd num denom))
        (modifier (if (negative? denom) -1 1)))
  (cons (* modifier (/ num common-divisor))
        (* modifier (/ denom common-divisor)))))

(define (numer rational)
  (car rational))

(define (denom rational)
  (cdr rational))
