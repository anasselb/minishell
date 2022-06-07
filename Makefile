# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eel-ghan <eel-ghan@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/23 03:45:02 by barae             #+#    #+#              #
#    Updated: 2022/06/07 15:27:44 by eel-ghan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minishell

LEX_DIR = srcs/Parsing/Lexer/

PARS_DIR = srcs/Parsing/Parser/

SRCS =	minishell.c ${LEX_DIR}lexer.c ${LEX_DIR}token.c ${LEX_DIR}lexer_utils00.c\
		${LEX_DIR}lexer_utils01.c ${LEX_DIR}redirection_utils.c\
		${LEX_DIR}dollar_utils.c ${PARS_DIR}parser.c ${PARS_DIR}struct_cmd.c\
		${PARS_DIR}linked_list_utils.c ${PARS_DIR}parser_utils00.c\
		

OBJS = ${SRCS:.c=.o}

OBJS = ${SRCS:.c=.o}

CC = @gcc

CFLAGS = -Wall -Wextra -Werror #-fsanitize=address -g3

RM = @rm -f

libft = srcs/Libft/libft.a

INCLUDE = -lreadline

${NAME} : ${OBJS}
	@make -C srcs/Libft
	${CC} ${libft} -o ${NAME} ${OBJS} ${INCLUDE}
#	${CC} ${CFLAGS} ${SRCS} ${libft} -o ${NAME} ${INCLUDE}
	@tput setaf 2; echo "MINISHELL IS READY"

all : ${NAME}

clean :
	${RM} ${OBJS}
	@make clean -C srcs/Libft
	@tput setaf 1; echo "OBJECTS REMOVED"

fclean : clean
	${RM} ${NAME}
	${RM} ${libft}
	@tput setaf 1; echo "MINISHELL REMOVED"

re : fclean all

.phony: all clean fclean re
