CC=gcc
PKG=pkg-config --cflags --libs avahi64
FILE1 = server.c
FILE2 = client.c
FILE3 = browse.c
FILE4 = publish.c
OUT_EXE1 = server
OUT_EXE2 = client
OUT_EXE3 = browse
OUT_EXE4 = publish

build:
	cp avahi.pc /usr/lib/pkgconfig
	$(CC) -o $(OUT_EXE1) $(FILE1)
	$(CC) -o $(OUT_EXE2) $(FILE2)
	$(CC) -o $(OUT_EXE3) $(FILE3) `$(PKG)`
	$(CC) -o $(OUT_EXE4) $(FILE4) `$(PKG)`

clean:
	rm -f *.o core

rebuild: clean build

