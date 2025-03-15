; Assignment #: Lab Exercise 7
; Program Description: Reverse a string from input, print output to console
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
buffer BYTE 51 DUP(0) ; receives user input
byteCount DWORD ?
prompt byte "Please enter a string within 50-character:",0

.code
main proc

; print prompt string in the console
mov  edx, OFFSET prompt
call WriteString
call Crlf

mov edx,OFFSET buffer ; point to the buffer
mov ecx,SIZEOF buffer ; specify max characters
call ReadString ; input the string
mov byteCount,eax ; number of characters

; print the original string in the console
mov  edx, OFFSET buffer
call WriteString
call Crlf

; push input string on the stack
mov	 ecx,byteCount
mov	 esi, 0

L1:	movzx eax, buffer[esi]	; get character
	push eax				; push on stack
	inc	 esi
	loop L1

; pop the string from the stack in reverse
; and store it in the buffer array

mov	 ecx, byteCount
mov	 esi, 0

L2:	pop  eax				; get character
	mov	 buffer[esi],al		; store in string
	inc	 esi
	loop L2
; print out the reversed string in the console
mov  edx, OFFSET buffer
call WriteString
call Crlf
	Invoke ExitProcess,0
main endp
end main