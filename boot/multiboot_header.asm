BITS 32
GLOBAL _start
EXTERN kernel_main

SECTION .multiboot
ALIGN 4

MAGIC    equ 0x1BADB002
FLAGS    equ 0
CHECKSUM equ -(MAGIC + FLAGS)

dd MAGIC
dd FLAGS
dd CHECKSUM

SECTION .text
_start:
    call kernel_main
    hlt

SECTION .note.GNU-stack
