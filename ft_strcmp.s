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

.end:
    movsx   r12, byte [rdi + rax]  ; sign extend
    movsx   r13, byte [rsi + rax]  ; sign extend
    sub     r12, r13
    mov     rax, r12
    pop     rbp
    ret
