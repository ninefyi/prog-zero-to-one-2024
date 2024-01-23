#lang racket
(require 2htdp/image)

(define (half n)
  (/ n 2))

(define (aside s)
  (* (half s) (sqrt 2)))

(define (draw-square s)
  (rectangle s s "outline" "black"))

(define (draw-square-aside s)
  (define size (aside s))
  (rectangle size size "outline" "black"))

(define (no-rotate rec)
  (rotate 0 rec))

(define (do-rotate rec)
  (rotate 45 rec))

(define (tail-stack-overlay n size rec swap)
  (if (= n 0)
      rec
      (if (= swap 1)
          (tail-stack-overlay (- n 1)
                          (aside size)
                          (overlay rec
                                   (do-rotate (draw-square-aside size)))
                          0)
          (tail-stack-overlay (- n 1)
                          (aside size)
                          (overlay rec
                                   (no-rotate (draw-square-aside size)))
                          1))))

(tail-stack-overlay 3 100 (draw-square 100) 1)