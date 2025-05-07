; Assignment #: Lab Exercise 14
; Program Description: Factorials using invoke
; Author: Caden Pun (student: 2164581)
; Creation Date: 5/7/25
; Revisions: 0
; Date:              Modified by:

INCLUDE Irvine32.inc
.data
prompt1 byte "The output from the recursive call - ", 0
prompt2 byte "The output from the loop call - ", 0
prompt3 byte "!", 0
overflowMsg byte "The factorial value is overflowed", 0

Factorial proto, number:dword
Factorial_loop proto, number:dword

.code
main PROC
	mov  edx, offset prompt1
	call WriteString
	mov eax, 15
	call WriteDec
	mov edx, offset prompt3
	call WriteString
	call Crlf
	invoke Factorial, eax

	jo overflowSet1
	call WriteDec
	jmp continue1
	overflowSet1: mov edx, offset overflowMsg
				 call WriteString
	continue1: call Crlf

	mov  edx, offset prompt2
	call WriteString
	mov eax, 15
	call WriteDec
	mov edx, offset prompt3
	call WriteString
	call Crlf
	invoke Factorial_loop, eax

	jo overflowSet2
	call WriteDec
	jmp continue2
	overflowSet2: mov edx, offset overflowMsg
				 call WriteString
	continue2: call Crlf
	exit
main ENDP

Factorial PROC, number:dword
	mov  eax,number
	cmp  eax, 1			; n < 1? for the base case 1 and 0
	ja   L1				; yes: continue
	mov  eax,1			; no: return 1
	jmp  L2

L1:	dec  eax
	push eax			; Factorial(n-1)
	call Factorial

; Instructions from this point on execute when each
; recursive call returns.

ReturnFact:
	mov  ebx,[ebp+8]   	; get n
	mul  ebx          	; ax = ax * bx

L2:	ret
Factorial ENDP

Factorial_loop PROC number:dword
	mov  ecx,number	; get n
	mov  eax, 1
L1:	cmp  ecx, 0			; check if ecx == 0 then quit
	jz   L2
	mul  ecx			; otherwise multiple eax with ecx
	jo L2
	loop L1
L2:	ret
Factorial_loop ENDP
END main