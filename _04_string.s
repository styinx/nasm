; stringlen
; eax [in, out]
stringlen:
    push ebx
    mov ebx, eax

stringlen_loop:
    cmp byte [eax], 0
    jz stringlen_end

    inc eax
    jmp stringlen_loop

stringlen_end:
    sub eax, ebx
    pop ebx
    ret

; print
; eax [in]
print:
    push edx
    push ecx
    push ebx
    push eax

    call stringlen
    mov edx, eax                ; string length
    pop eax                     ; string address

    mov ecx, eax
    mov ebx, 1                  ; stdout
    mov eax, 4                  ; write
    int 0x80                    ; syscall interrupt

    pop ebx
    pop ecx
    pop ebx

    ret

; printNL
; eax [in]
printNL:
    call print

    push eax                    ; save eax

    mov eax, 0x0A               ; newline
    push eax                    ; save newline
    mov eax, esp                ; get address of newline

    call print

    pop eax                     ; remove newline
    pop eax                     ; restore eax

    ret

; exit
exit:
    mov ebx, 0                  ; exit code
    mov eax, 1                  ; exit
    int 0x80                    ; syscall interrupt
    ret


