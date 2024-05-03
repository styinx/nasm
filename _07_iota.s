%include '_04_string.s'
%include '_07_numbers.s'

section .text
    global _start

_start:
    mov ecx, 0x00

loop:
    inc ecx

    mov eax, ecx
    call printiNL

    cmp ecx, 10
    jne loop

    call exit
