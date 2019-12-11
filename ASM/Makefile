CC=gcc

SRC_COLLEEN = Colleen/Colleen.s
SRC_GRACE = Grace/Grace.s
SRC_SULLY = Sully/Sully.s

OBJ_COLLEEN = $(SRC_COLLEEN:.s=.o)
OBJ_GRACE = $(SRC_GRACE:.s=.o)
OBJ_SULLY = $(SRC_SULLY:.s=.o)

all: Colleen Grace Sully

Colleen: $(OBJ_COLLEEN)
	$(CC) $(OBJ_COLLEEN) -o Colleen/Colleen

Grace: $(OBJ_GRACE)
	$(CC) $(OBJ_GRACE) -o Grace/Grace

Sully: $(OBJ_SULLY)
	$(CC) $(OBJ_SULLY) -o Sully/Sully

%.o: %.s
	nasm -f macho64 $<

clean:
	rm -rf $(OBJ_COLLEEN) $(OBJ_GRACE) $(OBJ_SULLY)

fclean: clean
	rm -rf Sully/Sully Colleen/Colleen Grace/Grace Sully/Sully_* Grace/Grace_kid.s

re: fclean all

.PHONY: all Colleen Grace Sully clean fclean re