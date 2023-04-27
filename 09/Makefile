CC=gcc
EXEC=toto
SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)
CFLAGS=-Wall -Wextra -Werror -Wpedantic -std=c11 -g
LFLAGS=-lm
all: $(EXEC) 
-include $(OBJS:.o=.d)
%.o: %.c 
	$(CC) $(CFLAGS) -c $< -o$@ -MD
$(EXEC): $(OBJS) 
	$(CC) $^ -o$@ $(LFLAGS)
clean: 
	rm -f $(OBJS) 
mrproper: clean
	rm -f $(EXEC)
.PHONY: all clean mrproper