%define FILE_NAME "Grace_kid.s"
%define SELF "%%define FILE_NAME %4$c%2$s%4$c%3$c%%define SELF %4$c%1$s%4$c%3$c%%define MAIN _main:%3$c%3$c%%macro write_self_in_file 0  %3$c    lea rdi, [rel file_name.str]%3$c    mov rsi, 0x0601 ; O_WRONLY | O_CREAT | O_TRUNC%3$c    mov rdx, 0644o%3$c    mov rax, 0x2000005%3$c    syscall%3$c    mov rdi, rax%3$c    lea rsi, [rel self.str]%3$c    lea rdx, [rel self.str]%3$c    lea rcx, [rel file_name.str]%3$c    mov r8, 10%3$c    mov r9, 34%3$c    call _dprintf%3$c%%endmacro%3$c %3$csection .data%3$cself:%3$c    .str db SELF, 0%3$c%3$cfile_name:%3$c    .str db FILE_NAME, 0    %3$c%3$csection	.text%3$c    global MAIN%3$c    extern _dprintf%3$c	%3$cMAIN%3$c    push rbp%3$c    mov rbp, rsp  %3$c    write_self_in_file%3$c    leave%3$c    ret"
%define MAIN _main:

%macro write_self_in_file 0  
    lea rdi, [rel file_name.str]
    mov rsi, 0x0601 ; O_WRONLY | O_CREAT | O_TRUNC
    mov rdx, 0644o
    mov rax, 0x2000005
    syscall
    mov rdi, rax
    lea rsi, [rel self.str]
    lea rdx, [rel self.str]
    lea rcx, [rel file_name.str]
    mov r8, 10
    mov r9, 34
    call _dprintf
%endmacro
 
section .data
self:
    .str db SELF, 0

file_name:
    .str db FILE_NAME, 0    

section	.text
    global MAIN
    extern _dprintf
	
MAIN
    push rbp
    mov rbp, rsp  
    write_self_in_file
    leave
    ret