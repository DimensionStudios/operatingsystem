FILES = ./build/kernel.asm.o ./build/kernel.o 
FLAGS = -g -ffreestanding -nostdlib -nostartfiles -nodefaultlibs -Wall -O0 -Iinc

list:
	@echo build_boot: builds the bootloader
	@echo run_boot: builds and runs the bootloader
	@echo build_main: builds the main file
	@echo run_main:	builds and runs the main file

build_boot:
	# Create boot.bin
	mkdir -p build
	mkdir -p bin
	nasm -f bin ./bootloader/src/boot.asm -o ./bin/boot.bin
	nasm -f elf32 -g ./bootloader/src/kernel.asm -o ./build/kernel.asm.o
	
	# Create kernel.bin
	i686-elf-gcc -I./bootloader/src $(FLAGS) -std=gnu99 -c ./bootloader/src/kernel.c -o ./build/kernel.o
	i686-elf-ld -g -relocatable $(FILES) -o ./build/completeKernel.o
	i686-elf-gcc $(FLAGS) -T ./bootloader/linkerScript.ld -o ./bin/kernel.bin -ffreestanding -O0 -nostdlib ./build/completeKernel.o
	
	# Create os.bin
	cat ./bin/boot.bin ./bin/kernel.bin > ./bin/os.bin
	#dd if=./bin/boot.bin >> ./bin/os.bin 
	#dd if=./bin/kernel.bin >> ./bin/os.bin
	dd if=/dev/zero bs=512 count=8 >> ./bin/os.bin
	@echo built

clean_boot:
	rm -f ./bin/boot.bin
	rm -f ./bin/kernel.bin
	rm -f ./bin/os.bin
	rm -f ./build/kernel.asm.o
	rm -f ./build/kernel.o
	rm -f ./build.conpleteKernel.o

run_boot:
	qemu-system-x86_64 -hda ./bin/os.bin

build_main:
	mkdir -p build
	clang++ --std=c++23 -o main main.cpp

run_main:
	mkdir -p build
	clang++ --std=c++23 -o build/main main.cpp
	./build/main

install_req_files:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
	HOMEBREW_NO_INSTALL_CLEANUP=1
	brew install i686-elf-gcc
	@echo If you encounter errors that say "brew does not exist," set up brew using discription in terminal and run command again.