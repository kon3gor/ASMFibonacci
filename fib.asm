%include "../usefull.inc"

section .bss
  digits resb 100
  pos resb 8
  buf resb 100

section .text
  global _start

_start:
  
  mov rdx, 0
  mov rdi, 0
  mov rsi, buf
  mov rdx, 100
  syscall

  mov rsi, buf
  atoi rsi
  mov rsp, rax

  mov r8, 0
  mov r9, 1

  _loop:
    printNumber digits, pos, r9
    mov r10, r9
    add r9, r8
    mov r8, r10
    dec rsp
    cmp rsp, 0
    jg _loop

  exit
