#include "stdint.h"
#include "stdio.h"

void _cdecl cstart_(uint16_t bootDrive)
{
    puts("Hello World from C!\r\n");

    printf("Testing %% %c %s\r\n", 'a', "string");
    printf("Testing %d %i %x %p %o %hd %hi %hhu %hhd\r\n", 1234, -5678, 0xdead, 0xbeef, 012345, (short)27, (short)-42, (unsigned char)20, (signed char)-10);

    for (;;)
        ;
}
