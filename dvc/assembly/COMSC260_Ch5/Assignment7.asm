; Assignment #: 7
; Program Description: Random number generator between M and N-1
; Author: Caden Pun (student: 2164581)
; Creation Date: 3/14/25
; Revisions: 0
; Date:              Modified by:

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
INCLUDE Irvine32.inc

.data
lower byte "Please enter the lower bound: ",0
upper byte "Please enter the upper bound: ",0
upperVal dword ?

.code
main proc
mov ecx, 3
L1:
	mov  edx, OFFSET lower
	call WriteString
	call ReadInt
	mov ebx, eax

	mov edx, OFFSET upper
	call WriteString
	call ReadInt
	mov upperVal, eax ; preserve upper value for loop

	push ecx ; save outer ecx
	mov ecx, 30 ; loop counter
	L2:
		call BetterRandomRange
		call WriteInt
		call Crlf
		mov eax, upperVal
	loop L2
pop ecx ; preserve outer ecx
loop L1

	Invoke ExitProcess,0
main endp

BetterRandomRange proc uses ebx ; preserve ebx but not eax
	sub eax, ebx
	call RandomRange
	add eax, ebx
	ret
BetterRandomRange endp

end main