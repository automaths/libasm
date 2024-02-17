section .text
    global ft_strcpy

ft_strcpy:
    push    rbp
    mov     rbp, rsp
    xor     rcx, rcx
    ;rdi dest, rsi src, rdx size

.loop:
    cmp     byte [rsi + rcx], 0
    je      .end
    cmp     rdx, rcx
    je      .end
    mov     r15b, byte [rsi + rcx]
    mov     byte [rdi + rcx], r15b
    inc     rcx
    jmp     .loop

.end:
    inc     rcx
    mov     byte [rdi + rcx], 0
    pop rbp
    ret













