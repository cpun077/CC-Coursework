; Assignment #: Lab Exercise 9
; Program Description: Given 2 hex integers outputs boolean operation results
; Author: Caden Pun (student: 2164581)
; Creation Date: 4/3/25
; Revisions: 0
; Date:              Modified by:

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
INCLUDE Irvine32.inc

.data
firstString byte "Input the first 32-bit hexadecimal operand: ",0
secondString byte "Input the second 32-bit hexadecimal operand: ",0
result byte "The 32-bit hexadecmial result is: ",0
andString byte "Boolean AND",0
orString byte "Boolean OR",0
notString byte "Boolean NOT",0
xorString byte "Boolean XOR",0

.code
main proc

mov  edx, OFFSET firstString
call WriteString
call ReadHex

mov edx, OFFSET secondString
call WriteString
push eax
call ReadHex
mov ebx, eax
pop eax

call Crlf
mov edx, OFFSET andString
call WriteString
call Crlf
mov edx, OFFSET result
call WriteString
push eax
and eax, ebx
call WriteHex
pop eax

call Crlf
mov edx, OFFSET orString
call WriteString
call Crlf
mov edx, OFFSET result
call WriteString
push eax
or eax, ebx
call WriteHex
pop eax

call Crlf
mov edx, OFFSET notString
call WriteString
call Crlf
mov edx, OFFSET result
call WriteString
push eax
not eax
call WriteHex
pop eax

call Crlf
mov edx, OFFSET xorString
call WriteString
call Crlf
mov edx, OFFSET result
call WriteString
push eax
xor eax, ebx
call WriteHex
pop eax

call Crlf
call WaitMsg

	Invoke ExitProcess,0
main endp

end main