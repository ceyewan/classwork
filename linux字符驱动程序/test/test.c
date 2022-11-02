#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>

int main(void) {
    int ret;
    char read_data[10];
    char write_data[10] = "ceyewan";
    int fd = open("/dev/mydriver", O_RDWR);
    if (-1 != fd) {
        ret = write(fd, write_data, 8);
        printf("write ret = %d \n", ret);
        ret = read(fd, read_data, 8);
        printf("read ret = %d \n", ret);
        printf("read : %s\n", read_data);
    } else {
        printf("open /dev/mydriver failed! \n");
    }
    return 0;
}
