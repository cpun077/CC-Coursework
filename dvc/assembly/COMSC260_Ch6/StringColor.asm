; Assignment #: Midterm Q34
; Program Description: Display input string 10x with changing color
; Author: Caden Pun (student: 2164581)
; Creation Date: 4/4/25

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
INCLUDE Irvine32.inc

.data
prompt byte "Please enter the message you would like to display: ",0
buffer byte 128+1 DUP(0)

.code
main proc
    mov ecx, 10
    mov eax, 5 ; base color

    pushad
    mov edx, OFFSET prompt
    call WriteString
    mov edx, OFFSET buffer
    mov ecx, SIZEOF buffer
    call ReadString
    popad

L1:
    call SetTextColor
    mov edx, OFFSET buffer
    call WriteString
    call Crlf
    add eax, 17
loop L1

    call WaitMsg

    Invoke ExitProcess,0
main endp

end main

