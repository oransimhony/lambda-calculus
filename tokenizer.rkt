#lang racket
(require "lexer.rkt" brag/support)

(module+ test
  (require rackunit))

(define (make-tokenizer port [path #f])
  (port-count-lines! port)
  (lexer-file-path path)
  (define (next-token)
    (lambda-calculus-lexer port))
  next-token)

(module+ test
  (check-equal?
   (apply-tokenizer-maker make-tokenizer "(λx.x) 1")
   (list
    (srcloc-token (token-struct '|(| "(" #f #f #f #f #f) (srcloc 'string 1 0 1 1))
    (srcloc-token (token-struct 'λ "λ" #f #f #f #f #f) (srcloc 'string 1 1 2 1))
    (srcloc-token
     (token-struct 'IDENT 'x #f #f #f #f #f)
     (srcloc 'string 1 2 3 1))
    (srcloc-token (token-struct '|.| "." #f #f #f #f #f) (srcloc 'string 1 3 4 1))
    (srcloc-token
     (token-struct 'IDENT 'x #f #f #f #f #f)
     (srcloc 'string 1 4 5 1))
    (srcloc-token (token-struct '|)| ")" #f #f #f #f #f) (srcloc 'string 1 5 6 1))
    (srcloc-token (token-struct '| | #f #f #f #f #f #t) (srcloc 'string 1 6 7 1))
    (srcloc-token (token-struct 'NUM 1 #f #f #f #f #f) (srcloc 'string 1 7 8 1)))))
(provide make-tokenizer)