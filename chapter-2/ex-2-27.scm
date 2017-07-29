; Exercise 2.27
; Modify the recursive procedure from exercise 2.18 to create a deep-reverse
; procedure that will reverse a list and all nested sublists

; cdr ALWAYS returns a list
; car returns the first element, maybe single element, maybe a list

(define (deep-reverse l)
  (cond ((not (pair? l)) l)
        ((pair? (car l))
         (append (deep-reverse (cdr l))
                 (deep-reverse (car l))))
        (else
         (append (deep-reverse (cdr l))
                 (list (car l))))))


; TODO - write something to test for list equality
(define x (list 3 2 1))
(define y (list (list 4 3) (list 2 1)))
(define z (list (list 5 6) (list 4 3) (list 2 1)))
