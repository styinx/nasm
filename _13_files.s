%include '_04_string.s'

section .data
    filename    db  'readme.txt', 0x00
    contents    db  'hello world', 0x00
    append      db  ' and some more', 0x00

section .text
    global _start

_start:
    mov ecx, 777o           ; read, write, execute
    mov ebx, filename
    mov eax, 8              ; create
    int 0x80

    mov edx, 12
    mov ecx, contents
    mov ebx, eax
    mov eax, 4              ; write
    int 0x80

    mov ecx, 2              ; 0 = readonly, 1 = writeonly, 2 = readwrite
    mov ebx, filename
    mov eax, 5              ; open
    int 0x80

    mov edx, 12
    mov ecx, contents
    mov ebx, eax
    mov eax, 3              ; read
    int 0x80

    ;mov eax, contents
    ;call printNL

    ;mov ebx, ebx
    ;mov eax, 6              ; close
    ;int 0x80

    mov edx, 2              ; seek_end
    mov ecx, 0
    mov ebx, ebx
    mov eax, 19             ; lseek
    int 0x80

    mov edx, 14
    mov ecx, append
    mov ebx, ebx
    mov eax, 4              ; write
    int 0x80

    mov ebx, filename
    mov eax, 10             ; unlink
    int 0x80

    call exit

