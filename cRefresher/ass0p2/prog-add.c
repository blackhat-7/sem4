#include <stdio.h>
#include <inttypes.h>

int64_t add(int64_t, int64_t);

int main(void)
{
        int a, b;
        printf("Enter 2 numbers :\n");
        scanf("%d %d", &a, &b);
        add(a, b);
        return 0;
}
