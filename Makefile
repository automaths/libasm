NASM := nasm
LD := ld
NASMFLAGS := -f elf64
SRC := main.s \
		ft_strlen.s \
		ft_strcmp.s \
		ft_write.s \
		ft_strcpy.s \
		ft_read.s
NAME := test
OBJ := $(SRC:.s=.o)

all: $(NAME)

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

$(NAME): $(OBJ)
	$(LD) $^ -o $@

clean:
		rm -f $(OBJ)

fclean: clean
		rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re