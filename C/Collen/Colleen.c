#include <stdio.h>
/*
** comment outside
*/

void print_self()
{
    char *str = "#include <stdio.h>%1$c/*%1$c** comment outside%1$c*/%1$c%1$cvoid print_self()%1$c{%1$c    char *str = %2$c%3$s%2$c;%1$c    printf(str, 10, 34, str);%1$c}%1$c%1$cint main(void)%1$c{%1$c    /*%1$c    ** comment inside%1$c    */%1$c    colleen();%1$c    return (0);%1$c}";
    printf(str, 10, 34, str);
}

int main(void)
{
    /*
    ** comment inside
    */
    print_self();
    return (0);
}