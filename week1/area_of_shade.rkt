#lang racket
(define pi (/ 22 7))
(define (area_of_circle radius) (* pi (* radius radius)))
(define (area_of_square size) (/ (* size size) 2))
(define (area_of_shade size) (- (area_of_circle (/ size 2)) (area_of_square size)))