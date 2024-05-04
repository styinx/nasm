%include '_04_string.s'

section .data
    filename    db  'readme.txt', 0x00

section .text
    global _start

_start:
    mov ecx, 777o           ; read, write, execute
    mov ebx, filename
    mov eax, 8              ; create
    int 0x80

    call exit

