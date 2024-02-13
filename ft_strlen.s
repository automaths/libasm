section .text
    global ft_strlen

ft_strlen:
    push    rbp
    mov     rbp, rsp
    xor     rax, rax

.loop:
    cmp     byte [rdi + rax], 0
    je      .end
    inc     rax
    jmp     .loop

.end:
    pop     rbp
    ret