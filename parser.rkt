#lang brag
; λt.λf t
; λt.λf            
call        : lambda-func NUM*
lambda-func : [/"("] /"λ" (var)* /"." expr [/")"]
@expr        : IDENT | NUM | lambda-func
@var         : IDENT