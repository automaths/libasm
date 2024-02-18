;RBX, RSP, RBP, and R12–R15,

section .text
    global ft_strcpy

ft_strcpy:
    push    rbp
    mov     rbp, rsp
    xor     rcx, rcx
    test rdi, rdi 
    je .end
    test rsi, rsi 
    je .end
    ;rdi dest, rsi src, rdx size

.loop:
    cmp     byte [rsi + rcx], 0
    je      .close_str
    cmp     rdx, rcx
    je      .close_str
    mov     r15b, byte [rsi + rcx]
    mov     byte [rdi + rcx], r15b
    inc     rcx
    jmp     .loop

.close_str:
    mov     byte [rdi + rcx], 0

.end:
    xor r15b, r15b
    pop rbp
    ret











