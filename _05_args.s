%include '_04_string.s'

section .text
    global _start

_start:
    pop ecx             ; argc

loop:
    cmp ecx, 0x00
    jz end

    pop eax
    call printNL

    dec ecx
    jmp loop

end:
    call exit
