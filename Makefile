CC=gcc
LIBS=-lavahi-glib -lavahi-core -lavahi-common -lavahi-client -lavahi-qt4
FILE1 = server.c
FILE2 = client.c
FILE3 = browse.c
FILE4 = publish.c
OUT_EXE1 = server
OUT_EXE2 = client
OUT_EXE3 = browse
OUT_EXE4 = publish
build: $(FILES)
	$(CC) -o $(OUT_EXE1) $(FILE1) $(LIBS)
	$(CC) -o $(OUT_EXE2) $(FILE2) $(LIBS)
	$(CC) -o $(OUT_EXE3) $(FILE3) $(LIBS)
	$(CC) -o $(OUT_EXE4) $(FILE4) $(LIBS)

clean:
	rm -f *.o core

rebuild: clean build
