#lang racket
(require"lexer.rkt" brag/support)
(define (make-tokenizer port [path #f])
  (port-count-lines! port)
  (lexer-file-path path)
  (define (next-token)
    (lambda-calculus-lexer port))
  next-token)
(provide make-tokenizer)