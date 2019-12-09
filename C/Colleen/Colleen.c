#include <stdio.h>
/*
** This program prints a copy of its own source code
*/

void print_self()
{
    char *str = "#include <stdio.h>%1$c/*%1$c** This program prints a copy of its own source code%1$c*/%1$c%1$cvoid print_self()%1$c{%1$c    char *str = %2$c%3$s%2$c;%1$c    printf(str, 10, 34, str);%1$c}%1$c%1$cint main(void)%1$c{%1$c    /*%1$c    ** Print Self%1$c    */%1$c    colleen();%1$c    return (0);%1$c}";
    printf(str, 10, 34, str);
}

int main(void)
{
    /*
    ** Print Self
    */
    print_self();
    return (0);
}