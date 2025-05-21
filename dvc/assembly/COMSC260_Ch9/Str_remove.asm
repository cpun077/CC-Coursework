; Assignment #: Final
; Program Description: Removes n characters from string at given position
; Author: Caden Pun (student: 2164581)
; Creation Date: 5/20/25
; Revisions: 0
; Date:              Modified by:

INCLUDE Irvine32.inc

.data
target BYTE "abcxxxxdefghijklmop",0

Str_remove PROTO, pos:PTR BYTE, n:BYTE

.code
main PROC
mov edx,offset target
call WriteString
call Crlf

INVOKE Str_remove, ADDR [target+3], 4

mov edx,offset target
call WriteString
call Crlf
call WaitMsg
	exit
main ENDP

Str_remove proc uses esi edi ecx eax, pos:PTR BYTE, n:BYTE
;
; Removes n characters from target string at given position pos
;
; Receives: a pointer to the starting position and the num of char to remove
; Returns: nothing but modifies target string
;
; ESI (address of delete pos)
; EDI (address of replace pos)
; ECX (num of char to remove)
; AL (replace char)

mov esi, pos
movzx ecx, n ; loop n times
mov edi, esi
add edi, ecx ; pos of chars to be moved

L1: mov al, [edi]
    mov [esi], al ; overwrites deleted char
    inc esi
    inc edi

    cmp al, 0
    jnz L1 ; stop if null terminator hit or keep looping

ret
Str_remove ENDP

END main