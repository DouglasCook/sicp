(define (inc x)
  (+ x 1))

; Exercise 1.30
; Define a procedure analogous to sum to compute products
; Use it to define factorial and an approximation to pi using a method by John Wallis

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))


(define (recursive-product term a next b)
  (if (> a b)
      1
      (* (term a)
         (recursive-product term (next a) next b))))


(define (factorial a)
  (define (identity x)
    x)
  (product identity 1 inc a))


(define (wallis-pi n)
  (define (this-denominator k)
    (if (even? k)
        (+ k 3)
        (+ k 2)))
  (define (this-numerator k)
    (cond ((= 0 k) 2)
          ((odd? k) (+ k 3))
          (else (+ k 2))))
  (define (term k)
    (/ (this-numerator k) (* 1.0 (this-denominator k))))

  (* 4 (product term 0 inc n)))
