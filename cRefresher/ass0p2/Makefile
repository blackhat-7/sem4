all: prog-add.o add.o
	gcc -no-pie -g -Wall prog-add.o add.o -o main

add.o: add.asm
	nasm -felf64 add.asm

prog-add.o: prog-add.s
	gcc -c prog-add.s -o prog-add.o

prog-add.s: prog-add.i
	gcc -S prog-add.i -o prog-add.s

prog-add.i: prog-add.c
	gcc -E prog-add.c -o prog-add.i

clean:
	rm -rf main *.o *.s *.i
