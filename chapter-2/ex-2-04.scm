; Exercise 2.4
; Verify that the following definitions of cons and car are valid
; Write the corresponding definition of cdr

(define (cons_ x y)
  (lambda (m) (m x y)))

(define (car_ z)
  (z (lambda (p q) p)))

(define (cdr_ z)
  (z (lambda (p q) q)))
