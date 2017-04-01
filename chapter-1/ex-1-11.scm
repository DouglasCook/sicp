; Write procedures to compute the below by a recursive and iterative process
; f(n) = 1 if n < 3
; f(n) = f(n-1) + 2f(n-2) + 3f(n-3) if n >= 3

(define (recursive n)
  (cond ((< n 3) 1)
        (else (+ (recursive (- n 1))
                 (* 2 (recursive (- n 2)))
                 (* 3 (recursive (- n 3)))))))


(define (iterative n)

  (define (iter i n-1 n-2 n-3)
    (define total (+ n-1 (* 2 n-2) (* 3 n-3)))
    (cond ((= i n) total)
          (else (iter (+ i 1) total n-1 n-2))))

  (cond ((< n 3) 1)
        (else (iter 3 1 1 1))))
