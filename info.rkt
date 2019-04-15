#lang info
(define collection "lambda-calculus")
(define deps '("beautiful-racket-lib"
               "rackunit-lib"
               "base" "brag" "beautiful-racket"))
(define build-deps '("scribble-lib" "racket-doc" "rackunit-lib"))
(define scribblings '(("scribblings/lambda-calculus.scrbl" ())))
(define pkg-desc "A lambda-calculus DSL in Racket")
(define version "1.0.0")
(define pkg-authors '(oransimhony))
