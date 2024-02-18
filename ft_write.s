section .data
    test_coucou db 'Coucou magl', 0

section .text
    global ft_write

ft_write:
    ; rdi fd, rsi: addr, rdx: length
    push rbp
    mov rbp, rsp
    mov rax, 1      ; write
    syscall

    test rax, rax       
    js .error

    pop rbp
    ret

.error:

    ;mov rax, 1
    ;mov rdi, 1
    ;mov rsi, test_coucou
    ;mov rdx, 15
    ;syscall
    pop rbp
    mov rax, -1
    ret
