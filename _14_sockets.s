%include '_04_string.s'

section .data:
    response db 'HTTP/1.1 200 OK', 0Dh, 0Ah, 'Content-Type: text/html', 0Dh, 0Ah, 'Content-Length: 14', 0Dh, 0Ah, 0Dh, 0Ah, 'Hello World!', 0Dh, 0Ah, 0h

section .bss:
    buffer resb 255,

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
    mov ecx, esp
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

_fork:
    mov esi, eax
    mov eax, 2          ; fork
    int 0x80

    cmp eax, 0          ; its the child process
    jz _read

    jmp _accept         ; parent process goes to back to accepting

_read:
    mov edx, 255
    mov ecx, buffer
    mov ebx, esi
    mov eax, 3          ; read
    int 0x80

    mov eax, buffer
    call printNL

_write:
    mov edx, 78         ; length of response
    mov ecx, response
    mov ebx, esi
    mov eax, 4          ; write
    int 0x80

_close:
    mov ebx, esi
    mov eax, 6          ; close
    int 0x80

_quit:
    call exit
