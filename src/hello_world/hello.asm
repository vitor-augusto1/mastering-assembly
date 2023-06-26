section .data
message: db 'hello, world', 10

section .text
global _start

_start:
  mov rax, 1 ; The sys call's number must be stored at rax
  mov rdi, 1 ; Argument #1 in rdi: Where sould be write (descriptor) ?
  mov rsi, message ; Argument #2 in rsi: Where the string starts ?
  mov rdx, 14 ; Argument #3 in rdx: How many bytes must be written ?
  syscall ; This instruction make a system call

  mov rax, 60 ; exit system call's number
  xor rdi, rdi
  syscall
