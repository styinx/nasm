%include '_04_string.s'
%include '_07_numbers.s'

section .data
    fizz    db  'fizz ', 0x00
    buzz    db  'buzz ', 0x00

section .text
    global _start

_start:
    mov esi, 0
    mov edi, 0
    mov ecx, 0

.loop:
    inc ecx

.fizz:
    mov edx, 0
    mov eax, ecx
    mov ebx, 3
    div ebx
    cmp edx, 0
    jne .buzz
    mov eax, fizz
    call print

.buzz:
    mov edx, 0
    mov eax, ecx
    mov ebx, 5
    div ebx
    cmp edx, 0
    jne .number
    mov eax, buzz
    call print

.number:
    mov eax, ecx
    call printiNL

.next:
    cmp ecx, 20
    jne .loop

    call exit
