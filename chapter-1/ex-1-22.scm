; Procedure for checking if an integer n is prime with time complexity root n

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

; Exercise 1.23 - Optimise find-divisor by only checking odd numbers after 2

(define (find-divisor n test-divisor)
  (define (next)
    (if (= test-divisor 2)
        3
        (+ test-divisor 2)))
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next)))))

(define (divides? a b)
  (= (remainder b a) 0))


; Procedure for timing how long it takes to check if an integer is a prime

(define (timed-prime-test n)
  (define (report-prime elapsed-time)
    (display " is prime, check took ")
    (display elapsed-time)
    (display " ticks"))
  (define (start-prime-test start-time)
    (if (prime? n)
        (report-prime (- (real-time-clock) start-time))))
  (newline)
  (display n)
  (start-prime-test (real-time-clock)))


; Exercise 1.22
; Write a procedure to check consecutive odd integers within a given range for
; primality

(define (search-for-primes lower upper)
  (cond ((even? lower)
          (search-for-primes (+ lower 1) upper))
        ((even? upper)
          (search-for-primes lower (- upper 1)))
        ((>= lower upper)
          (newline)
          (display "DONE"))
        (else
          (timed-prime-test lower)
          (search-for-primes (+ lower 2) upper))))
