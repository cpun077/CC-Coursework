; Assignment #: 5
; Program Description: converting from Big Endian to Little Endian with ptr
; Author: Caden Pun (student: 2164581)
; Creation Date: 2/25/25
; Revisions: 0
; Date:              Modified by:

.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
.data
bigEndian byte 12h, 34h, 56h, 78h
littleEndian dword ?
.code
main PROC
	mov eax, dword ptr bigEndian
	mov littleEndian, eax

	mov al, byte ptr bigEndian+3 ; 78h
	mov byte ptr littleEndian, al

	mov al, byte ptr bigEndian+2 ; 56h
	mov byte ptr littleEndian+1, al

	mov al, byte ptr bigEndian+1 ; 34h
	mov byte ptr littleEndian+2, al

	mov al, byte ptr bigEndian ; 12h
	mov byte ptr littleEndian+3, al

	INVOKE ExitProcess,0
main ENDP
; (insert additional procedures here)
END main
