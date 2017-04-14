; Write a version of the below function for computing products with logarithmic
; complexity using only addition and functions to double and halve a value

(define (multiply a b)
  (if (= b 0)
      0
      (+ a (multiply a (- b 1)))))


(define (double a)
  (+ a a))

(define (halve a)
  (/ a 2))

(define (fast-multiply-recur a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-multiply-recur (double a) (halve b)))
        (else (+ a (fast-multiply-recur a (- b 1))))))

; tail recursive version for exercise 1.18
(define (fast-multiply a b)
  (define (fast-multiply-iter a b acc)
    (cond ((= b 0) acc)
          ((even? b) (fast-multiply-iter (double a) (halve b) acc))
          (else (fast-multiply-iter a (- b 1) (+ acc a)))))
  (fast-multiply-iter a b 0))
