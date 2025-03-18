; Assignment #: Lab Exercise 8
; Program Description: Sum two input integers with changing colors
; Author: Caden Pun (student: 2164581)
; Creation Date: 3/17/25
; Revisions: 0
; Date:              Modified by:

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
INCLUDE Irvine32.inc

.data
firstString byte "Enter first integer: ",0
secondString byte "Enter second integer: ",0
sumString byte "The sum is: ",0

.code
main proc
mov ecx, 3
mov eax, 5 ; base color
L1:
	call setTextColor
	call Clrscr
	push eax

	mov dh,8
	mov dl,35
	call Gotoxy
	mov  edx, OFFSET firstString
	call WriteString
	call ReadInt
	mov ebx, eax

	mov dh,9
	mov dl,35
	call Gotoxy
	mov edx, OFFSET secondString
	call WriteString
	call ReadInt
	add eax, ebx

	mov dh,10
	mov dl,35
	call Gotoxy
	mov edx, OFFSET sumString
	call WriteString
	call WriteInt
	call Crlf
	call Crlf
	call WaitMsg

	pop eax
	add eax, 17
loop L1

	Invoke ExitProcess,0
main endp

end main