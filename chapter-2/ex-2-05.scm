; Exercise 2.5
; Show that we can represent pairs of non-negative integers (a b) as the product
; 2^a * 3^b and write the definitions for cons, car and cdr

(define (cons_ x y)
  (* (expt 2 x) (expt 3 y)))

(define (car_ z)
  (get-max-exp-that-divides z 2 0))

(define (cdr_ z)
  (get-max-exp-that-divides z 3 0))

(define (get-max-exp-that-divides n base exponent)
  (if (= (remainder n base) 0)
      (get-max-exp-that-divides (/ n base) base (+ exponent 1))
      exponent))
