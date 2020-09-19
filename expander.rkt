#lang br/quicklang

;; Taken from https://stackoverflow.com/questions/20076868/how-to-know-whether-a-racket-variable-is-defined-or-not
(define-syntax (if-defined stx)
  (syntax-case stx ()
    [(_ id iftrue iffalse)
     (let ([where (identifier-binding #'id)])
       (if where
           (begin
             #'iftrue)
           (begin
             #'iffalse)))]))

(define-macro (lc-module-begin (lc-program LINE ...))
  #'(#%module-begin
     LINE ...))
(provide (rename-out [lc-module-begin #%module-begin]))

(define-macro (lc-definition IDENT ABSTRACTION)
  #'(begin
      (if-defined IDENT
        (set! IDENT ABSTRACTION)
        (define IDENT ABSTRACTION))))
(provide lc-definition)

(define-macro (lc-abstraction VAR EXPR)
  #'(λ (VAR) EXPR))
(provide lc-abstraction)

(define-macro (lc-application FUNC VAL)
  #'(FUNC VAL))
(provide lc-application)

(define-macro (lc-num NUM)
  #'NUM)
(provide lc-num)

(define-macro (lc-line CONTENT)
  #'CONTENT)
(provide lc-line)
