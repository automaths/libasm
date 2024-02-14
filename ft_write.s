section .text
    global ft_write

ft_write:
    ; rdi: addr, rsi: length
    push rbp
    mov rbp, rsp
    mov rcx, rdi ; tmp arg1
    mov r8, rsi ; tmp arg2
    mov rax, 1      ; write
    mov rdi, 1      ; stdout
    mov rsi, rcx    ; address
    mov rdx, r8    ; length
    syscall
    pop rbp
    ret