; Assignment #: 6
; Program Description: Reversing an array twice in-place with index and indirect addressing
; Author: Caden Pun (student: 2164581)
; Creation Date: 3/6/25
; Revisions: 0
; Date:              Modified by:

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

.data
testArray dword 1h, 2h, 3h, 4h, 5h, 6h, 7h, 8h, 9h, 10h
count dword ?

.code
main proc

; index addressing swap
	mov ecx, LENGTHOF testArray / 2
	mov esi, 0
	mov edi, SIZEOF testArray - TYPE testArray
L1:
	mov edx, testArray[esi]
	mov ebx, testArray[edi]

	mov testArray[esi], ebx
	mov testArray[edi], edx

	add esi, TYPE testArray
	sub edi, TYPE testArray
	loop L1

; indirect addressing swap
	mov ecx, LENGTHOF testArray / 2
	mov esi, OFFSET testArray
	mov edi, OFFSET testArray + SIZEOF testArray - TYPE testArray
L2:
	mov edx, [esi]
	mov ebx, [edi]

	mov [esi], ebx
	mov [edi], edx

	add esi, TYPE testArray
	sub edi, TYPE testArray
	loop L2

COMMENT !
	; nested loop swapping
	mov ecx, 2
	L1:
		mov esi, OFFSET testArray ; left pointer
		mov edi, OFFSET testArray + SIZEOF testArray - TYPE testArray ; right pointer

		mov count, ecx
		mov ecx, LENGTHOF testArray / 2 ; inner loop
	L2:
		mov edx, [esi] ; get left element
		mov ebx, [edi] ; get right element

		mov [edi], edx ; put in right
		mov [esi], ebx ; put in left

		add esi, TYPE testArray
		sub edi, TYPE testArray
		loop L2

		mov ecx, count
		loop L1
!

	invoke ExitProcess,0
main endp
end main