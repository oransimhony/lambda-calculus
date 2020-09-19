#lang lambda-calculus
true  = (λx. λy. x) ; This function always returns its first argument
false = (λx. λy. y) ; This function always returns its second argument

true  1 0 ; Should return 1
false 0 1 ; Should return 1