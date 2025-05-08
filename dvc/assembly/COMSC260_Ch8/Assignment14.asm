; Assignment #: 14
; Program Description: Chessboard with alternating colors
; Author: Caden Pun (student: 2164581)
; Creation Date: 5/7/25
; Revisions: 0
; Date:              Modified by:

INCLUDE Assignment14.inc
.data

.code
main proc
mov ecx,16
mov eax,500
mov edx,ecx
L1: dec edx
	invoke PrintBoard,dl
	call Delay
loop L1

	exit
main endp

end main