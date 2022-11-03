#include <stdio.h>

int calc(int a, int b, int *sum) {
    *sum = a + b;
    int nums[10];
    return nums[9];
}

int main(int argc, char *argv[]) {
    int a = 1, b = 2, sum = 0;
    printf("before calc : a = %d b = %d, sum = %d\n", a, b, sum);
    a = calc(a, b, &sum);
    printf("after calc : a = %d b = %d, sum = %d\n", a, b, sum);
    return 0;
}
