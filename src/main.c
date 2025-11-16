#include <string.h>
#include <inttypes.h>
#include "alta.h"
#include "board.h"

int main(void)
{
    board_init();

    SYS_DisableNJTRST();
    SYS_DisableJTDI();
    SYS_DisableJTDO();

    while(1){
    }
    return 0;
}