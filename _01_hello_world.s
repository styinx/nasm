section .data
    string: db `hello world\n`
    length: equ $ - string

section .text
    global _start

_start:
    mov edx, length
    mov ecx, string
    mov ebx, 1                  ; stdout
    mov eax, 4                  ; write
    int 0x80

    mov ebx, 0                  ; exit code = 0
    mov eax, 1                  ; exit
    int 0x80
