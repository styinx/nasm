%include '_04_string.s'

section .data
    prompt      db      'Name: ', 0x00
    greet       db      'Hello ', 0x00

section .bss
    input:      resb    255

section .text
    global _start

_start:
    mov eax, prompt
    call print

    mov edx, 255        ; number of bytes to read
    mov ecx, input      ; address to buffer
    mov ebx, 0          ; stdin
    mov eax, 3          ; read
    int 0x80            ; syscall interrupt

    mov eax, greet
    call print

    mov eax, input
    call print

    call exit
