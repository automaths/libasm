extern ft_strcpy
extern ft_write

section .data
    hello db 'Hello World!', 0
    hello2 db 'Yo mamen', 0

section .text
    global _start

_start:
    
    mov rdi, hello
    mov rsi, hello2
    mov rdx, 6
    call ft_strcpy
    
    ;mov rdi, hello
    ;mov rsi, 8
    mov rsi, 6
    call ft_write


    mov rax, 60
    xor rdi, rdi
    syscall


