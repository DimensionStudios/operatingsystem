[BITS 32]

section .text
global _start

extern kernel_main

_start:
call kernel_main
jmp $

times 512-($ - $$) db 0 ; fill the remaining bytes with 0

