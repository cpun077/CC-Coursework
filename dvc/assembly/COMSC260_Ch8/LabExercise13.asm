; Assignment #: Lab Exercise 13
; Program Description: 3 ArrayFill implementations
; Author: Caden Pun (student: 2164581)
; Creation Date: 5/1/25
; Revisions: 0
; Date:              Modified by:

INCLUDE Irvine32.inc

.data
count = 25
array DWORD count DUP(?)
prompt1 BYTE "===The output from ArrayFill1===",0
prompt2 BYTE "===The output from ArrayFill2===",0
prompt3 BYTE "===The output from ArrayFill3===",0

.code
main PROC
mov edx, OFFSET prompt1
call WriteString
call Crlf

push OFFSET array
push count
call ArrayFill1
mov ecx, count
mov esi, 0
L1: mov eax, array[esi]
	call WriteInt
	call CRLF
	add esi, TYPE array
loop L1
call Crlf

mov edx, OFFSET prompt2
call WriteString
call Crlf

push OFFSET array
push count
call ArrayFill2
mov ecx, count
mov esi, 0
L2: mov eax, array[esi]
	call WriteInt
	call CRLF
	add esi, TYPE array
loop L2
call Crlf

mov edx, OFFSET prompt3
call WriteString
call Crlf

push OFFSET array
push count
call ArrayFill3
mov ecx, count
mov esi, 0
L3: mov eax, array[esi]
	call WriteInt
	call CRLF
	add esi, TYPE array
loop L3

	exit
main ENDP

ArrayFill1 PROC
;
; fill array with random ints using push/pop
;
; Receives: array offset and count from stack
; Returns: nothing but alters array contents

push ebp
mov ebp, esp
sub esp, 8
mov DWORD PTR [ebp - 4], -100
mov DWORD PTR [ebp - 8], 200

pushad
mov esi,[ebp + 12] ; offset
mov ecx,[ebp + 8] ; count

.if ecx == 0
	jmp clean
.endif

.while ecx > 0
	mov eax,[ebp - 8] ; upper

	sub eax, [ebp - 4]
	call RandomRange
	add eax, [ebp - 4]

	mov [esi], eax
	add esi,TYPE DWORD
	dec ecx
.endw

clean: popad
	   mov esp, ebp 
	   pop ebp
	   ret 8
ArrayFill1 ENDP

ArrayFill2 PROC
;
; fill array with random ints using enter/leave
;
; Receives: array offset and count from stack
; Returns: nothing but alters array contents

enter 8, 0
mov DWORD PTR [ebp - 4], -100
mov DWORD PTR [ebp - 8], 200

pushad
mov esi,[ebp + 12] ; offset
mov ecx,[ebp + 8] ; count

.if ecx == 0
	jmp clean
.endif

.while ecx > 0
	mov eax,[ebp - 8] ; upper

	sub eax, [ebp - 4]
	call RandomRange
	add eax, [ebp - 4]

	mov [esi], eax
	add esi,TYPE DWORD
	dec ecx
.endw

clean: popad
	   leave
	   ret 8
ArrayFill2 ENDP

ArrayFill3 PROC
;
; fill array with random ints using local
;
; Receives: array offset and count from stack
; Returns: nothing but alters array contents

local LOWER:DWORD, UPPER:DWORD
mov LOWER, -100
mov UPPER, 200

pushad
mov esi,[ebp + 12] ; offset
mov ecx,[ebp + 8] ; count

.if ecx == 0
	jmp clean
.endif

.while ecx > 0
	mov eax,UPPER

	sub eax, LOWER
	call RandomRange
	add eax, LOWER

	mov [esi], eax
	add esi,TYPE DWORD
	dec ecx
.endw

clean: popad
	   ret 8
ArrayFill3 ENDP

END main