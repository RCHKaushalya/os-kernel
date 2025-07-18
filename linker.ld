ENTRY(_start)

SECTIONS {
    . = 0x00100000;

    .text : {
        *(.multiboot)
        *(.text)
    }

    .data : {
        *(.data)
    }

    .bss : {
        *(.bss)
    }
}
