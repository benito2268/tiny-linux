# wrappers for syscalls since we have no c library
# Ben Staehle - 02/15/26

.globl read
.globl write
.globl fork
.globl execve
.globl _waitid
.globl _exit

read:
    mov $0, %rax
    syscall
    ret

write:
    mov $1, %rax
    syscall
    ret

fork:
    mov $57, %rax
    syscall
    ret

execve:
    mov $59, %rax
    syscall
    ret

_waitid:
    mov $247, %rax
    movq %rcx, %r10
    syscall
    ret

_exit:
    mov $60, %rax
    syscall
