; Exercise 2.25
; Give car cdr combinations to extract 7 from the following list structures

(define x (list 1 3 (list 5 7) 9))
(= 7 (car (cdaddr x)))

(define y (list (list 7)))
(= 7 (caar y))

(define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(= 7 (car (cdr (car (cdr (car (cdr (car (cdr (cadadr z)))))))))
