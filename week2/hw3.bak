#lang racket

(define (area-circle r)
  (* pi (sqr r)))

(define  (area-rectangle w h)
  (* w h))

(define (area-square s)
  (area-rectangle s s))

(define (area-donut r1 r2)
  (abs (- (area-circle r1)
          (area-circle r2))))

(define (half n)
  (/ n 2))

(define (hypotenuse a b)
  (sqrt (+ (sqr a) (sqr b))))

(define (hypotenuse-eq a)
  (hypotenuse a a))

(define (area-visible-circle-parts s)
  (- (area-circle (half s))
     (area-square (hypotenuse-eq (half s)))))

(define s1 100)
(define s2 (hypotenuse-eq (half s1)))
(define s3 (hypotenuse-eq (half (hypotenuse-eq (half s1)))))

(define a1 (area-visible-circle-parts s1))
(define a2 (area-visible-circle-parts s2))
(define a3 (area-visible-circle-parts s3))

(+ a1 (+ a2 a3))

(define (tail-sum a b s [acc 0])
  (if (= a 1)
      (area-visible-circle-parts s)
      (area-visible-circle-parts (hypotenuse-eq (half s)))))
      
 