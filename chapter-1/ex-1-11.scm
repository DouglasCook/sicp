; Write procedures to compute the below by a recursive and iterative process
; f(n) = 1 if n < 3
; f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n >= 3

(define (recursive n)
  (cond ((< n 3) 1)
        (else (+ (recursive (- n 1))
                 (* 2 (recursive (- n 2)))
                 (* 3 (recursive (- n 3)))))))

(define (iter i n n-1 n-2 n-3)
  (cond ((< n 3) 1)
        ((= i n) (+ n-1 (* 2 n-2) (* 3 n-3)))
        ((= i 2) (iter 3 n 1 1 1))
        (else (iter (+ i 1)
                    n
                    (+ n-1 (* 2 n-2) (* 3 n-3))
                    n-1
                    n-2))))

(define (iterative n)
  (iter 2 n 1 0 0))
