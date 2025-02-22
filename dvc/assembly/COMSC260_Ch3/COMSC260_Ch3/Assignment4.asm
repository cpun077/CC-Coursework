; Assignment #: 4
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
sum dword ?
valueA dword 1000
valueB dword 300
valueC dword 2000
valueD dword 500
ssum sdword ?
svalueA sdword 1000
svalueB sdword 300
svalueC sdword 2000
svalueD sdword 500
.code
main PROC
	mov eax, valueA
	mov ebx, valueB
	add eax, ebx
	mov [sum], eax
	mov eax, valueC
	mov ebx, valueD
	add eax, ebx
	sub [sum], eax
	
	mov eax, svalueA
	mov ebx, svalueB
	add eax, ebx
	mov [ssum], eax
	mov eax, svalueC
	mov ebx, svalueD
	add eax, ebx
	sub [ssum], eax
	INVOKE ExitProcess,0
main ENDP
; (insert additional procedures here)
END main
