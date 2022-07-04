RED=$'\033[1;31m
GREEN=$'\033[1;32m
PURPLE=$'\033[1;35m

NAME = minishell

HEADER = ./include/minishell.h \

CC = gcc
FLAGS = -Wall -Wextra -Werror -g

LIBFT_DIR = libft
LIBFT_LIB = $(LIBFT_DIR)/libft.a

FILES = minishell.c\
		prompt.c\
		./tokenizer/lexer.c\
		./tokenizer/tokens_list_utils.c\
		./tokenizer/tokenizer.c\
		./tokenizer/tokenizer_functions.c\
		./tokenizer/tokenizer_functions2.c\
		./print/print_tokens.c\
		./syntax_/check_syntax.c\
		./syntax_/expand.c\
		./error_handler/error_handler.c\
		./executor/get_paths.c\
		./parser/parse_cmd.c\
		./parser/parse_cmd_utils.c\
		./print/print_cmd.c\
		./free/free_cmd.c\
		./free/free_tokens.c\
	
OBJ = $(FILES:%.c=%.o)

all : $(NAME)

$(NAME): $(OBJ) $(LIBFT_LIB) $(HEADER)
	@$(CC) $(OBJ) $(FLAGS) $(LIBFT_LIB) -o $(NAME) -L ./readline/lib -lreadline

%.o : %.c $(HEADER)
	@$(CC) -I ./readline/include -I./include $(FLAGS) -o $@ -c $<
	@echo "$(GREEN)" "compiling $<"

$(LIBFT_LIB):
	@$(MAKE) --no-print-directory -C $(LIBFT_DIR)
	
clean:
	@rm -rf $(OBJ)
	@$(MAKE) clean --no-print-directory -C $(LIBFT_DIR)
	@echo "$(RED)" "cleaning ..."

fclean : clean
	@rm -rf $(NAME) *.gch
	@$(MAKE) --no-print-directory fclean -C $(LIBFT_DIR)
	@echo "$(RED)" "full cleaning..."

re : fclean all
	@echo "$(PURPLE)" "remaking"

.PHONY: all clean fclean re bonus
