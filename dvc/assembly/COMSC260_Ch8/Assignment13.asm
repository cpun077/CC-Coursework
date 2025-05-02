; Assignment #: 13
; Program Description: Find GCD of 2 integers
; Author: Caden Pun (student: 2164581)
; Creation Date: 5/1/25
; Revisions: 0
; Date:              Modified by:

INCLUDE Irvine32.inc

.data
prompt1 BYTE "Greatest common divisor of ",0
prompt2 BYTE " and ",0
prompt3 BYTE " is: ",0

values DWORD 35,15, 72,18, 31,17, 128,640, 121,0

.code
main PROC
mov ecx, 5
mov ebx, 0

L1:	mov	edx, OFFSET prompt1
	call WriteString

	mov eax, [values + ebx]
	call WriteDec
	push eax

	mov	edx, OFFSET prompt2
	call WriteString

	mov eax, [values + ebx + 4]
	call WriteDec
	push eax

	mov	edx, OFFSET prompt3
	call WriteString

	call gcd
	call WriteDec

	call Crlf
	add ebx, 8
	loop L1

	call WaitMsg

	exit
main ENDP

gcd PROC
;
; calculates greatest common divisor of two unsigned dword integers
; Recursive Stack Frame: EDX, ECX, EBP, ret, b, a
;
; Receives: integers a and b pushed onto the stack
; Returns: resulting gcd in EAX

push ebp
mov ebp, esp
push ecx
push edx
mov eax,[ebp + 12] ; a
mov ecx,[ebp + 8] ; b

.if eax < ecx
xchg eax, ecx
.endif

.if ecx == 0
jmp cleanup
.endif

xor edx, edx 
div ecx

.if edx == 0
mov eax, ecx
jmp cleanup
.endif

push ecx ; next a val
push edx ; next b val
call gcd

cleanup:
	pop edx ; remove following LIFO
	pop ecx
	pop ebp
	ret 8 ; remove a and b vals
gcd ENDP

END main