#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#define STR "#include <fcntl.h>%1$c#include <stdio.h>%1$c#include <unistd.h>%1$c#define STR %2$c%3$s%2$c%1$c#define FT() int main(){int fd;if ((fd = open(%2$cGrace_kid.c%2$c, O_WRONLY | O_CREAT | O_TRUNC, 0644)) > 0){dprintf(fd,STR,10,34,STR); close(fd); } return (0); }%1$cFT()"
#define FT() int main(){int fd;if ((fd = open("Grace_kid.c", O_WRONLY | O_CREAT | O_TRUNC, 0644)) > 0){dprintf(fd,STR,10,34,STR); close(fd); } return (0); }
FT()