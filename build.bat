@echo off

if exist s1built.bin move /Y s1built.bin s1built.prev.bin >NUL
del s1built.bin

vasmm68k_psi-x.exe -noalign -spaces -m68000 -no-opt -maxerrors=0 -Fbin -start=0 -o s1built.bin -L _sonic.lst -Lall sonic.asm 2> _errors.log
type _errors.log

if not exist s1built.bin pause & exit
fixheadr.exe s1built.bin
