; Exercise 1.32
; Define a procedure accumulate to combine sequences of terms and use it to
; define sum and product procedures

(define (accumulate combiner term a next b null-value)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))


(define (recursive-accumulate combiner term a next b null-value)
  (if (> a b)
      null-value
      (combiner (term a)
                (recursive-accumulate combiner term (next a) next b null-value))))


(define (sum term a next b)
  (define (add-them x y)
    (+ x y))
  (accumulate add-them term a next b 0))


(define (product term a next b)
  (define (multiply-them x y)
    (* x y))
  (accumulate multiply-them term a next b 1))


; Exercise 1.33
; Define a procedure that can also filter out the terms to consider

(define (filtered-accumulate combiner term a next b valid-term? null-value)
  (define (iter a result)
    (cond ((> a b) result)
          ((valid-term? a)
            (iter (next a) (combiner (term a) result)))
          (else
            (iter (next a) (combiner null-value result)))))
  (iter a null-value))
