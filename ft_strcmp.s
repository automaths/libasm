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

    mov     bl, byte [rdi + rax]
    sub     bl, byte [rsi + rax]
    xor     rax, rax
    mov     al, bl
    pop     rbp
    ret
