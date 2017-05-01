; Exercise 1.37
; Write a procedure to compute estimates of infinite continued fractions by
; truncating the number of terms considered

(define (recur-continued-fraction num denom num-terms)
  (define (recur k)
    (if (= k num-terms)
        (/ (num k)
           (denom k))
        (/ (num k)
           (+ (denom k) (recur (+ k 1))))))
  (recur 1))


(define (continued-fraction num denom num-terms)
  (define (iter k following-terms)
    (if (= k 0)
        following-terms
        (iter (- k 1)
              (/ (num k)
                 (+ (denom k) following-terms)))))
  (iter num-terms 0))


(define (estimate-one-over-phi k)
  (continued-fraction (lambda (i) 1.0)
                      (lambda (i) 1.0)
                      k))


; Exercise 1.38
; Write a procedure to estimate e using Euler's expansion, a continued fraction
; for e - 2

(define (estimate-e k)
  (define (calculate-denom k)
    (if (= (remainder k 3) 2)
        (* 2 (/ (+ k 1)
                3))
        1))
  (continued-fraction (lambda (i) 1.0)
                      calculate-denom
                      k))


; Exercise 1.39
; Write a procedure to estimate tan(x) using a continued fraction representation
; by Lambert

(define (estimate-tan x k)
  (continued-fraction (lambda (i) (if (= 1 i)
                                      x
                                      (- (square x))))
                      (lambda (i) (- (* 2 i) 1))
                      k))
