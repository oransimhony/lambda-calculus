#lang racket
(require "lexer.rkt")
(define (make-tokenizer port)
  (define (next-token)
    (lambda-calculus-lexer port))
  next-token)
(provide make-tokenizer)