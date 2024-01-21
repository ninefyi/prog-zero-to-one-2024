#lang racket
(require 2htdp/image)

(define (half n)
  (/ n 2))

(struct square (side) #:transparent)

(define (aside s)
  (* (half s) (sqrt 2)))

(define (hypotenuse a b)
  (sqrt (+ (sqr a) (sqr b))))

(define (hypotenuse-eq a)
  (hypotenuse a a))

(define color-rec (color 0 255 255 127))
(define color-ccl (color 255 0 0 111))

(define (draw-circle r)
  (circle r "solid" color-ccl))
(define (draw-rectangle s)
  (define side (square-side s))  
  (rectangle side side "solid" color-rec))

(define (no-rotate rec) (rotate 0 rec))
(define (do-rotate rec) (rotate 45 rec))

(define s 100)

(define s1 (square s))
(define s2 (square (aside s)))
(define s3 (square (aside (aside s))))
(define s4 (square (aside (aside (aside s)))))

(define r1 (half s))
(define r2 (half (aside s)))
(define r3 (half (aside (aside s))))

(define rec1 (draw-rectangle s1))
(define rec2 (draw-rectangle s2))
(define rec3 (draw-rectangle s3))
(define rec4 (draw-rectangle s4))

(define ccl1 (draw-circle r1))
(define ccl2 (draw-circle r2))
(define ccl3 (draw-circle r3))

(underlay (no-rotate rec1)
          (underlay ccl1
                    (underlay (do-rotate rec2)
                              (underlay ccl2
                                        (underlay (no-rotate rec3)
                                                  (underlay ccl3
                                                            (do-rotate rec4)))))))
        
