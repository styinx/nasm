section .data
    string: db `hello brave new world\n`

section .text
    global _start

_start:
    mov ebx, string             ; address of string
    mov eax, ebx

loop:
    cmp byte [eax], 0           ; compare current byte to 0
    jz print                    ; jump if zero
    inc eax
    jmp loop

print:
    sub eax, ebx                ; determine string length

    mov edx, eax
    mov ecx, string
    mov ebx, 1                  ; stdout
    mov eax, 4                  ; write
    int 0x80

    jmp _end

_end:
    mov ebx, 0                  ; exit code = 0
    mov eax, 1                  ; exit
    int 0x80
