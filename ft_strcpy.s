;int	ft_strlcpy(char *dest, const char *src, size_t n)
;{
;	size_t	i;
;
;	if (n == 0 || !dest || !src)
;		return (ft_strlen(src));
;	i = 0;
;	while (src[i] && i < (n - 1))
;	{
;		dest[i] = src[i];
;		i++;
;	}
;	dest[i] = '\0';
;	return (ft_strlen(src));
;}

section .text
    global ft_strcpy

ft_strcpy:
    push    rbp
    mov     rbp, rsp
    xor     rcx, rcx
    ;rdi dest, rsi src, rdx size

.loop:
    cmp     byte [rsi + rcx], 0
    je      .end
    cmp     rdx, rcx
    je      .end
    mov     r15b, byte [rsi + rcx]
    mov     byte [rdi + rcx], r15b
    inc     rcx
    jmp     .loop

.end:
    inc     rcx
    mov     byte [rdi + rcx], 0
    pop rbp
    ret













