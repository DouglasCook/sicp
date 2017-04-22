; Method to check for primality in logarithmic time using the Fermat test

(define (prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (prime? n (- times 1)))
        (else false)))

; Check if the remainder of a**n is a for random number < n

(define (fermat-test n)
  (define (remainder-a? a)
    (= (expmod a n n) a))
  (remainder-a? (+ 1 (random (- n 1)))))

(define (expmod base exponent m)
  (cond ((= exponent 0) 1)
        ((even? exponent)
         (remainder (square (expmod base (/ exponent 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- exponent 1) m))
                     m))))

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


; Exercise 1.27
; Write a function to test for Carmichael numbers, those numbers that fool
; the Fermat test - this actually includes primes themselves though :|

(define (carmichael? n)
  (define (check a)
    (cond ((= a n) true)
          ((= (expmod a n n) a) (check (+ a 1)))
          (else false)))
  (check 1))
