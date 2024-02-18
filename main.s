extern ft_strcpy
extern ft_write
extern ft_strlen
extern ft_strcmp
extern print_number

section .data

    test_ft_strlen_empty db '', 0
    test_ft_strlen_long db 'abcdefghijklmnopqrstuvwxyz', 0

    result_ft_strlen_empty db 'ft_strlen fail on empty string', 0
    result_ft_strlen_long db 'ft_strlen fail on long string', 0

    test_ft_strcmp_empty_one db '', 0
    test_ft_strcmp_empty_two db '', 0
    test_ft_strcmp_string_one db 'Hello World!', 0
    test_ft_strcmp_string_one_same db 'Hello World!', 0
    test_ft_strcmp_string_two db 'Hello Vorld!', 0
    test_ft_strcmp_string_three db 'Hello Uorld!', 0

    result_ft_strcmp_empty_both db 'ft_strcmp fail on two empty args', 0
    result_ft_strcmp_same db 'ft_strcmp fail on identical strings', 0
    result_ft_strcmp_comparison db 'ft_strcmp fail on string comparison', 0

    test_ft_strcpy_empty_one db '', 0
    test_ft_strcpy_empty_two db '', 0
    test_ft_strcpy_string_one db 'Hello World!', 0
    test_ft_strcpy_string_two db 'Ciaoo Bello!', 0

    result_ft_strcpy_empty_both db 'ft_strcpy fail on two empty args', 0
    result_ft_strcpy_same db 'ft_strcpy fail on two identical strings', 0
    result_ft_strcpy_empty_first db 'ft_strcpy fail on first empty arg', 0
    result_ft_strcpy_empty_second db 'ft_strcpy fail on second empty arg', 0
    result_ft_strcpy_copy db 'ft_strcpy fail on string copy', 0

    ; ft_write : check stdout
    ; ft_write : check open file descriptor
    ; ft_write : check wrong file descriptor
    ; ft_write : check return value

    ; ft_read : read stdin
    ; ft_read : read open file descriptor
    ; ft_read : read wrong file descriptor
    ; ft_read : check the return value

    ; ft_strdup : check with empty string
    ; ft_strdup : check with long string
    

section .text
    global _start

_start:

    ; ft_strlen : check empty string
    mov rdi, test_ft_strlen_empty
    call ft_strlen
    cmp rax, 0
    jne .ft_strlen_empty

    ; ft_strlen : check long string
    mov rdi, test_ft_strlen_long
    call ft_strlen
    cmp rax, 26
    jne .ft_strlen_long

    ; ft_strcmp : check two empty strings
    mov rdi, test_ft_strcmp_empty_one
    mov rsi, test_ft_strcmp_empty_two
    call ft_strcmp
    cmp rax, 0
    jne .ft_strcmp_empty_both

    ; ft_strcmp : check two same strings
    mov rdi, test_ft_strcmp_string_one
    mov rsi, test_ft_strcmp_string_one_same
    call ft_strcmp
    cmp rax, 0
    jne .ft_strcmp_empty_both

    ; ft_strcmp : check multiple strings
    mov rdi, test_ft_strcmp_string_one
    mov rsi, test_ft_strcmp_string_two
    call ft_strcmp
    cmp rax, 1
    jne .ft_strcmp_comparison

    ; ft_strcmp : check multiple strings
    mov rdi, test_ft_strcmp_string_one
    mov rsi, test_ft_strcmp_string_three
    call ft_strcmp
    cmp rax, 2
    jne .ft_strcmp_comparison

    ; ft_strcpy : check empty string
    mov rdi, test_ft_strcpy_empty_one
    mov rsi, test_ft_strcpy_empty_two
    call ft_strcpy

    ; ft_strcpy : check long string
    mov rdi, test_ft_strcpy_string_one
    mov rsi, test_ft_strcpy_string_two
    mov rdx, 13
    call ft_strcpy
    call ft_strcmp
    cmp rax, 0
    jne .ft_strcpy_empty_copy

    ; ft_write : check stdout
    ; ft_write : check open file descriptor
    ; ft_write : check wrong file descriptor
    ; ft_write : check return value

    ; ft_read : read stdin
    ; ft_read : read open file descriptor
    ; ft_read : read wrong file descriptor
    ; ft_read : check the return value

    ; ft_strdup : check with empty string
    ; ft_strdup : check with long string

.exit:
    mov rax, 60
    xor rdi, rdi
    syscall

.ft_strlen_empty:
    mov rdi, result_ft_strlen_empty
    mov rsi, 30
    call ft_write
    jmp .exit

.ft_strlen_long:
    mov rdi, result_ft_strlen_long
    mov rsi, 29
    call ft_write
    jmp .exit

.ft_strcmp_empty_both:
    mov rdi, result_ft_strcmp_empty_both
    mov rsi, 29
    call ft_write
    jmp .exit

.ft_strcmp_same:
    mov rdi, result_ft_strcmp_same
    mov rsi, 29
    call ft_write
    jmp .exit

.ft_strcmp_comparison:
    mov rdi, result_ft_strcmp_comparison
    mov rsi, 29
    call ft_write
    jmp .exit

.ft_strcpy_empty_both:
    mov rdi, result_ft_strcpy_empty_both
    mov rsi, 29
    call ft_write
    jmp .exit

.ft_strcpy_empty_copy:
    mov rdi, result_ft_strcpy_copy
    mov rsi, 29
    call ft_write
    jmp .exit


