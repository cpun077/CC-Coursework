INCLUDE Assignment14.inc

.code
WriteColorBlock proc uses eax char:byte, backcolor:byte
;
; writes a block of 2 side-by-side characters (y = 2x)
;
; Receives: byte char to print to console, and byte backcolor
; Returns: nothing but creates color block on console
;
movzx eax,backcolor
call SetTextColor

movzx eax, char
call WriteChar
call WriteChar

ret
WriteColorBlock endp

END