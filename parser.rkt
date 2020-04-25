#lang brag
program      : [line] (/NEWLINE [line])*
line         : application
application  : callable term
abstraction  : /"(" /"λ" var /"." term /")" | /"λ" var /"." term
@term        : IDENT | NUM | abstraction
@var         : IDENT
@callable    : abstraction | application