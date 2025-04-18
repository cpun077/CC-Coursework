; Assignment #: Lab Exercise 11
; Program Description: Shifts array left by n bits
; Author: Caden Pun (student: 2164581)
; Creation Date: 4/18/25
; Revisions: 0
; Date:              Modified by:

INCLUDE Irvine32.inc

COUNT = 4				; shift count

.data
array DWORD 4BC94530h, 2CBA9429h, 4FB54386h, 69FC0544h, 5F5BE7ACh
prompt BYTE "Enter the number of bits shift to the left using SHLD: ",0

.code
main PROC
	mov edx,OFFSET prompt
	call WriteString
	call ReadInt

	mov  bl,al
	call ShiftDoublewords

; Display the results
	mov  esi,OFFSET array
	mov  ecx,LENGTHOF array
	mov  ebx,TYPE array
	call DumpMem

	exit
main ENDP

;---------------------------------------------------------------
ShiftDoublewords PROC
;
; Shifts an array of doublewords to the left.
; The array is a global variable.
; Receives: BL = number of bits to shift
; Returns: nothing
;---------------------------------------------------------------
	pushad
	mov  esi,OFFSET array
	mov  ecx,(LENGTHOF array) - 1

L1:	push ecx				; save loop counter
	mov  eax,[esi + TYPE DWORD]
	mov  CL,BL				; shift count
	shld [esi],eax,cl			; shift EAX into low bits of [esi]
	add  esi,TYPE DWORD			; point to next doubleword pair
	pop  ecx					; restore loop counter
	loop L1

; Left-shift the last doubleword
	mov CL, BL
	shl DWORD PTR [esi], CL
	popad

	ret
ShiftDoublewords ENDP

END main
