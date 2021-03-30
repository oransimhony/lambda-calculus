#lang racket
(require brag/support)

(define-lex-abbrev digits (:+ (char-set "0123456789")))
(define-lex-abbrev alphabet (char-set "abcdefghijklmnopqrstuvwxyz"))
(define-lex-abbrev ident-symbols (char-set "-_*"))
(define-lex-abbrev ident-chars (:or alphabet ident-symbols))
(define-lex-abbrev identifier (:seq (:+ ident-chars) (:* (:or ident-chars digits))))

(define-lex-abbrev reserved-terms (:or "(" ")" "λ" "." "=" "lambda"))


(define lambda-calculus-lexer
  (lexer-srcloc
   ["\n" (token 'NEWLINE lexeme)]
   [whitespace (token lexeme #:skip? #t)]
   [(from/stop-before ";" "\n") (token lexeme #:skip? #t)]
   [digits (token 'NUM (string->number lexeme))]
   [reserved-terms (token lexeme lexeme)]
   [identifier (token 'IDENT (string->symbol lexeme))]))

(provide lambda-calculus-lexer)