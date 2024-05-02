%include '_04_string.s'

section .data
    string1     db      `Hey ho, let's go.\n`, 0x00
    string2     db      `This is the end.\n`, 0x00
    string3     db      `There is more.`, 0x00
    string4     db      `Keep it coming.`, 0x00

section .text
    global _start

_start:
    mov eax, string1
    call print

    mov eax, string2
    call print

    mov eax, string3
    call printNL

    mov eax, string4
    call printNL

    call exit
