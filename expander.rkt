#lang br/quicklang

(define-macro (lc-module-begin (program LINE ...))
  #'(#%module-begin
     LINE ...))
(provide (rename-out [lc-module-begin #%module-begin]))

(define-macro (abstraction VAR EXPR)
  #'(λ (VAR) EXPR))
(provide abstraction)

(define-macro (application FUNC VAL)
  #'(FUNC VAL))
(provide application)

(define-macro (num NUM)
  #'(begin
      (displayln NUM)
      (NUM)))
(provide num)

(define-macro (line CONTENT)
  #'(displayln CONTENT))
(provide line)
