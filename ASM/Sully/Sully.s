%define MACH_SYSCALL_OPEN   0x2000005
%define MACH_SYSCALL_CLOSE  0x2000006
%define SELF                "%%define MACH_SYSCALL_OPEN   0x2000005%3$c%%define MACH_SYSCALL_CLOSE  0x2000006%3$c%%define SELF                %4$c%1$s%4$c%3$c%%define CHILD_FILE_NAME     %4$cSully_%%d.s%4$c%3$c%%define EXEC_CMD            %4$cnasm -f macho64 Sully_%%1$d.s && gcc Sully_%%1$d.o -o Sully_%%1$d && rm Sully*.o && ./Sully_%%1$d%4$c%3$c%3$csection .data%3$c    self_string             db SELF, 0%3$c    compile_exec_string     db EXEC_CMD, 0%3$c    child_file_name         db CHILD_FILE_NAME, 0%3$c    self_file_name          db __FILE__, 0%3$c%3$csection .text%3$c    global _main%3$c    extern _sprintf%3$c    extern _dprintf%3$c    extern _system%3$c    extern _strchr%3$c%3$c_decrement:%3$c    dec r12 ; decrement i%3$c    leave%3$c    ret%3$c%3$c%3$c_check_is_orginal_program:%3$c    push    rbp%3$c    mov     rbp, rsp%3$c    mov     rsi, '_'                        ; arg #1 strchr: the character to be searched in the string.%3$c    lea     rdi, [rel self_file_name]       ; arg #2 strchr: the string to be scanned.%3$c    call    _strchr%3$c    cmp rax, 0x00                           ; compare result of strchr to null%3$c    jne _decrement;                         ; Jump to _decrement if not equal to null%3$c    leave%3$c    ret%3$c%3$c%3$c_main:%3$c    push rbp%3$c    mov rbp, rsp%3$c%3$c    ; i: index to decrement%3$c    mov r12, %2$d%3$c    %3$c    ;if i <= 0 %3$c    cmp r12, 0%3$c    jle end%3$c%3$c    ; Check and decrement i if is not original program%3$c    call _check_is_orginal_program%3$c%3$c    ; Create child file name string%3$c    sub rsp, 64                             ; claim 64 bytes of stack space to store the string%3$c    lea rdi, [rel rsp]                      ; arg #1 sprintf: where the resulting string will be stored.%3$c    lea rsi, [rel child_file_name]          ; arg #2 sprintf: this is the String that contains the text to be written to buffer.%3$c    mov rdx, r12                            ; arg #3 sprintf: additional arguments for the format string. Here: i.%3$c    call _sprintf%3$c%3$c    ; Open file%3$c    mov rdi, rsp                            ; arg #1 open: file name created with sprintf%3$c    mov rsi, 0x0601                         ; arg #2 open: O_WRONLY | O_CREAT | O_TRUNC%3$c    mov rdx, 0644o                          ; arg #3 open: permissions of the file%3$c    mov rax, MACH_SYSCALL_OPEN%3$c    syscall%3$c%3$c    ; Write in file%3$c    mov rdi, rax                            ; arg #1 open: file descriptor from Open syscall%3$c    lea rsi, [rel self_string]              ; arg #2 open: format%3$c    lea rdx, [rel self_string]              ; arg #3 open: format arg 1: self_string%3$c    mov rcx, r12                            ; arg #4 open: format arg 2: i %3$c    mov r8, 10                              ; arg #5 open: format arg 3: newline%3$c    mov r9, 34                              ; arg #6 open: format arg 1: double quote%3$c    call _dprintf%3$c%3$c    ; Close file%3$c    mov rax, MACH_SYSCALL_CLOSE%3$c    syscall%3$c%3$c    ; Create the string containing the compile and exec comand %3$c    sub rsp, 256                            ; claim 256 bytes of stack space to store the string%3$c    lea rdi, [rel rsp]                      ; arg #1 sprintf: where the resulting string will be stored.%3$c    lea rsi, [rel compile_exec_string]      ; arg #2 sprintf: this is the String that contains the text to be written to buffer.%3$c    mov rdx, r12                            ; arg #3 sprintf: additional arguments for the format string. Here: i.%3$c    call _sprintf%3$c%3$c    ; Execute the compile and exec comand  command%3$c    lea rdi, [rel rsp]                      ; arg #1 system: command string created with sprintf%3$c    call _system%3$c%3$c    leave%3$c    ret%3$c%3$cend:%3$c    leave%3$c    ret"
%define CHILD_FILE_NAME     "Sully_%d.s"
%define EXEC_CMD            "nasm -f macho64 Sully_%1$d.s && gcc Sully_%1$d.o -o Sully_%1$d && rm Sully*.o && ./Sully_%1$d"

