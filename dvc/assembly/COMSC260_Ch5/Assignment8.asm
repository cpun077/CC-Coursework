; Assignment #: 8
; Program Description: Generates 20 random strings w/ lengths b/w 1-100
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
buffer byte 101 DUP(?)

.code
main proc
call Randomize
mov esi, OFFSET buffer
mov ecx, 20
L1:
	mov eax, 99
	call RandomRange ; random num between 0 and 99
	add eax, 1 ; add 1 so its between 1 and 100

	call CreateRandomString
	mov edx, esi
	call WriteString
	call Crlf
loop L1

	Invoke ExitProcess,0
main endp

CreateRandomString proc uses eax ecx esi
	mov ecx, eax
	L2:
		mov eax, 25 ; 26 letters
		call RandomRange
		add eax, 65 ; capital A starts at 65
		mov [esi], al
		inc esi
	loop L2
	mov byte ptr [esi], 0 ; null terminator
	ret
CreateRandomString endp

end main