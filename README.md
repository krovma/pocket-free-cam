# pocket-free-cam
本项目旨在实现一个一款不需要从PocketCamera/GameBoy Camera卡带上搬运 MAC-GBD 主控芯片的 GameBoy 可烧录相机卡带。如果顺利的话，进一步制作一个使用未停产的相机传感器替代 M64282FP 的版本。
项目原理图和PCB会在定版后发布。

A MAC-GBD free PocketCamera/GameBoy Camera replication, this project will be released under the ChisFlash universe (if it exists😁).

This project has two goals.
- Level 1. **[WIP]** To make a flashable GameBoy Camera that doesn't require harvesting MAC-GBD chip from the original PCB.
- Level 2. [Researching] Use a modern image sensor to substitute M64282FP.

Schematic and layout are still being iterated and will be released later.

FPGA: AGMicro AG32VF303VCT6
> Great chip btw. Low-cost, integrates with ADC and XTL, and even includes a RISC-V core.

ROM: MX29GL640EBTI

RAM: FM28V100

# Credit
本项目大量参考了 AntonioND 的[卡带原理逆向](https://github.com/AntonioND/gbcam-rev-engineer)，Raphael-Boichot 的[存档解析](https://github.com/Raphael-Boichot/Inject-pictures-in-your-Game-Boy-Camera-saves/tree/main)。

[Mori](https://oshwhub.com/morinaka/works) 对元件选型和硬件设计提供大量帮助，主要来自ChisFlash MBC5项目。[linscon](https://oshwhub.com/linscon/works)亦提供了开发上的一些建议。

This project is based on AntonioND's marvelous reverse job [gbcam-rev-engineer](https://github.com/AntonioND/gbcam-rev-engineer), and Raphael-Boichot's research on sav file [Inject-pictures-in-your-Game-Boy-Camera-saves](https://github.com/Raphael-Boichot/Inject-pictures-in-your-Game-Boy-Camera-saves/tree/main)
[Mori](https://oshwhub.com/morinaka/works) provided his help on chip selection and hardware design, mostly from the [ChisFlash MBC5 project](https://oshwhub.com/morinaka/chisflash-mbc5-gbc-shao-lu-ka).

# Progress
仍有bug，屏幕上可见撕裂

Obvious glitches, still WIP.

![glichy](https://github.com/krovma/pocket-free-cam/blob/master/resources/glichy-but-good-progress.png)

可以运行[Photo!](https://github.com/untoxa/gb-photo)，ROM写入亦正常。

Compatible with [Photo!](https://github.com/untoxa/gb-photo), and flashing camera rolls to ROM is also working!

![gb-photo](https://github.com/krovma/pocket-free-cam/blob/master/resources/photo-01.png)
![gb-photo-flash](https://github.com/krovma/pocket-free-cam/blob/master/resources/photo-02.png)

第一个可用PCB

First working PCB

![First working version of the PCB](https://github.com/krovma/pocket-free-cam/blob/master/resources/IMG_5523.jpg)
