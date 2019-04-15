#lang brag
program      : [line] (/NEWLINE [line])*
line         : application
application  : lambda-func /"(" NUM* /")" | application /"(" NUM* /")"
lambda-func  : /"(" /"λ" (var)* /"." expr /")"
@expr        : IDENT | NUM | lambda-func
@var         : IDENT