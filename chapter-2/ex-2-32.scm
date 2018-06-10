; Exercise 2.32
; Complete the given procedure for generating all subsets of a given set
; (represented as a list containing unique elements), by filling in the procedure
; that is mapped over `rest`

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
       (append rest
               (map (lambda (x) (cons (car s) x))
                    rest)))))

(define set (list 1 2 3))
