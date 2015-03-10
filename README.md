This is a chat service based on avahi. Two computers, connected to the same server can send messages, without knowing the IP address.

How to compile:
Install avahi-daemon. Instructions:
http://www.linuxfromscratch.org/blfs/view/svn/basicnet/avahi.html

On server run:

gcc server.c -lavahi-glib -lavahi-core -lavahi-common -lavahi-client -lavahi-qt4

gcc publish.c -lavahi-glib -lavahi-core -lavahi-common -lavahi-client -lavahi-qt4

./publish

./server

On client run:

gcc client.c -lavahi-glib -lavahi-core -lavahi-common -lavahi-client -lavahi-qt4

gcc browse.c -lavahi-glib -lavahi-core -lavahi-common -lavahi-client -lavahi-qt4

./browse

./client

On doing this, the server can send mesaages to the client, directly from the terminal.
