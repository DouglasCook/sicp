; Write a procedure to calculate rows of Pascal's triangle by recursive process

(define (pascal row element)

  ; return first symmetric element in row to reduce repeated computation
  (define matching-element
    (if (> element (/ row 2))
        (- row element)
        element))

  (define edge-element
    (or (< row 2)
        (= element 0)
        (= element row)))

  (cond ((> element row) "Row does not contain an element at this location")
        (edge-element 1)
        (else (+ (pascal (- row 1) (- matching-element 1))
                 (pascal (- row 1) matching-element)))))
