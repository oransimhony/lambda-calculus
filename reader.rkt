#lang br/quicklang
(require "parser.rkt" "tokenizer.rkt")

(define (read-syntax path port)
  (define parse-tree (parse path (make-tokenizer port path)))
  (define module-datum `(module lambda-calculus lambda-calculus/expander
                          ,parse-tree))
  (datum->syntax #f (strip-bindings module-datum)))
(provide read-syntax)
