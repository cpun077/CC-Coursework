; Assignment #: 12
; Program Description: adding arbitary packed integers
; Author: Caden Pun (student: 2164581)
; Creation Date: 4/23/25
; Revisions: 0
; Date:              Modified by:

INCLUDE Irvine32.inc

.data
packed_1a WORD 4536h
packed_1b WORD 7297h
sum_1 DWORD 0

packed_2a DWORD 67345620h
packed_2b DWORD 54496342h
sum_2 DWORD 2 DUP(0)

packed_3a QWORD 6734562000346521h
packed_3b QWORD 5449634205738261h
sum_3 DWORD 3 DUP(0)

.code
main PROC
	mov esi,OFFSET packed_1a
	mov edi,OFFSET packed_1b
	mov edx,OFFSET sum_1
	mov ecx,SIZEOF packed_1a
	call AddPacked
	mov	eax,sum_1
	call WriteHex
	call Crlf

	mov esi,OFFSET packed_2a
	mov edi,OFFSET packed_2b
	mov edx,OFFSET sum_2
	mov ecx,SIZEOF packed_2a
	call AddPacked
	mov ecx,LENGTHOF sum_2
	mov esi,OFFSET sum_2 + SIZEOF sum_2
L2: sub esi,4
	mov	eax,[esi]
	call WriteHex
	loop L2
	call Crlf

	mov esi,OFFSET packed_3a
	mov edi,OFFSET packed_3b
	mov edx,OFFSET sum_3
	mov ecx,SIZEOF packed_3a
	call AddPacked
	mov ecx,LENGTHOF sum_3
	mov esi,OFFSET sum_3 + SIZEOF sum_3
L3: sub esi,4
	mov	eax,[esi]
	call WriteHex
	loop L3
	call Crlf

	exit
main ENDP

AddPacked PROC
;
; adds two packed decimal integers of arbitrary size 
; (both lengths must be the same)
; Receives: ESI - pointer to the first number
;			EDI - pointer to the second number
;			EDX - pointer to the sum
;			ECX - number of bytes to add
; Returns: resulting sum in EDX

pushad
dec ecx

; Add low bytes.
	mov	al,[esi]
	add	al,[edi]
	daa
	mov	[edx],al
	
; Add high bytes, include carry.
L1: inc	esi
	inc edi
	inc edx
	mov	al,[esi]
	adc	al,[edi]
	daa
	mov	[edx],al
	loop L1

; Add final carry, if any.
	inc	edx
	mov	al,0
	adc	al,0
	mov	[edx],al

popad
ret
AddPacked ENDP

END main