list:
	@echo build_boot: builds the bootloader
	@echo run_boot: builds and runs the bootloader
	@echo build_main: builds the main file
	@echo run_main:	builds and runs the main file

build_boot:
	@mkdir -p build
	@nasm -f bin ./bootloader/src/boot.asm -o ./build/boot.bin
	@echo built

run_boot:
	@mkdir -p build
	@nasm -f bin ./bootloader/src/boot.asm -o ./build/boot.bin
	@echo built
	@qemu-system-x86_64 -hda ./build/boot.bin

build_main:
	@mkdir -p build
	@clang++ --std=c++23 -o main main.cpp

run_main:
	@mkdir -p build
	@clang++ --std=c++23 -o build/main main.cpp
	@./build/main
