; Assignment #: Lab Exercise 15
; Program Description: String Primitive Instructions Practices
; Author: Caden Pun (student: 2164581)
; Creation Date: 5/14/25
; Revisions: 0
; Date:              Modified by:

INCLUDE Irvine32.inc

.data
Sourcew WORD 10, 20, 30
Targetw WORD 10, 20, 35
WordArray WORD 10h, 20h, 30h, 40h

equalString byte "Source Array and Target Array are the same.",0
unequalString byte "Source Array and Target Array are NOT the same.",0
initvalString byte "Before searching, EDI is located at: ",0
searchString byte "Searching for the matched word: ",0
foundString byte "After searching, the matched word is located at: ",0
notfoundString byte "No matched word is found.",0

.code
main PROC
mov esi,offset Sourcew
mov edi,offset Targetw
mov ecx,lengthof Sourcew
repe cmpsw ; repeat til pair of words diff or ecx=0
jne L1
mov edx,offset equalString
jmp L2
L1: mov edx,offset unequalString
L2: call WriteString
call Crlf

mov edx,offset initvalString
call WriteString
mov eax,edi
call WriteHex
call Crlf

mov edx,offset searchString
call WriteString
mov eax,30h
call WriteHex
call Crlf
mov edi,offset WordArray
mov ecx,lengthof WordArray
cld
repne scasw
jnz L3 ; word not found
mov edx,offset foundString
sub edi,2 ; go back to address of word
mov eax,edi
call WriteString
call WriteHex
jmp L4
L3: mov edx,offset notfoundString
	call WriteString
L4:
	exit
main ENDP

END main