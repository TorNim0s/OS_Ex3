
CC = gcc
CFLAGS = -Wall -g

all: 0 1 client

Client.o: Client.c
	$(CC) -c $(CFLAGS) Client.c

Process_server.o: Process_server.c
	$(CC) -c $(CFLAGS) Process_server.c

Thread_server.o: Thread_server.c
	$(CC) -c $(CFLAGS) Thread_server.c

0: Process_server.o
	$(CC) $(CFLAGS) Process_server.o -o Process_server

1: Thread_server.o
	$(CC) $(CFLAGS) -pthread Thread_server.o -o Thread_server

client: Client.o
	$(CC) $(CFLAGS) Client.o -o client

.PHONY: all clean 0 1 client

clean:
	rm -f *.o Process_server Thread_server client