section .data
    self_string             db SELF, 0
    compile_exec_string     db EXEC_CMD, 0
    child_file_name         db CHILD_FILE_NAME, 0
    self_file_name          db __FILE__, 0

section .text
    global _main
    extern _sprintf
    extern _dprintf
    extern _system
    extern _strchr

_decrement:
    dec r12 ; decrement i
    leave
    ret


_check_is_orginal_program:
    push    rbp
    mov     rbp, rsp
    mov     rsi, '_'                        ; arg #1 strchr: the character to be searched in the string.
    lea     rdi, [rel self_file_name]       ; arg #2 strchr: the string to be scanned.
    call    _strchr
    cmp rax, 0x00                           ; compare result of strchr to null
    jne _decrement;                         ; Jump to _decrement if not equal to null
    leave
    ret


_main:
    push rbp
    mov rbp, rsp

    ; i: index to decrement
    mov r12, 5 
    
    ;if i <= 0 
    cmp r12, 0 
    jle end

    ; Check and decrement i if is not original program
    call _check_is_orginal_program

    ; Create child file name string
    sub rsp, 64                             ; claim 64 bytes of stack space to store the string
    lea rdi, [rel rsp]                      ; arg #1 sprintf: where the resulting string will be stored.
    lea rsi, [rel child_file_name]          ; arg #2 sprintf: this is the String that contains the text to be written to buffer.
    mov rdx, r12                            ; arg #3 sprintf: additional arguments for the format string. Here: i.
    call _sprintf

    ; Open file
    mov rdi, rsp                            ; arg #1 open: file name created with sprintf
    mov rsi, 0x0601                         ; arg #2 open: O_WRONLY | O_CREAT | O_TRUNC
    mov rdx, 0644o                          ; arg #3 open: permissions of the file
    mov rax, MACH_SYSCALL_OPEN
    syscall

    ; Write in file
    mov rdi, rax                            ; arg #1 open: file descriptor from Open syscall
    lea rsi, [rel self_string]              ; arg #2 open: format
    lea rdx, [rel self_string]              ; arg #3 open: format arg 1: self_string
    mov rcx, r12                            ; arg #4 open: format arg 2: i 
    mov r8, 10                              ; arg #5 open: format arg 3: newline
    mov r9, 34                              ; arg #6 open: format arg 1: double quote
    call _dprintf

    ; Close file
    mov rax, MACH_SYSCALL_CLOSE
    syscall

    ; Create the string containing the compile and exec comand 
    sub rsp, 256                            ; claim 256 bytes of stack space to store the string
    lea rdi, [rel rsp]                      ; arg #1 sprintf: where the resulting string will be stored.
    lea rsi, [rel compile_exec_string]      ; arg #2 sprintf: this is the String that contains the text to be written to buffer.
    mov rdx, r12                            ; arg #3 sprintf: additional arguments for the format string. Here: i.
    call _sprintf

    ; Execute the compile and exec comand  command
    lea rdi, [rel rsp]                      ; arg #1 system: command string created with sprintf
    call _system

    leave
    ret

end:
    leave
    ret