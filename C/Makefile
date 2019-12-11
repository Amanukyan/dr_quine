CC=clang
CFLAGS= -Wall -Werror -Wall

SRC_COLLEEN = Colleen/Colleen.c
SRC_GRACE = Grace/Grace.c
SRC_SULLY = Sully/Sully.c

all: Colleen Grace Sully

Colleen: $(SRC_COLLEEN)
	$(CC) $(CFLAGS) -o Colleen/$@ $^ 

Grace: $(SRC_GRACE)
	$(CC) $(CFLAGS) -o Grace/$@ $^

Sully: $(SRC_SULLY)
	$(CC) $(CFLAGS) -o Sully/$@ $^

clean:
	rm -rf Sully/Sully_* Grace/Grace_kid.c

fclean: clean
	rm -rf Sully/Sully Colleen/Colleen Grace/Grace

re: fclean all

.PHONY: all Colleen Grace Sully clean fclean re
