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
  

