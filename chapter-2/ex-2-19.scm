; Exercise 2.19
; Complete the given count-change procedure by writing procedures for
; first-denomination, except-first-denomination and no-more?

(define (count-change amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (count-change amount
                           (except-first-denomination coin-values))
             (count-change (- amount
                              (first-denomination coin-values))
                           coin-values)))))

(define (no-more? coin-values)
  (null? coin-values))

(define (except-first-denomination coin-values)
  (cdr coin-values))

(define (first-denomination coin-values)
  (car coin-values))
