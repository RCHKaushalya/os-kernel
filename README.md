# Minimal Multiboot Kernel (v0.1)

A hand-crafted 32-bit kernel built in C and NASM, bootstrapped via GRUB with full multiboot compliance. Prints `"Hello from Kernel!"` using direct video memory access.

> 🛠 Designed and built by [Rasindu](https://github.com/RCHKaushalya) as part of an operating system development journey.

---

## 📦 Features

- Multiboot-compliant ELF kernel (32-bit)
- NASM header integrated with C codebase
- Printed output via raw memory write to `0xB8000`
- Fully bootable ISO image with GRUB
- QEMU and VirtualBox compatible

---

## 🚀 Quickstart

### 🧰 Dependencies

- `nasm` (for assembly)
- `gcc` (cross-compiling C code for 32-bit)
- `ld` (linking ELF)
- `grub-mkrescue`
- `qemu` or `VirtualBox`

### ⚙️ Build & Boot

```bash
make clean
make
qemu-system-i386 -kernel build/kernel.elf   # Direct ELF boot
qemu-system-i386 -cdrom kernel.iso          # ISO boot
```
