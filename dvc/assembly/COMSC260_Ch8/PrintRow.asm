INCLUDE Assignment14.inc

.code
PrintRow proc uses ecx color1:byte, color2:byte
;
; prints chessboard row with alternating colors
;
; Receives: bytes color1 and color2 for the color of the blocks
; Returns: nothing but creates chessboard row on console
;
mov ecx,4
L1: invoke WriteColorBlock,219,color1 ; ASCII 219 is a full block char
	invoke WriteColorBlock,219,color2
loop L1
ret
PrintRow endp

END