#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#define FILE_NAME "Grace_kid.c"
#define STR "#include <fcntl.h>%1$c#include <stdio.h>%1$c#include <unistd.h>%1$c#define FILE_NAME %2$c%4$s%2$c%1$c#define STR %2$c%3$s%2$c%1$c#define FT(file_name) int main(){int fd;if ((fd = open(file_name, O_WRONLY | O_CREAT | O_TRUNC, 0644)) > 0){dprintf(fd,STR,10,34,STR,FILE_NAME); close(fd); } return (0); }%1$cFT(FILE_NAME)%1$c"
#define FT(file_name) int main(){int fd;if ((fd = open(file_name, O_WRONLY | O_CREAT | O_TRUNC, 0644)) > 0){dprintf(fd,STR,10,34,STR,FILE_NAME); close(fd); } return (0); }
FT(FILE_NAME)
