#include <string.h>
#include <inttypes.h>
#include "alta.h"

int main(void)
{
    SYS_SwitchPLLClock(SYS_HSE_NONE);
    SYS_DisableNJTRST();
    SYS_DisableJTDI();
    SYS_DisableJTDO();
    while(1){}
    return 0;
}