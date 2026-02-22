/* 
 * A very (very) minimal linux shell
 * Ben Staehle - 02/15/25
 */

#include <unistd.h>
#include <sys/wait.h>

#define MAX_CMD 512

int _waitid(idtype_t, id_t, siginfo_t*, int, void*);

size_t strlen(const char *str) {
    int c = 0;
    while (*str != '\0') {
        c++;
        str++;
    }

    return c;
}

int main(void) {
    const char *prompt = "$ ";
    const char *welcome = "Welcome to TinyLinux!\n";
    char cmd[MAX_CMD] = { '\0' };
    int count = 1;

    write(1, welcome, strlen(welcome));
    for (;;) {
        write(1, (void*)prompt, strlen(prompt)); 
        count = read(0, cmd, MAX_CMD); 
        if (count < 0) {
            _exit(1);
        }

        cmd[count - 1] = '\0';
        pid_t rc = fork();

        if (rc == 0) {
            // child
            if (count < 2)
                continue;
    
            // setup argv
            char *argv[2] = {
                cmd,
                NULL
            };
            
            execve(cmd, argv, NULL);

            // if we make it here execve failed
            const char *exec_fail = "could not exec the command\n";
            write(1, exec_fail, strlen(exec_fail));
            break;
        }
        else {
            // parent
            siginfo_t info;
            _waitid(P_ALL, 0, &info, WEXITED, NULL);
        }
    }

    _exit(0);
}
