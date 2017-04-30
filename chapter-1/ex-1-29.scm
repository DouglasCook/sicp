(define (inc a)
  (+ a 1))

(define (cube a)
  (* a a a))

; Procedure to sum terms between a and b where term and next are procedures
; defining the value of each term and how to increment a in each iteration

(define (recursive-sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (recursive-sum term (next a) next b))))


; Exercise 1.30
; Write a procedure to sum terms with an iterative process
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))


(define (sum-squares a b)
  (sum square a inc b))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))


; Exercise 1.29
; Define a procedure to approximate the value of an integral using Simpson's rule

(define (simpsons-integral f a b n)

  (define h (/ (- b a) n)) ; larger n -> more precise

  (define (y-term k)
    (define coef
      (cond ((or (= k 0) (= k n)) 1)
            ((odd? k) 4)
            (else 2)))
    (* coef
       (f (+ a (* k h)))))

  (* (/ h 3)
     (sum y-term 0 inc n)))
