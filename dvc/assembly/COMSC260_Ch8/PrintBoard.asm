INCLUDE Assignment14.inc

.code
PrintBoard proc uses ecx edx color:byte
;
; prints the whole board by passing the initial color
;
; Receives: byte color to alternate with white squares
; Returns: nothing but creates chessboard on console
;
mov dh,0
mov dl,0
mov ecx,8
L1: call Gotoxy
	test ecx, 1 ; divisible by 2?
	jz divisible
	jmp skip
	divisible:
	invoke PrintRow,color,15
	jmp done
	skip:
	invoke PrintRow,15,color
	done:
	inc dh
loop L1
ret
PrintBoard endp

END