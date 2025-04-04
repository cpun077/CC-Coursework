; Assignment #: Midterm Q33
; Program Description: Rotate array forward 1 position
; Author: Caden Pun (student: 2164581)
; Creation Date: 4/4/25

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
INCLUDE Irvine32.inc

.data
array dword 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
aSize = LENGTHOF array

.code
main proc
    mov esi, OFFSET array
    mov ecx, aSize
    mov ebx, TYPE array
    call DumpMem

    mov eax, array[aSize * 4 - 4] ; save last element

    mov ecx, aSize - 1
    mov esi, (aSize - 1) * 4

L1:
    mov edx, array[esi - 4]
    mov array[esi], edx
    sub esi, 4
loop L1

    mov array, eax ; move last element to front

    mov esi, OFFSET array
    mov ecx, aSize
    mov ebx, TYPE array
    call DumpMem
    call WaitMsg

    Invoke ExitProcess,0
main endp

end main
