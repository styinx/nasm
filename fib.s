%include '_04_string.s'
%include '_07_numbers.s'

section .text
    global _start

_start:
    mov ecx, 0x07
    mov eax, 0x00
    mov ebx, 0x01
    mov edx, 0x00

    cmp ecx, 0
    jz end

    cmp ecx, 1
    jz one

    jmp loop

one:
    mov edx, 0x01
    jmp end

loop:
    cmp ecx, 0
    jz end

    mov eax, edx
    add edx, ebx
    mov ebx, eax

    dec ecx
    jmp loop

end:
    mov eax, edx
    call printiNL
    call exit

