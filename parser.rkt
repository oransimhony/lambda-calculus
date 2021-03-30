#lang brag
lc-program      : [lc-line] (/NEWLINE [lc-line])*
lc-line         : [@lc-expr]
lc-application  : lc-callable lc-term
lc-definition   : lc-var /"=" lc-abstraction
lc-abstraction  : /"(" lc-abstraction-i /")" | lc-abstraction-i
lc-expr         : lc-application | lc-definition

@lc-abstraction-i : /lc-lambda lc-var /"." lc-term
@lc-lambda        : "λ" | "lambda"
@lc-term          : IDENT | NUM | lc-abstraction | lc-application
@lc-var           : IDENT
@lc-callable      : lc-abstraction | lc-application | lc-var
