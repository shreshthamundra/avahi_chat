CC=gcc
CFLAGS=-lavahi-glib -lavahi-core -lavahi-common -lavahi-client -lavahi-qt4
FILE1 = server.c
FILE2 = client.c
FILE3 = browse.c
FILE4 = publish.c
OUT_EXE1 = server
OUT_EXE2 = client
OUT_EXE3 = browse
OUT_EXE4 = publish
build: $(FILES)
	$(CC) -o $(OUT_EXE1) $(FILE1) $(CFLAGS)
	$(CC) -o $(OUT_EXE2) $(FILE2) $(CFLAGS)
	$(CC) -o $(OUT_EXE3) $(FILE3) $(CFLAGS)
	$(CC) -o $(OUT_EXE4) $(FILE4) $(CFLAGS)

clean:
	rm -f *.o core

rebuild: clean build