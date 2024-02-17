section .text
    global ft_read

ft_read:
    push rbp
    mov rbp, rsp
    ;rdi fd, rsi buffer, rdx size
    mov rax, 0    
    syscall
    pop rbp
    ret