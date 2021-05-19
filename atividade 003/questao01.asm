global _start
extern printf
extern scanf
extern puts

section .text
_start:
    ; primeiro inteiro
    mov rdi, msgN1
    call puts

    ; scanf
    mov rdi, entrada
    mov rax, 1
    sub rsp, 8
    call scanf
    add rsp, 8
    movsd [n1], xm0

    ; segundo inteiro
    mov rdi, msgN2
    call puts

    ; scanf
    mov rdi, entrada
    mov rax, 1
    sub rsp, 8
    call scanf
    add rsp, 8
    movsd [n2], xm1

    ; if(n2 > n1)
    mov rax, [n2]
    cmp rax, [_n1]
    jge swap

    mov eax, [n1]
    mov [aux], eax

    jmp loop

swap:
    ; aux = n1, n1 = n2, n2 = aux
    mov eax, [n1]
    mov [aux], eax

    mov eax, [n2]
    mov [n1], eax

    mov eax, [aux]
    mov [n2], eax

loop:
    mov rdi, msgIntervalo
    call puts

    mov eax, [aux]
    sub eax, '0'

    mov ebx, [1]
    sub ebx, '0'

    add eax, ebx
    add eax, '0'

    mov [aux], eax
    mov rax, [aux]
    cmp rax, [_n2]
    jl loop

    int 0x80

section .data
    msgN1: db "Digite o primeiro numero:", 0x0a
    msgN2: db "Digite o segundo numero:", 0x0a
    msgIntervalo: db "%d ", aux, 0x0a
    entrada: db "%d", 0x0a
    n1: dw 0
    n2: dw 0
    aux: dw 0
