#include <string.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define SELF "#include <string.h>%1$c#include <fcntl.h>%1$c#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <unistd.h>%1$c%1$c#define SELF %2$c%3$s%2$c%1$c#define COMPILE_EXEC_CMD %2$ccc -Wall -Werror -Wextra Sully_%%1$d.c -o Sully_%%1$d && ./Sully_%%1$d%2$c%1$c#define SRC_FILE %2$cSully_%%d.c%2$c%1$c%1$cvoid compile_and_exec_self(i)%1$c{%1$c    char *cmd;%1$c%1$c    asprintf(&cmd, COMPILE_EXEC_CMD, i);%1$c    system(cmd);%1$c    free(cmd);%1$c}%1$c%1$cint write_self_in_file(i)%1$c{%1$c    int fd;%1$c    char *src_file;%1$c%1$c    asprintf(&src_file, SRC_FILE, i);%1$c    if ((fd = open(src_file, O_WRONLY | O_CREAT | O_TRUNC, 0644)) > 0)%1$c    {%1$c        dprintf(fd, SELF, 10, 34, SELF, i);%1$c        close(fd);%1$c        free(src_file);%1$c        return (1);%1$c    }%1$c    free(src_file);%1$c    return (0);%1$c}%1$c%1$cint main()%1$c{%1$c    int i = %4$d;%1$c%1$c    if (i > 0)%1$c    {%1$c        /*%1$c            If file contains an underscore that means it's the original program. %1$c            In that case the program will not decrement the index.%1$c        */%1$c        if ((strchr(__FILE__, '_')) != 0)%1$c            i--;%1$c        if (write_self_in_file(i))%1$c        {%1$c            compile_and_exec_self(i);%1$c        }%1$c    }%1$c    return (0);%1$c}"
#define COMPILE_EXEC_CMD "cc -Wall -Werror -Wextra Sully_%1$d.c -o Sully_%1$d && ./Sully_%1$d"
#define SRC_FILE "Sully_%d.c"

void compile_and_exec_self(i)
{
    char *cmd;

    asprintf(&cmd, COMPILE_EXEC_CMD, i);
    system(cmd);
    free(cmd);
}

int write_self_in_file(i)
{
    int fd;
    char *src_file;

    asprintf(&src_file, SRC_FILE, i);
    if ((fd = open(src_file, O_WRONLY | O_CREAT | O_TRUNC, 0644)) > 0)
    {
        dprintf(fd, SELF, 10, 34, SELF, i);
        close(fd);
        free(src_file);
        return (1);
    }
    free(src_file);
    return (0);
}

int main()
{
    int i = 5;

    if (i > 0)
    {
        /*
            If file contains an underscore that means it's the original program. 
            In that case the program will not decrement the index.
        */
        if ((strchr(__FILE__, '_')) != 0)
            i--;
        if (write_self_in_file(i))
        {
            compile_and_exec_self(i);
        }
    }
    return (0);
}