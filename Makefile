# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: user42 <pdiaz-pa@student.42madrid.com      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/09/29 11:52:10 by user42            #+#    #+#              #
#    Updated: 2020/09/29 11:52:37 by user42           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

SRCS =	ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s \
		ft_read.s \
		ft_strdup.s 

OBJS = $(SRCS:.s=.o)

%.o	: %.s
	nasm -felf64 $< -o $@

$(NAME): $(OBJS) 
	ar rcs $(NAME) $(OBJS)

all: $(NAME)

clean:
	rm -f $(OBJS)

try: all
	clang -Wall -Wextra -Werror -I. main.c -L. -lasm -o try_libasm
	./try_libasm

fclean: clean
	rm -f $(NAME)
	rm -f try_libasm
	rm -f write_tests

re: fclean all
