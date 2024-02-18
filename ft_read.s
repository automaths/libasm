extern __errno_location

section .text
    global ft_read

ft_read:
    push rbp
    mov rbp, rsp
    mov rax, 0 ; syscall for read    
    ;rdi fd, rsi buffer, rdx size
    syscall
    test rax, rax       
    js .error
    mov rdi, 0
	call __errno_location ; send ptr to errno on rax
	mov	[rax], rdi
	mov	rax, rdx
    pop rbp
    ret

.error:
    mov rdi, 1
	call __errno_location ; send ptr to errno on rax
	mov	[rax], rdi
	mov	rax, -1
    pop rbp
    ret