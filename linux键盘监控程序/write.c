#include <assert.h>
#include <fcntl.h>
#include <linux/input.h>
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>

#include "table.h"

void write_device(const char *dev) {
    int fd = open(dev, O_WRONLY);
    assert(fd != -1);
    struct input_event event;
    event.type = EV_KEY;
    event.code = 2;
    for (int i = 0; i < 10; i++) {
        event.value = 1;
        write(fd, &event, sizeof(event));
        event.value = 0;
        write(fd, &event, sizeof(event));
    }
    close(fd);
}

int main(int argc, char **argv) {
    write_device("/dev/input/event4");
    return 0;
}
