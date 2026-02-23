# 
# Makefile for custom tiny-linux shell and syscalls
# Ben Staehle - 02/15/25
#
TARGET = init.cpio
INIT = init

CC = gcc
AS = as
LD = ld

CPIO = cpio
STRIP = objcopy

CFLAGS = -Wall -Wextra -Os \
		 -nostdlib \
		 -fno-stack-protector \
		 -fno-unwind-tables \
		 -fno-asynchronous-unwind-tables\
		 -fno-ident \
		 -fno-pic \
		 -no-pie
LDFLAGS	 = --entry main -z noexecstack -static --build-id=none -n 

OBJS = shell.o syscalls.o

all: $(TARGET)
.PHONY: clean

$(TARGET): $(INIT)
	$(STRIP) --strip-all $^
	echo $^ | $(CPIO) -H newc -o > $@

$(INIT): $(OBJS)
	$(LD) -o $@ $^ $(LDFLAGS)

syscalls.o: syscalls.S
	$(AS) $^ -o $@

shell.o: shell.c
	$(CC) -c $^ -o $@ $(CFLAGS)

clean:
	rm $(TARGET) $(INIT) *.o
