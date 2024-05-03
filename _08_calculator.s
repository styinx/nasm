%include '_04_string.s'
%include '_07_numbers.s'
%include '_08_math.s'

section .text
    global _start

_start:
    pop ecx         ; argc
    pop edx         ; program name

    sub ecx, 1
    mov edx, 0

loop:
    cmp ecx, 0
    jz end

    pop eax         ; nth argument
    call atoi
    add edx, eax
    dec ecx
    jmp loop

end:
    mov eax, edx
    call printiNL
    call exit

