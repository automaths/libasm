extern ft_strcpy
extern ft_write
extern ft_read

section .bss
    output_buffer resb 64

section .data
    hello db 'Hello World!', 0
    hello2 db 'Yo mamen', 0

section .text
    global _start

_start:    
    mov rdi, 0
    mov rsi, output_buffer
    mov rdx, 10
    ;rdi fd, rsi buffer, rdx size
    call ft_read
    mov rdi, output_buffer
    mov rsi, 6
    call ft_write

    mov rax, 60
    xor rdi, rdi
    syscall


