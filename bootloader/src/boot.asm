[BITS 16]
[ORG 0x7c00]

start:
cli ; clear & disable interrups
mov ax, 0x00
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0x7c00 ; mov sp to stack pointer
sti ; Enable interrupts
mov si, msg

print:
lodsb ; loads register si, moves it to al, then increments si
cmp al, 0 ; if al is null, then clear and exit program
je done
mov ah, 0x0E ; 0x0E: name = Display character. ah = 0x0E. ARG0 (al) = char character
int 0x10 ; syscall
jmp print

done:
mov al, 'E'
mov ah, 0x0E
int 0x10

cli
hlt ; Stop futher CPU execution (exit)


; VARIABLES
msg: db 'Hello world!', 0 ; 0 is null char

times 510 - ($ - $$) db 0 ; fill the 510 bytes that have to been used with 0

dw 0xAA55
