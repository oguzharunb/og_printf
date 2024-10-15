COMPILER = cc
INCLUDES = ./includes/
SOURCE_DIR = ./srcs/
FLAG = -Wall -Werror -Wextra
NAME = og_printf.a
LIBFT = ./libft/libft.a
SRC_DIR = ./srcs
SRC =	og_bzero.c \
		og_fill_flag_bag.c \
		utils.c \
		og_length.c

OBJS = $(addprefix $(SRC_DIR)/, $(SRC:.c=.o))

all: $(NAME)

$(NAME): $(OBJS) $(LIBFT)
	ar -rcs $(NAME) $(OBJS) $(LIBFT)

$(LIBFT):
	make -C libft

%.o: %.c
	$(COMPILER) $(FLAG) -I $(INCLUDES) -c $< -o $@

clean:
	rm -f $(OBJS)
	make -C libft clean

fclean: clean
	rm -f $(NAME)
	make -C libft fclean

re: fclean all

.PHONY: all clean fclean re
