; Fibonacci sequence can be generated as successive transformations
; Tpq: (a,b) -> (ap + aq + bq, bp + aq) where p = 0, q = 1

; Fill in calculations for p' and q' to complete function for computing
; Fibonacci numbers in logarithmic time

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q)) ; p'
                   (+ (square q) (* 2 p q)) ; q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
