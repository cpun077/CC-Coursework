; Assignment #: Lab Exercise 4
; Program Description: Subtract two sums
; Author: Caden Pun (student: 2164581)
; Creation Date: 2/21/25
; Revisions: 0
; Date:              Modified by:

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
a dword 500
b dword 200
x dword 300
d dword 400
.code
main PROC
	mov eax, a
	mov ebx, b
	mov ecx, x
	mov edx, d

	add eax, ebx
	add ecx, edx
	sub eax, ecx
	INVOKE ExitProcess,0
main ENDP
; (insert additional procedures here)
END main
