; Assignment #: 11
; Program Description: encryption using rotation
; Author: Caden Pun (student: 2164581)
; Creation Date: 4/17/25
; Revisions: 0
; Date:              Modified by:

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
INCLUDE Irvine32.inc
bufmax = 128

.data
prompt byte "Please enter one plain text:",0
encode byte "The plain text after encoded:",0
decode byte "The plain text after decoded:",0
buffer byte bufmax+1 dup(0)
bufSize dword ?
key byte -5, 3, 2, -3, 0, 5, 2, -4, 7, 9
keySize = $ - key

.code
main proc
	mov edx,offset prompt
	call WriteString
	call Crlf
	mov edx,offset buffer
	mov ecx,bufmax
	call ReadString
	mov	bufSize,eax
	call Crlf

	call EncryptBuffer

	mov edx,offset encode
	call WriteString
	call Crlf
	mov edx,offset buffer
	call WriteString
	call Crlf
	call Crlf

	call DecryptBuffer

	mov edx,offset decode
	call WriteString
	call Crlf
	mov edx,offset buffer
	call WriteString
	call Crlf
	call Crlf
	call WaitMsg

	Invoke ExitProcess,0
main endp

EncryptBuffer proc ; encrypt by rotating each byte of the string according to the key
	pushad
	mov	ecx,bufSize		; loop counter
	mov	esi,0			; index 0 in buffer
	mov ebx,0
L1:
	pushad
	mov al,key[ebx]
	mov cl, al
	.IF al > 0
        ror	buffer[esi],cl
    .ELSE
        rol	buffer[esi],cl
    .ENDIF
	popad
	inc	esi				; point to next byte
	inc ebx
	cmp ebx,keySize
	jne L2
	mov ebx,0
	L2: ; skips resetting ebx to 0
	loop	L1

	popad
	ret
EncryptBuffer endp

DecryptBuffer proc ; decrypt by rotating the other way
	pushad
	mov	ecx,bufSize		; loop counter
	mov	esi,0			; index 0 in buffer
	mov ebx,0
L1:
	pushad
	mov al,key[ebx]
	mov cl, al
	.IF al < 0
        ror	buffer[esi],cl
    .ELSE
        rol	buffer[esi],cl
    .ENDIF
	popad
	inc	esi				; point to next byte
	inc ebx
	cmp ebx,keySize
	jne L2
	mov ebx,0
	L2: ; skips resetting ebx to 0
	loop	L1

	popad
	ret
DecryptBuffer endp

end main