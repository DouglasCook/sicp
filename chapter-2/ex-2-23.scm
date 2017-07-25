; Exercise 2.23
; Write a procedure that given a function and a list of arguments applies the
; function to each element, results are not stored and what it returns doesn't
; matter

(define (homemade-for-each function arg-list)
  (function (car arg-list))
  (if (null? (cdr arg-list))
      true
      (homemade-for-each function (cdr arg-list))))
