extern ft_strcpy
extern ft_write
extern ft_strlen
extern ft_strcmp
extern ft_read

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
    test_ft_strcpy_string_one db 'Hello World!Hello World!Hello World!Hello World!Hello World!', 0
    test_ft_strcpy_string_two db 'Ciaoo Bello!Ciaoo Bello!Ciaoo Bello!Ciaoo Bello!Ciaoo Bello!', 0

    result_ft_strcpy_empty_both db 'ft_strcpy fail on two empty args', 0
    result_ft_strcpy_same db 'ft_strcpy fail on two identical strings', 0
    result_ft_strcpy_empty_first db 'ft_strcpy fail on first empty arg', 0
    result_ft_strcpy_empty_second db 'ft_strcpy fail on second empty arg', 0
    result_ft_strcpy_copy db 'ft_strcpy fail on string copy', 0

    ; ft_write : check stdout
    test_ft_write_stdout db 'The write on stdout has succeeded', 0
    ; ft_write : check open file descriptor
    test_ft_write_filename db 'output.txt', 0
    test_ft_write_file db 'The write on file has succeeded', 0
    ; ft_write : check wrong file descriptor
    ; ft_write : check return value

    ; ft_read : read stdin

    test_ft_read_stdout_buffer db 64


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
    mov rdx, 65
    call ft_strcpy
    call ft_strcmp
    cmp rax, 0
    jne .ft_strcpy_empty_copy

    ; ft_write : check stdout
    mov rdi, 1 ; stdout
    mov rsi, test_ft_write_stdout
    mov rdx, 33
    call ft_write
    ; check the error code 

    ; ft_write : check open file descriptor
    mov rax, 2
    mov rdi, test_ft_write_filename
    mov rsi, 438 ; Equivalent to O_RDWR
    mov rdx, 420 ; File permission value 644
    syscall

    mov rdi, rax
    mov rsi, test_ft_write_file
    mov rdx, 33
    call ft_write

    ; ft_write : check wrong file descriptor

    mov rdi, -1 ; wrong file descriptor
    mov rsi, test_ft_write_file
    mov rdx, 33
    call ft_write

    ;cmp rax, -1       
    ;je .ft_strcpy_empty_copy   

    ; ft_write : check return value

    ; ft_read : read stdin
    ;mov rdi, 1
    ;mov rsi, test_ft_read_stdout_buffer
    ;mov rdx, 6
    ;call ft_read

    ;mov rdi, 1
    ;mov rsi, test_ft_read_stdout_buffer
    ;mov rdx, 6
    ;call ft_write

    ; ft_read : read open file descriptor

    ;mov rax, 2
    ;mov rdi, test_ft_write_filename
    ;mov rsi, 438 ; Equivalent to O_RDWR
    ;mov rdx, 420 ; File permission value 644
    ;syscall

    ;mov rdi, rax
    ;mov rsi, test_ft_read_stdout_buffer
    ;mov rdx, 33
    ;call ft_read

    ;mov rdi, 1
    ;mov rsi, test_ft_read_stdout_buffer
    ;mov rdx, 33
    ;call ft_write

    ; ft_read : read wrong file descriptor
    
    ;mov rdi, -1
    ;mov rsi, test_ft_read_stdout_buffer
    ;mov rdx, 33
    ;call ft_read

    ; ft_read : check the return value

    ; ft_strdup : check with empty string
    ; ft_strdup : check with long string

    ; test rax, rax ; Check if rax contains an error code
    ; js .error ; If negative, jump to error handling
    ; to access errno: mov rdi, rax; call perror

.exit:
    mov rax, 60
    xor rdi, rdi
    syscall

.ft_strlen_empty:
    mov rdi, 1
    mov rsi, result_ft_strlen_empty
    mov rdx, 30
    call ft_write
    jmp .exit

.ft_strlen_long:
    mov rdi, 1
    mov rsi, result_ft_strlen_long
    mov rdx, 29
    call ft_write
    jmp .exit

.ft_strcmp_empty_both:
    mov rdi, 1
    mov rsi, result_ft_strcmp_empty_both
    mov rdx, 29
    call ft_write
    jmp .exit

.ft_strcmp_same:
    mov rdi, 1
    mov rsi, result_ft_strcmp_same
    mov rdx, 29
    call ft_write
    jmp .exit

.ft_strcmp_comparison:
    mov rdi, 1
    mov rsi, result_ft_strcmp_comparison
    mov rdx, 29
    call ft_write
    jmp .exit

.ft_strcpy_empty_both:
    mov rdi, 1
    mov rsi, result_ft_strcpy_empty_both
    mov rdx, 29
    call ft_write
    jmp .exit

.ft_strcpy_empty_copy:
    mov rdi, 1
    mov rsi, result_ft_strcpy_copy
    mov rdx, 29
    call ft_write
    jmp .exit

