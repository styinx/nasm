; convert ascii string to number
; eax [in, out]
atoi:
    push ebx
    push ecx
    push edx
    push esi

    mov esi, eax
    mov eax, 0
    mov ecx, 0

atoi_multiply:
    xor ebx, ebx
    mov bl, [esi + ecx]
    cmp bl, 48          ; > '0'
    jl atoi_end
    cmp bl, 57          ; < '9'
    jg atoi_end

    sub bl, 48          ; value of digit
    add eax, ebx
    mov ebx, 10
    mul ebx
    inc ecx
    jmp atoi_multiply

atoi_end:
    cmp ecx, 0
    je atoi_restore
    mov ebx, 10
    div ebx

atoi_restore:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret

