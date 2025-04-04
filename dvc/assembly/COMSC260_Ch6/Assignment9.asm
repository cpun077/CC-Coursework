; Assignment #: 9
; Program Description: Demonstrates symmetric encryption w/ multiple characters
; Author: Caden Pun (student: 2164581)
; Creation Date: 4/3/25
; Revisions: 0
; Date:              Modified by:

INCLUDE Irvine32.inc
BUFMAX = 128     	; maximum buffer size

.data
sPrompt  BYTE  "Enter the plain text: ",0
kPrompt  BYTE  "Enter the encryption key: ",0
sEncrypt BYTE  "Cipher text:          ",0
sDecrypt BYTE  "Decrypted:            ",0
buffer   BYTE   BUFMAX+1 DUP(0)
bufSize  DWORD  ?
kbuffer  BYTE   BUFMAX+1 DUP(0)
kbufSize DWORD  ?

.code
main PROC
	call	InputTheString		; input the plain text

	pushad ; input the key
	mov	edx,OFFSET kPrompt
	call	WriteString
	mov	ecx,BUFMAX
	mov	edx,OFFSET kbuffer
	call	ReadString
	mov	kbufSize,eax
	call	Crlf
	popad

	call	TranslateBuffer	; encrypt the buffer
	mov	edx,OFFSET sEncrypt	; display encrypted message
	call	DisplayMessage
	call	TranslateBuffer  	; decrypt the buffer
	mov	edx,OFFSET sDecrypt	; display decrypted message
	call	DisplayMessage

	exit
main ENDP

;-----------------------------------------------------
InputTheString PROC
;
; Prompts user for a plaintext string. Saves the string 
; and its length.
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
	pushad
	mov	edx,OFFSET sPrompt	; display a prompt
	call	WriteString
	mov	ecx,BUFMAX		; maximum character count
	mov	edx,OFFSET buffer   ; point to the buffer
	call	ReadString         	; input the string
	mov	bufSize,eax        	; save the length
	call	Crlf
	popad
	ret
InputTheString ENDP

;-----------------------------------------------------
DisplayMessage PROC
;
; Displays the encrypted or decrypted message.
; Receives: EDX points to the message
; Returns:  nothing
;-----------------------------------------------------
	pushad
	call	WriteString
	mov	edx,OFFSET buffer	; display the buffer
	call	WriteString
	call	Crlf
	call	Crlf
	popad
	ret
DisplayMessage ENDP

;-----------------------------------------------------
TranslateBuffer PROC
;
; Translates the string by exclusive-ORing each
; byte with the encryption key byte.
; Receives: nothing
; Returns: nothing
;-----------------------------------------------------
	pushad
	mov	ecx,bufSize		; loop counter
	mov	esi,0			; index 0 in buffer
	mov ebx,0
L1:
	mov al,kbuffer[ebx]
	xor	buffer[esi],al	; translate a byte
	inc	esi				; point to next byte
	inc ebx
	cmp ebx,kbufSize
	je L2
	mov ebx,0
	L2: ; skips resetting ebx to 0
	loop	L1

	popad
	ret
TranslateBuffer ENDP
END main