; print a number
; eax [in]
printi:
    push eax
    push ecx
    push edx
    push esi

    mov ecx, 0

printi_divide:
    inc ecx             ; its the nth digit

    mov edx, 0          ; store current digit
    mov esi, 10
    idiv esi            ; remainder
    add edx, 48         ; ASCII offset
    push edx

    cmp eax, 0
    jnz printi_divide

printi_loop:
    dec ecx             ; its the nth digit in reverse

    mov eax, esp        ; print the current digit
    call print
    pop eax

    cmp ecx, 0
    jnz printi_loop

    pop esi
    pop edx
    pop ecx
    pop eax
    ret

printiNL:
    call printi

    push eax
    mov eax, 0x0A
    push eax
    mov eax, esp
    call print
    pop eax
    pop eax
    ret
