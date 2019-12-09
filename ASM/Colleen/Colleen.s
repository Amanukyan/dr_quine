; This program prints a copy of its own source code

section .data
self:
    .str db "; This program prints a copy of its own source code%1$c%1$csection .data%1$cself:%1$c    .str db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$c    global _main%1$c    extern _printf%1$c%1$c_print_self:%1$c    push rbp%1$c    mov rbp, rsp%1$c    lea rdi, [rel self.str]%1$c    mov rsi, 10%1$c    mov rdx, 34%1$c    lea rcx, [rel self.str]%1$c    call _printf%1$c    mov rsp, rbp%1$c    pop rbp%1$c    ret%1$c    %1$c_main:%1$c    push rbp%1$c    mov rbp, rsp%1$c    call _print_self; Print Self%1$c    leave%1$c    ret", 0

section .text
    global _main
    extern _printf

_print_self:
    push rbp
    mov rbp, rsp
    lea rdi, [rel self.str]
    mov rsi, 10
    mov rdx, 34
    lea rcx, [rel self.str]
    call _printf
    mov rsp, rbp
    pop rbp
    ret
    
_main:
    push rbp
    mov rbp, rsp
    call _print_self; Print Self
    leave
    ret