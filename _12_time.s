%include '_04_string.s'
%include '_07_numbers.s'

section .data
    msg     db  'Seconds since birth: ', 0x00

section .text
    global _start

_start:
    mov eax, msg
    call print

    mov eax, 13         ; time
    int 0x80

    call printiNL
    call exit

