; Exercise 2.20
; Define a procedure that, given one or more arguments, returns a list of all
; arguments with same even/odd parity as the first argument

(define (same-parity first . rest)
  (let ((matching-parity? (if (odd? first) odd? even?)))

   (define (filter-elements elements)
     (cond ((null? elements)
            nil)
           ((matching-parity? (car elements))
            (cons (car elements) (filter-elements (cdr elements))))
           (else
             (filter-elements (cdr elements)))))

   (cons first (filter-elements rest))))
