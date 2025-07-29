[BITS 16]
[ORG 0x7c00]

CODE_OFFSET equ 0x8
DATA_OFFSET equ 0x10

start:
cli ; clear & disable interrups
mov ax, 0x00
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0x7c00 ; mov sp to stack pointer
sti ; Enable interrupts

load_PM:
cli
lgdt[gdt_desc]
mov eax, cr0
or al, 1 ; Set lower part of eax to 1(protected mode)
mov cr0, eax ; Add protection mode to cr0
jmp CODE_OFFSET:PMModeMain


; GDT (global descriptor table) https://wiki.osdev.org/Global_Descriptor_Table
gdt_start:
; CODE SEGMENT
; Set first 2 bytes as 0
dd 0x0
dd 0x0
; Code segment descriptor
dw 0xFFFF ; Limit
dw 0x0000 ; Base
db 0x00 ; Base
db 10011010b ; first bit is the present bit(must be 1 for valid segment). the next 2 bits are the privilege level (00 is the highest level). next bit is 'type bit' which is 1 for code segment. next bit is 'executable bit' which is 1 for code segment. next bit is 'Conforming bit' which is one for clear. next bit is 'readable bit' which is one for 'read access'. the final bit is 'access bit' which is 0
db 11001111b ; Flags for 4 kib
db 0x00 ; Base

; DATA SEGMENT
; Set first 2 bytes as 0
db 0x00000000
db 0x00000000
; Code segment descriptor
dw 0xFFFF ; Limit
dw 0x0000 ; Base
db 0x00 ; Base
db 10010010b ; first bit is the present bit(must be 1 for valid segment). the next 2 bits are the privilege level (00 is the highest level). next bit is 'type bit' which is 1 for data segment. next bit is 'executable bit' which is 0 for data segment. next bit is 'Conforming bit' which is one for clear. next bit is 'readable bit' which is one for 'read access'. the final bit is 'access bit' which is 0
db 11001111b ; Flags for 4 kib
db 0x00 ; Base

gdt_end:

gdt_desc:
dw gdt_end - gdt_start - 1 ; Size of GDT - 1
dd gdt_start ; base address of GDT

; MAIN FUNCTION
[BITS 32]
PMModeMain:
; Set all these registers to DATA_OFFSET
mov ax, DATA_OFFSET
mov ds, ax
mov es, ax
mov fs, ax
mov ss, ax
mov gs, ax

; Set ebp and esp to 0x9C00 (just a random spot to make sure that it doesnt use 0x7c00, and overflow the program)
mov ebp, 0x9C00
mov esp, ebp

; Weird code that allows us to use more than 1mb of data
in al, 0x92
or al, 2
out 0x92, al
jmp $

times 510 - ($ - $$) db 0 ; fill the 510 bytes that have to been used with 0

dw 0xAA55

; =========================================
; OLD PRINTING METHOD
; print:
; lodsb ; loads register si, moves it to al, then increments si
; cmp al, 0 ; if al is null, then clear and exit program
; je done
; mov ah, 0x0E ; 0x0E: name = Display character. ah = 0x0E. ARG0 (al) = char character
; int 0x10 ; syscall
; jmp print
;
; done:
; cli
; hlt ; Stop futher CPU execution (exit)

; VARIABLES
; msg: db 'Hello world!', 0 ; 0 is null char
; =========================================
