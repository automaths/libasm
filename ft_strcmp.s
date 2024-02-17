extern ft_write

section .data
    warning db 'coucou', 0

section .text
    global ft_strcmp

ft_strcmp:
    push    rbp
    mov     rbp, rsp
    xor     rax, rax

.loop:
    cmp     byte [rdi + rax], 0
    je      .end
    cmp     byte [rsi + rax], 0
    je      .end
    mov     r15b, byte [rdi + rax]
    cmp     byte [rsi + rax], r15b
    jne     .end
    inc     rax
    jmp     .loop

.warn:
    mov rdi, warning
    mov rsi, 6
    call ft_write
    pop     rbp
    ret

.end:

    ;cmp rax, 0
    ;je .warn
    mov     bl, byte [rdi + rax]
    sub     bl, byte [rsi + rax]
    xor     rax, rax
    mov     al, bl
    pop     rbp
    ret
