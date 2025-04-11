; Assignment #: 10
; Program Description: boolean operation menu
; Author: Caden Pun (student: 2164581)
; Creation Date: 4/10/25
; Revisions: 0
; Date:              Modified by:

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword
INCLUDE Irvine32.inc

.data
; INITIAL MENU STRINGS
headerString byte "---- Boolean Calculator ----------",0
option1String byte "1. x AND y",0
option2String byte "2. x OR y",0
option3String byte "3. NOT x",0
option4String byte "4. x XOR y",0
option5String byte "5. Exit program",0
optionStrings dword OFFSET option1String, 
                    OFFSET option2String, 
                    OFFSET option3String, 
                    OFFSET option4String, 
                    OFFSET option5String
choiceString byte "Enter integer> ",0
errString byte "Invalid Input! Enter 1 ~ 5 only",0

; SWITCH STATEMENT TABLE
caseTable byte 1 
          dword AND_op
entrySize = ($ - caseTable)
          byte 2 
          dword OR_op 
          byte 3 
          dword NOT_op 
          byte 4 
          dword XOR_op
tableLength = ($ - caseTable) / entrySize

; OUTPUT STRINGS FOR BOOLEAN OPERATIONS
firstString byte "Input the first 32-bit hexadecimal operand: ",0
secondString byte "Input the second 32-bit hexadecimal operand: ",0
result byte "The 32-bit hexadecimal result is: ",0
andString byte "Boolean AND",0
orString byte "Boolean OR",0
notString byte "Boolean NOT",0
xorString byte "Boolean XOR",0

.code
main proc
.WHILE eax != 5
    mov  edx, OFFSET headerString
    call WriteString
    call Crlf
    call Crlf

    ; ITERATE THRU OPTION STRINGS
    mov ecx, LENGTHOF optionStrings
    mov esi, OFFSET optionStrings
    L1:
        mov edx, [esi]
        call WriteString
        call Crlf
        add esi, TYPE optionStrings
        loop L1

    call Crlf
    mov edx, OFFSET choiceString
    call WriteString
    call ReadInt

    ; HANDLE OUT OF BOUNDS INTS AND QUIT OPTION
    .IF eax > 5 || eax < 1
        mov edx, OFFSET errString
        call WriteString
        call Crlf
        .CONTINUE
    .ELSEIF eax == 5
        .BREAK
    .ENDIF

    ; SWITCH STATEMENT IMPLEMENTATION
    pushad
    mov ebx, OFFSET caseTable
    mov ecx, tableLength

    L2: cmp al, [ebx]
        jne L3
        call NEAR PTR [ebx + 1]
        call Crlf
        jmp L4
    L3: add ebx, entrySize
        loop L2
    L4:
    popad

    .ENDW
	Invoke ExitProcess,0
main endp

; Prompt the user for two hexadecimal integers. AND them together and display the result in hexadecimal.
AND_op proc uses eax ebx
mov  edx, OFFSET firstString
call WriteString
call ReadHex
mov ebx, eax

mov edx, OFFSET secondString
call WriteString
call ReadHex

call Crlf
mov edx, OFFSET andString
call WriteString
call Crlf
mov edx, OFFSET result
call WriteString
and eax, ebx
call WriteHex

ret
AND_op endp

; Prompt the user for two hexadecimal integers. OR them together and display the result in hexadecimal.
OR_op proc uses eax ebx
mov  edx, OFFSET firstString
call WriteString
call ReadHex
mov ebx, eax

mov edx, OFFSET secondString
call WriteString
call ReadHex

call Crlf
mov edx, OFFSET orString
call WriteString
call Crlf
mov edx, OFFSET result
call WriteString
or eax, ebx
call WriteHex

ret
OR_op endp

; Prompt the user for a hexadecimal integer. NOT the integer and display the result in hexadecimal.
NOT_op proc uses eax
mov  edx, OFFSET firstString
call WriteString
call ReadHex

call Crlf
mov edx, OFFSET notString
call WriteString
call Crlf
mov edx, OFFSET result
call WriteString
not eax
call WriteHex

ret
NOT_op endp

; Prompt the user for two hexadecimal integers. Exclusive-OR them together and display the result in hexadecimal.
XOR_op proc uses eax ebx
mov  edx, OFFSET firstString
call WriteString
call ReadHex
mov ebx, eax

mov edx, OFFSET secondString
call WriteString
call ReadHex

call Crlf
mov edx, OFFSET xorString
call WriteString
call Crlf
mov edx, OFFSET result
call WriteString
xor eax, ebx
call WriteHex

ret
XOR_op endp

end main