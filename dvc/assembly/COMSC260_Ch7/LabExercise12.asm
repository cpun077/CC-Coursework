; Assignment #: Lab Exercise 12
; Program Description: subtracts two binary integers of any same multiples of 32 bits
; Author: Caden Pun (student: 2164581)
; Creation Date: 4/23/25
; Revisions: 0
; Date:              Modified by:

INCLUDE Irvine32.inc

.data
op1 QWORD 0A2B2A40674981234h
op2 QWORD 080108700B0234502h
result QWORD 1 DUP(0)			; = 22A21D05C474CD32h

msg BYTE "The difference equals ",0

; Count the number of doublewords in each operand.
DoubleWords = SIZEOF op1 / TYPE DWORD

.code
main PROC

	mov  esi, OFFSET op1		; first operand
	mov  edi, OFFSET op2		; second operand
	mov  ebx, OFFSET result		; result
	mov  ecx, DoubleWords		; number of doublewords
	call Extended_Sub

	mov	edx, OFFSET msg		; message to display
	call WriteString

	mov	esi, OFFSET result		; starting address of result
	add	esi, DoubleWords * 4	; move to end of last dword in result
	mov	ecx, DoubleWords		; number of doublewords

L1:	sub	esi, TYPE DWORD		; previous dword (little endian order)
	mov	eax, [esi]			; get 32 bits of result
	call WriteHex				; display on the screen
	loop L1

	call Crlf
	exit
main ENDP

;--------------------------------------------------------
Extended_Sub PROC
;
; Subtracts two binary integers whose size is a multiple
; of 32-bits.
; Receives: ESI and EDI point to the two integers,
; 	EBX points to a variable that will hold the result, and
; 	ECX indicates the size of operands (multiple of 32 bits).
; Returns: nothing
;--------------------------------------------------------

    pushad
    clc
	shl ecx, 2 ; get num bytes from size (1 dword = 4 bytes)

L2: mov al, [esi]
    sbb al, [edi]
    mov [ebx], al
    inc esi
    inc edi
    inc ebx
    loop L2

    popad
    ret

Extended_Sub ENDP

END main
