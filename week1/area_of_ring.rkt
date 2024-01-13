#lang racket
(define pi (/ 22 7))
(define (area_of_circle radius) (* pi (* radius radius)))
(define (area_of_ring r1 r2) (- (area_of_circle r1) (area_of_circle r2)))