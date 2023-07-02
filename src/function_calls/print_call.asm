section .data

newline_char: db 10
codes: db '0123456789abcdef'

section .text
global _start

print_newline:
    mov rax, 1            ; 'write' syscall identifier
    mov rdi, 1            ; 'stdout' file descriptor
    mov rsi, newline_char ; where the data comes from
    mov rdx, 1            ; number of bytes to be written
    syscall
  ret

print_hex:
    mov rax, rdi

    mov rdi, 1
    mov rdx, 1
    mov rcx, 64
  
  iterate:
    push rax               ; Save the rax's initial value
    sub rcx, 4
    sar rax, cl            ; Shift to 60, 56, 52, ... 4, 0
                           ; The cl register is the rcx's smaller part
    and rax, 0xf           ; Clear all bits, except the four least significant
    lea rsi, [codes + rax] ; Get the character code of a hexadecimal digit

    mov rax, 1

    push rcx               ; Syscall will change rcx
    syscall                ; rax = 1 (31) - The identifier of `write`
                           ; rdi = 1 for stdout
                           ; rsi = The character address
    pop rcx

    pop rax
    test rcx, rcx          ; rcx = 0 When all digits are shown
    jnz iterate

    ret

_start:
  mov rdi, 0x1122334455667788
  call print_hex
  call print_newline

  mov rax, 60
  xor rdi, rdi
  syscall
