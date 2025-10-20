#include <string.h>
#include <inttypes.h>
#include "alta.h"

int main(void)
{
    SYS_SwitchPLLClock(SYS_HSE_NONE);
    SYS_DisableNJTRST();
    SYS_DisableJTDI();
    SYS_DisableJTDO();

    UTIL_IdleMs(10);

    INT_Init(); // This will disabe all interrupts. INT_EnableIRQ should be called after this to enable any external interrupt.
    INT_EnableIntGlobal();
    INT_EnableIntExternal();

    while(1)
    {
        SYS_EnterSleepMode();
    }
    return 0;
}