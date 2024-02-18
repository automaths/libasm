extern malloc
extern ft_strlen
extern ft_strcpy
extern ft_write

section .text
    global ft_strdup

ft_strdup:
    push rbp
    mov rbp, rsp
    xor rax, rax

    mov r14, rdi ; save the string to duplicate


    call ft_strlen
    mov rdx, rax
    mov r13, rax

    mov rdi, rax              ; Length of the string
    add rdi, 1                ; Add 1 for null terminator
    call malloc               ; Call malloc to allocate memory
    test rax, rax             ; Check if allocation was successful
    je malloc_failed


    ;xor rcx, rcx              ; Clear rcx (loop counter)


    mov rsi, r14 ; src ptr arg ptr
    mov rdi, rax ; dest ptr newly alloc ptr
    mov rdx, r13
    ; rdx size already set
    call ft_strcpy

    jmp end

malloc_failed:
    xor rax, rax              ; Return NULL
    jmp end

end:
    pop rbp
    ret

