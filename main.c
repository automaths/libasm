#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

int ft_strlen(char *str);
int ft_write(int fd, char *str, int len);
int ft_read(int fd, char *str, int len);
int ft_strcmp(char *s1, char *s2);
char *ft_strcpy(char *dest, char *src, int n);
char *ft_strdup(char *src);

int main() {

    int a;
    a = ft_strlen("Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!");
    assert(a == 130);
    a = ft_strlen("");
    assert(a == 0);

    char *dest = (char *)malloc(130);
    char *src = "Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!";

    ft_strcpy(dest, "", 130);
    // ft_strcpy("", "", 130);
    ft_strcpy(dest, src, 130);
    assert(strcmp(dest, src) == 0);

    assert(ft_strcmp("Hello, World!", "Hello, World!") == 0);
    assert(ft_strcmp("Hello, World!", "Hello, Vorld!") == 1);
    // assert(ft_strcmp("Hello, Vorld!", "Hello, World!") == 1);
    assert(ft_strcmp("Hello, World!", "Hello, Uorld!") == 2);
    printf("Ft_strcmp empty first argument : %d\n", ft_strcmp("\0", "Hello, World!"));
    printf("Strcmp empty first argument : %d\n", strcmp("\0", "Hello, World!"));
    printf("Ft_strcmp empty second argument : %d\n", ft_strcmp("Hello, World!", "\0"));
    printf("Strcmp empty second argument : %d\n", strcmp("Hello, World!", "\0"));
    assert(ft_strcmp("", "") == 0);

    int ret = ft_write(1, "From write : Hello, World!", 26);
    assert(ret == 26);
    assert(errno == EXIT_SUCCESS);

    int fd = open("test.txt", O_RDWR, 0666);
    assert(fd != -1);
    ret = ft_write(fd, "Hello, World!", 13);
    assert(ret == 13);
    assert(errno == EXIT_SUCCESS);
    close(fd);

    ret = ft_write(-1, "Hello, World!", 13);
    assert(ret == -1);
    assert(errno == EXIT_FAILURE);

    fd = open("test.txt", O_CREAT | O_RDWR, 0666);
    char* buffer = (char *)malloc(14);
    buffer[13] = '\0';
    ret = ft_read(fd, buffer, 13);
    assert(errno == EXIT_SUCCESS);
    assert(ret == 13);
    assert(strcmp(buffer, "Hello, World!") == 0);
    printf("\nFrom read : %s\n", buffer);

    ret = ft_read(-1, buffer, 13);
    assert(ret == -1);
    assert(errno == EXIT_FAILURE);

    char *str = "Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!Hello, World!";
    char *str2 = ft_strdup(str);
    char *str3 = strdup("");
    assert(strcmp(str, str2) == 0);
    assert(ft_strlen(str3) == 0);

    printf("\nAll tests passed!\n");
    return 0;
}