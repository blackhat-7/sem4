#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <signal.h>



char **parsearg(char *buffer, int size);
char *myFlush(char *buffer, int size);
char *trimNewLine(char *buffer);
void myWrite(int out, char *buffer, int size);
int myRead(int in, char* buffer, int size);



int main(void)
{
    int size = 5;
    char *buffer = (char*) malloc(size*sizeof(char));
    int stdin = 0;
    int stdout = 1;
    int n;
    // (n = myRead(stdin, buffer, size * sizeof(buffer))) > 0
    while(1)
    {
        myRead(stdin, buffer, size*sizeof(buffer));
        // myWrite(stdout, buffer, size*sizeof(buffer));
        char **arg = parsearg(buffer, size);
        if (strcmp(arg[0], "exit") == 0)
        {
            kill(0, SIGKILL);
            exit(0);
        }
        if (fork()==0)
        {
            execv(arg[0], arg);
        }
        else
        {
            fork();
            wait(NULL);
        }
        myFlush(buffer, size);
    }
    return 0;
}

char **parsearg(char *buffer, int size)
{
    const char *delimters = " \t\n\v\f\r";
    char *token = strtok(buffer, delimters);
    char **arg = (char**) malloc(size * sizeof(char*));
    int i = 0;
    while(token != NULL)
    {
        arg[i++] = token;
        token = strtok(NULL, delimters);
    }
    arg[i] = NULL;
    return arg;
}

char *myFlush(char *buffer, int size)
{
    memset(buffer, 0, size * sizeof(buffer));
}

char *trimNewLine(char *buffer)
{
    int i = 0;
    while(buffer[i] != '\0')
    {
        ++i;
    }
    buffer[i-1] = '\0';
    return buffer;
}

int myRead(int in, char* buffer, int size)
{
    return read(in, buffer, size);
}

void myWrite(int out, char *buffer, int size)
{
    write(out, buffer, size);
}