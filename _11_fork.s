%include '_04_string.s'

section .data
    child   db  'Child', 0x00
    parent  db  'Parent', 0x00

section .text
    global _start

_start:
    mov eax, 2              ; fork
    int 0x80

    cmp eax, 0              ; child process
    jz .child

.parent:
    mov eax, parent
    call printNL

    call exit

.child:
    mov eax, child
    call printNL

    call exit

