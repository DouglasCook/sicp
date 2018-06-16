; Return the range between low and high (inclusive)
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (interval (+ 1 low) high))))

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))


; Accumulate definition from the book
; TODO how is this different to the built in reduce? (it is)
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


; Exercise 2.33
; Fill in the blanks to define the given list operations using accumulate

(define (acc-map p sequence)
  (accumulate
    (lambda (x y) (cons (p x) y))
    nil sequence))

(define (acc-append a b)
  (accumulate cons b a))

(define (acc-length sequence)
  (accumulate
    (lambda (x y) (+ 1 y))
    0 sequence))


(define (reduce-map p sequence)
  (reduce
    (lambda (x y) (append (if (pair? y) y (list (p y)))
                          (list (p x))))
    nil sequence))
