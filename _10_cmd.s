%include '_04_string.s'

section .data
    command     db  '/bin/echo', 0x00
    arg1        db  'Hello', 0x00
    arguments   dd  command
                dd  arg1
                dd  0x00
    environment dd  0x00

section .text
    global _start

_start:
    mov edx, environment
    mov ecx, arguments
    mov ebx, command
    mov eax, 11             ; execve
    int 0x80

    call exit

