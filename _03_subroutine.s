section .data
    string: db `hello brave new world\n`

section .text
    global _start

_start:
    mov eax, string             ; address of string
    call strlen

    jmp print

strlen:
    push ebx
    mov ebx, eax                ; save string address

loop:
    cmp byte [eax], 0           ; compare current byte to 0
    jz finished                 ; jump if zero
    inc eax
    jmp loop

finished:
    sub eax, ebx                ; determine string length
    pop ebx
    ret                         ; return to call

print:
    mov edx, eax
    mov ecx, string
    mov ebx, 1                  ; stdout
    mov eax, 4                  ; write
    int 0x80

_end:
    mov ebx, 0                  ; exit code = 0
    mov eax, 1                  ; exit
    int 0x80
