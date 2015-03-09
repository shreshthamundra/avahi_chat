/****************** CLIENT CODE ****************/

#include <stdio.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <string.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <string.h>

#define BUFFER_SIZE 1000
struct message
{   
        long mtype;
        char mtext[BUFFER_SIZE];
};
struct message buff;
key_t up = 1;
int idup;

void init_queue()
{
    idup=msgget(up,IPC_CREAT|0666);
}

int main(){
  init_queue();
  printf("Receiving IP\n");
  if(msgrcv(idup,&buff,BUFFER_SIZE,0,0)==-1)     //Kernel to user memory space 
  {
      perror("msgrv failed\n");
      return 0;
  }
  printf("ip: (%s)\n",buff.mtext);
  int clientSocket;
  char buffer[1024];
  struct sockaddr_in serverAddr;
  socklen_t addr_size;

  /*---- Create the socket. The three arguments are: ----*/
  /* 1) Internet domain 2) Stream socket 3) Default protocol (TCP in this case) */
  clientSocket = socket(PF_INET, SOCK_STREAM, 0);
  
  /*---- Configure settings of the server address struct ----*/
  /* Address family = Internet */
  serverAddr.sin_family = AF_INET;
  /* Set port number, using htons function to use proper byte order */
  serverAddr.sin_port = htons(7891);
  /* Set IP address to localhost */
  serverAddr.sin_addr.s_addr = inet_addr(buff.mtext);
  /* Set all bits of the padding field to 0 */
  memset(serverAddr.sin_zero, '\0', sizeof serverAddr.sin_zero);  

  /*---- Connect the socket to the server using the address struct ----*/
  addr_size = sizeof serverAddr;
  connect(clientSocket, (struct sockaddr *) &serverAddr, addr_size);

  /*---- Read the message from the server into the buffer ----*/
  recv(clientSocket, buffer, 1024, 0);

  /*---- Print the received message ----*/
  printf("Data received: %s",buffer);   

  return 0;
}