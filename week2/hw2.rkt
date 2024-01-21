#lang racket
(require 2htdp/image)

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

(define (draw-circle r)
  (circle r "solid" "red"))
(define (draw-rectangle s)
  (rectangle s s "outline" "black"))

(define c1 (draw-circle 50))
(define r1 (draw-rectangle 100))
(define p1 (overlay c1 r1))

;(overlay
; (rotate 45 (draw-rectangle 70))
; (overlay
;  (draw-circle 50)
;  (overlay
;   (rotate 0 (draw-rectangle 100))
;   (overlay
;    (draw-circle 35)
;    (overlay
;     (rotate 0 (draw-rectangle 50))
;     (overlay
;      (draw-circle 25)
;      (rotate 45 (draw-rectangle 35))
;      )
;     )
;    )
;   )
;  )
; )

(define s 100)
(define (aside s) (* (half s) (sqrt 2)))

(define rec1 (rectangle s s "outline" "black"))
(define rec2 (rectangle (aside s) (aside s) "outline" "black"))
(define rec3 (rectangle (aside (aside s)) (aside (aside s)) "outline" "black"))
(define rec4 (rectangle (aside (aside (aside s))) (aside (aside (aside s))) "outline" "black"))

(define ccl1 (circle (half s) "outline" "red"))
(define ccl2 (circle (half (aside s)) "outline" "red"))
(define ccl3 (circle (half (half (aside s))) "outline" "red"))

(overlay rec1
         (overlay (rotate 45 rec2)
                  (overlay rec3
                           (rotate 45 rec4))))

(overlay ccl1 
         (overlay ccl2
                  ccl3))
