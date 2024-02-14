NASM := nasm
LD := ld
NASMFLAGS := -f elf64
SRC := main.s \
		ft_strlen.s
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