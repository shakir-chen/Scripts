CC=g++
CFLAGS=-ggdb -DDEBUG
LIBS=-lm			#math library
OBJ=electrical.o optical.o OEIL.o

exec:$(OBJ)
	$(CC) -o $@ $^ $(CFLAGS) $(LIBS)

%.o: %.c %.h
	$(CC) -c -o $@ $< $(CFLAGS) $(LIBS)

.PHONY: clean run

clean:
	rm *.o exec

run:
	./exec
