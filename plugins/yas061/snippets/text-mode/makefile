# -*- mode: snippet -*-
# name: makefile
# key: makefile
# binding: "keybinding"
# expand-env: ((some-var some-value))
# --

## 
## Made by alexandre strzelewicz
## Login   <strzel_a@epitech.net>
##

CC		= g++
NAME		= $1
SRCSC		= $2 \

DEF		= __$(HOSTTYPE)__
SRCSO		= $(SRCSC:.cpp=.o)
FLAGS		= -W -Wall
RM		= rm -rf
CFLAGS          += $(FLAGS) -o $@

.SUFFIXES   	: .c.o

$(NAME) 	: $(SRCSO)
		@ echo -e "\nFlag used with $(CC): \033[33m$(FLAGS)\033[m "
		@ echo -e "Executable name is: \033[33m$(NAME)\033[m"
		@ $(CC) -o $@ $(CFLAGS) $(SRCSO)
		@ echo -e "\n  \033[31m[OK]\033[m Compilation done. \n"

all		: $(NAME)

clean		:	
	 	@ $(RM) $(SRCSO)	
	 	@ echo -e "\n\033[31m[OK]\033[m CLEAN $(SRCSO)"

fclean		: clean
		@ $(RM) $(NAME)
		@ echo -e "\033[31m[OK]\033[m FCLEAN $(NAME)\n"

re		: fclean all

install		: makefilelib cleanlib all clean
	 	@ echo -e "\n\033[31;1m           ----> INSTALLATION COMPLETED <-----\033[0m\n"

.cpp.o		:
		@ $(CC) -o $@ -c $< $(CFLAGS)
		@ echo -e "\033[31m[OK]\033[m ---> $< "

.PHONY		: clean fclean

