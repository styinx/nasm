%include '_04_string.s'

section .text:
    global _start

_start:
    xor eax, eax
    xor ebx, ebx
    xor edi, edi
    xor esi, esi

_create:
    push byte 6         ; tcp
    push byte 1         ; stream
    push byte 2         ; inet
    mov ecx, esp
    mov ebx, 1
    mov eax, 102        ; socketcall
    int 0x80

_bind:
    mov edi, eax
    push dword 0x0      ; 0.0.0.0
    push word 0x2923    ; 9001
    push word 2         ; af_inet
    mov ecx, esp
    push byte 16        ; argument length
    push ecx            ; address of arguments (SP)
    push edi            ; socket
    mov ecx, esp        ;
    mov ebx, 2          ; bind
    mov eax, 102        ; socketcall
    int 0x80

_listen:
    push byte 1         ; max queue length
    push edi
    mov ecx, esp
    mov ebx, 4          ; listen
    mov eax, 102        ; socketcall
    int 0x80

_accept:
    push byte 0         ; address length
    push byte 0         ; address
    push edi
    mov ecx, esp
    mov ebx, 5          ; accept
    mov eax, 102        ; socketcall
    int 0x80

_quit:
    call exit
