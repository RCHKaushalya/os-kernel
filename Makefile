BOOT_DIR = boot
KERNEL_DIR = kernel
BUILD_DIR = build
GRUB_DIR = grub

ASM = nasm
CC = gcc
LD = ld

CFLAGS = -m32 -ffreestanding -Wall -Wextra -c
ASFLAGS = -f elf32
LDFLAGS = -m elf_i386 -T linker.ld

ISO = kernel.iso
ELF = $(BUILD_DIR)/kernel.elf

OBJECTS = $(BUILD_DIR)/multiboot.o $(BUILD_DIR)/kernel.o

all: $(ISO)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/multiboot.o: $(BOOT_DIR)/multiboot_header.asm | $(BUILD_DIR)
	$(ASM) $(ASFLAGS) $< -o $@

$(BUILD_DIR)/kernel.o: $(KERNEL_DIR)/kernel.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) $< -o $@

$(ELF): $(OBJECTS)
	$(LD) $(LDFLAGS) -o $@ $^

$(ISO): $(ELF)
	mkdir -p iso/boot
	cp $< iso/boot/kernel
	cp $(GRUB_DIR)/grub.cfg iso/boot/grub.cfg
	grub-mkrescue -o $@ iso

clean:
	rm -rf $(BUILD_DIR) iso $(ISO)
