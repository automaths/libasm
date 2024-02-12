; rax -> system call 1 write, 60 exit
; rdi -> first arg to the system call 
; rsi -> second arg to function or system call 
; rdx -> third arg to function or system call 
; xor rdi, rdi -> bitwise operation that set to 0 if same, used to reset register to known value
; push rbp -> pushes the value of the rbp register onto the stack




section .data
    ; Define some data
    my_data db 'Hello, World!', 0     ; Null-terminated string

section .text
global _start

_start:
    ; Print the string "Hello, World!" to stdout
    mov     rax, 1                  ; System call number for sys_write
    mov     rdi, 1                  ; File descriptor for stdout
    mov     rsi, my_data            ; Pointer to the string to print
    mov     rdx, 13                 ; Length of the string
    syscall                         ; Invoke the kernel

    ; Exit the program
    mov     rax, 60                 ; System call number for sys_exit
    xor     rdi, rdi                ; Exit code 0
    syscall                         ; Invoke the kernel