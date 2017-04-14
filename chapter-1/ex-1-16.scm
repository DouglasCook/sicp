; Write an iterative version of the below function for efficiently calculating
; exponents

(define (fast-expt-recursive b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt-recursive b (- n 1))))))


(define (fast-expt b n)
  (define (fast-expt-iter b n accumulator)
    (cond ((= n 0) accumulator)
          ((even? n) (fast-expt-iter (square b) (/ n 2) accumulator))
          (else (fast-expt-iter b (- n 1) (* accumulator b)))))
  (fast-expt-iter b n 1))
