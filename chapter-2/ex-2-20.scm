; Exercise 2.20
; Define a procedure that, given one or more arguments, returns a list of all
; arguments with same even/odd parity as the first argument

(define (same-parity first . rest)
  (let ((parity-check (if (odd? first) odd? even?)))

   (define (valid-or-none element)
     (if (parity-check element)
        (list element)
        (list)))

   (define (filter-elements elements)
     (if (null? (cdr elements))
         (valid-or-none (car elements))
         (append (valid-or-none (car elements))
                 (filter-elements (cdr elements)))))

   (append (list first) (filter-elements rest))))
