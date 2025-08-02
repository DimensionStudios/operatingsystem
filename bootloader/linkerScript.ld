ENTRY(_start)
OUTPUT_FORMAT(binary)
SECTIONS
{
    . = 0x0100000;

    .text : ALIGN(4096)
    {
        *(.text .text.*)       /* code */
        *(.rodata .rodata.*)   /* readonly data inside code segment */
    }

    .data : ALIGN(4096)
    {
        *(.data .data.*)       /* initialized writable data */
    }

    .bss : ALIGN(4096)
    {
        *(COMMON)
        *(.bss .bss.*)         /* uninitialized data */
    }
}

