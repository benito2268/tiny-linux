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
STRIP = strip

CFLAGS = -Wall -Wextra -Wno-unused-result -Os -nostdlib
LDFLAGS	 = --entry main -z noexecstack -static

OBJS = shell.o syscalls.o

all: $(TARGET)
.PHONY: clean

$(TARGET): $(INIT)
	$(STRIP) -s $^
	echo $^ | $(CPIO) -H newc -o > $@

$(INIT): $(OBJS)
	$(LD) -o $@ $^ $(LDFLAGS)

syscalls.o: syscalls.S
	$(AS) $^ -o $@

shell.o: shell.c
	$(CC) -c $^ -o $@ $(CFLAGS)

clean:
	rm $(TARGET) $(INIT) *.o
