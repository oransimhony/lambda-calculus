#lang br/quicklang

(define-macro (lc-module-begin (program LINE ...))
  #'(#%module-begin
     LINE ...))
(provide (rename-out [lc-module-begin #%module-begin]))

(define-macro (lambda-func VAR ... EXPR)
  #'(λ (VAR ...) EXPR))
(provide lambda-func)

(define-macro (application FUNC VAL ...)
  #'(FUNC
     VAL ...))
(provide application)

(define-macro (line CONTENT)
  #'(displayln CONTENT))
(provide line)
