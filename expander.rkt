#lang br/quicklang

(define-macro (lc-module-begin PARSE-TREE)
  #'(#%module-begin
     PARSE-TREE))
(provide (rename-out [lc-module-begin #%module-begin]))

(define-macro (lambda-func VAR ... EXPR)
  #'(λ (VAR ...) EXPR))
(provide lambda-func)

(define-macro (call (lambda-func VAR ... EXPR) VAL ...)
  #'((lambda-func VAR ... EXPR)
      VAL ...))
(provide call)
