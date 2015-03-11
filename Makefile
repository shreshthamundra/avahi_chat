CC=gcc
PKG=pkg-config --cflags --libs avahi
FILE1 = server.c
FILE2 = client.c
FILE3 = browse.c
FILE4 = publish.c
OUT_EXE1 = server
OUT_EXE2 = client
OUT_EXE3 = browse
OUT_EXE4 = publish
b32: $(FILES)
	cp avahi32.pc avahi32.pc
	$(CC) -o $(OUT_EXE1) $(FILE1) `$(PKG)`
	$(CC) -o $(OUT_EXE2) $(FILE2) `$(PKG)`
	$(CC) -o $(OUT_EXE3) $(FILE3) `$(PKG)`
	$(CC) -o $(OUT_EXE4) $(FILE4) `$(PKG)`

b64: $(FILES)
	$(CC) -o $(OUT_EXE1) $(FILE1) `$(PKG)`
	$(CC) -o $(OUT_EXE2) $(FILE2) `$(PKG)`
	$(CC) -o $(OUT_EXE3) $(FILE3) `$(PKG)`
	$(CC) -o $(OUT_EXE4) $(FILE4) `$(PKG)`

clean:
	rm -f *.o core

rebuild: clean build
