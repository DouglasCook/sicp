; Define a procedure to take three numbers as arguments and return the sum
; of the squares of the two larger numbers

(define (sum-square a b)
 (+ (* a a) (* b b)))

(define (largest-two a b c)
 (cond ((and (> a c) (> b c)) (list a b))
       ((and (> a b) (> c b)) (list a c))
       (else (list b c))))

(define (sum-square-largest a b c)
 (cond ((and (> a c) (> b c)) (sum-square a b))
       ((and (> a b) (> c b)) (sum-square a c))
       ((and (> b a) (> c a)) (sum-square b c))))

(sum-square-largest 1 2 3)
