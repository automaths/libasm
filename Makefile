NAME = libasm.a
SRC = ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_read.s \
		ft_write.s \
		ft_strdup.s 
NASMFLAG = nasm -g -f elf64 
OBJ = ${SRC:.s=.o}

all: $(NAME)

.s.o:
		$(NASMFLAG) $<
		ar rcs $(NAME) $@

$(NAME):	$(OBJ)

test:	main.c $(NAME)
	gcc -g -no-pie main.c $(NAME) -o unit_test

clean:
		rm -rf $(OBJ)

fclean: clean
		rm -rf $(NAME) unit_test

re: fclean bin

.PHONY: all clean fclean re bonus