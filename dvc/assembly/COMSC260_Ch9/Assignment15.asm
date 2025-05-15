; Assignment #: 15
; Program Description: get first position of source string in target string
; Author: Caden Pun (student: 2164581)
; Creation Date: 5/14/25
; Revisions: 0
; Date:              Modified by:

INCLUDE Irvine32.inc

.data
target BYTE "01ABAAAAAABABCC45ABC9012",0
source BYTE "AAABA",0

tString byte "The target string is: ",0
sString byte "The source string is: ",0
foundString1 byte "Source string found at position ",0
foundString2 byte " in Target string (counting from zero).",0
notfoundString byte "Source string not found in Target String.",0

Str_find PROTO, pTarget:PTR BYTE, pSource:PTR BYTE

.code
main PROC
mov edx,offset tString
call WriteString
mov edx,offset target
call WriteString
call Crlf
mov edx,offset sString
call WriteString
mov edx,offset source
call WriteString
call Crlf
call Crlf

invoke Str_find, addr target, addr source
jnz L1 ; source not found in target
mov edx,offset foundString1
call WriteString
call WriteDec
mov edx,offset foundString2
jmp L2
L1: mov edx,offset notfoundString
L2: call WriteString
call Crlf
call Crlf
call WaitMsg
	exit
main ENDP

Str_find proc, pTarget:PTR BYTE, pSource:PTR BYTE
;
; searches for the first matching occurrence of a source string inside a target string 
; and returns the matching position.
;
; Receives: a pointer to the source string and a pointer to the target string
; Returns: sets the Zero flag and EAX points to the matching position in the target string. 
;		   otherwise, the Zero flag is clear and EAX is undefined.
;
push ebx
push ecx
push esi
push edi
push eax

invoke Str_length, pTarget ; x
mov ebx,eax
invoke Str_length, pSource ; y
cmp ebx,eax
jl Early ; source longer than target (early exit)
sub ebx,eax
inc ebx ; x-y+1

mov esi,pSource
mov edi,pTarget
mov ecx,eax ; len source
cld

Search:
	pushad
	repe cmpsb
	popad
	je Found

	inc edi
	dec ebx ; cutoff index is loop counter
jnz Search

pop eax ; preserve eax if not found
add ebx,1 ; clear ZF
jmp Done

Found:
pop eax
sub edi,pTarget ; calc pos in target
mov eax,edi
xor ebx,ebx ; set ZF
jmp Done

Early: mov eax,0

Done:
pop edi
pop esi
pop ecx
pop ebx
ret
Str_find endp

END main