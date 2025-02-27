; Assignment #: Lab Exercise 5
; Program Description: Practice using movsx, movzx, xchg
; Author: Caden Pun (student: 2164581)
; Creation Date: 2/25/25
; Revisions: 0
; Date:              Modified by:

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
intA word 100
intB sword -100
arrayD dword 1,2,3,4
.code
main PROC
	movzx ebx, intA
	movsx edx, intB

	mov eax, arrayD
	xchg eax, arrayD+12
	mov arrayD, eax

	mov eax, arrayD+4
	xchg eax, arrayD+8
	mov arrayD+4, eax

	INVOKE ExitProcess,0
main ENDP
; (insert additional procedures here)
END main
