section .data
    msg_positive db "The number is POSITIVE", 0
    msg_negative db "The number is NEGATIVE", 0
    msg_zero db "The number is ZERO", 0

section .bss
    num resb 1

section .text
    global _start

_start:
    ; Prompt user for input
    mov eax, 3          ; sys_read
    mov ebx, 0          ; stdin
    lea ecx, [num]      ; buffer for input
    mov edx, 1          ; read one byte
    int 0x80            ; interrupt for syscall

    ; Convert input to numeric value
    movzx eax, byte [num]
    sub eax, '0'        ; Convert ASCII to integer

    ; Check conditions
    cmp eax, 0
    je zero_case        ; Jump if zero
    jl negative_case    ; Jump if less than zero

positive_case:
    ; Print "POSITIVE"
    mov eax, 4          ; sys_write
    mov ebx, 1          ; stdout
    lea ecx, [msg_positive]
    mov edx, 23
    int 0x80
    jmp exit_program

negative_case:
    ; Print "NEGATIVE"
    mov eax, 4
    mov ebx, 1
    lea ecx, [msg_negative]
    mov edx, 23
    int 0x80
    jmp exit_program

zero_case:
    ; Print "ZERO"
    mov eax, 4
    mov ebx, 1
    lea ecx, [msg_zero]
    mov edx, 15
    int 0x80

exit_program:
    ; Exit program
    mov eax, 1          ; sys_exit
    xor ebx, ebx        ; exit code 0
    int 0x80
