extern	__errno_location

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
    mov rdi, 1
	call __errno_location ; send ptr to errno on rax
	mov	[rax], rdi
	mov	rax, -1
    pop rbp
    ret
