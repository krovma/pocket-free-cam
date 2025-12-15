# 芝士相机 Chis Pocket Camera
本项目旨在实现一个一款不需要从PocketCamera/GameBoy Camera卡带上搬运 MAC-GBD 主控芯片的 GameBoy 可烧录相机卡带。
既然是衍生自Chis那就叫Chis相机吧 (w

**注意，本项目仍然需要一个来自原版卡带的M64282FP摄像头模组才能工作，只是免去了拆焊主控的麻烦，以及完全用在产芯片制作，避免了一些其他可烧录相机项目中可能用到停产芯片的问题。**

PCB定版后会在立创开源广场发布，预览图如下。

A PocketCamera/GameBoy Camera replication. This project try to make a flashable GameBoy Camera that doesn't require harvesting MAC-GBD chip from the original cartridge.

Because this project is derived from ChisFlash universe, I'll call it ChisPocketCamera. :)

**Notice: You still need the M64282FP camera module from the original cartridge to work. The only purpose of this project is to keep your cartridge PCB intact and still get a flashable camera cartridge.**

Schematic and layout are still being iterated and will be released on OSHWlab/OSHWhub when finished. Preliminary version is like this...
![PreliminaryPCB](https://github.com/krovma/pocket-free-cam/blob/master/resources/pcb-preview.png)

FPGA: AGMicro AG32VF303VCT6
> Great chip btw. Low-cost, integrates with ADC and XTL, and even includes a RISC-V core.

ROM: MX29GL640EBTI
> Why use a 8MB NOR flash? Because it's cheaper than 1MB version.

RAM: FM28V100
> no batteries required.

# Credit
本项目大量参考了 AntonioND 的[卡带原理逆向](https://github.com/AntonioND/gbcam-rev-engineer)，Raphael-Boichot 的[存档解析](https://github.com/Raphael-Boichot/Inject-pictures-in-your-Game-Boy-Camera-saves/tree/main)。

[Mori](https://oshwhub.com/morinaka/works) 绘制了第三版Layout，并提供了一些器件选型建议。

[linscon](https://oshwhub.com/linscon/works)提供了开发上的一些建议，并协助修复画面撕裂问题。

This project is based on AntonioND's marvelous reverse job [gbcam-rev-engineer](https://github.com/AntonioND/gbcam-rev-engineer), and Raphael-Boichot's research on sav file [Inject-pictures-in-your-Game-Boy-Camera-saves](https://github.com/Raphael-Boichot/Inject-pictures-in-your-Game-Boy-Camera-saves/tree/main).

[Mori](https://oshwhub.com/morinaka/works) drew the layout of current PCB. Do check his other projects like [ChisFlash MBC5 project](https://oshwhub.com/morinaka/chisflash-mbc5-gbc-shao-lu-ka). 

[linscon](https://oshwhub.com/linscon/works) helped fixing gliches in pictures.

# Progress
------Update------

目前有一个新问题，GB和GBP无法启动这张卡带，也许是固件原因，也许是PCB设计原因，待查。

First, a new problem was found. This cart can't boot on the OG Game Boy and Game Boy Pocket. Only Game Boy Color and Game Boy Advance works. It could be bugs in FPGA firmware or PCB design, still needs to figure out.

撕裂和噪声基本解决。只看图片应该看不出哪个是原版卡的效果了。

And from last update, most visible gliches and noises are fixed. One of photos below is the original cart, and I would say there is no major difference.

|Cart A|CartB|
|------|-----|
|![compare1](https://github.com/krovma/pocket-free-cam/blob/master/resources/original.png)|![compare2](https://github.com/krovma/pocket-free-cam/blob/master/resources/fixed.png)|


------Update------

仍有bug，屏幕上可见撕裂，以及一些噪声。

Obvious glitches and noise, still WIP.

![glichy](https://github.com/krovma/pocket-free-cam/blob/master/resources/glichy-but-good-progress.png)

------Update------

可以运行[Photo!](https://github.com/untoxa/gb-photo)，ROM写入亦正常。

Compatible with [Photo!](https://github.com/untoxa/gb-photo), and flashing camera rolls to ROM is also working!

![gb-photo](https://github.com/krovma/pocket-free-cam/blob/master/resources/photo-01.png)
![gb-photo-flash](https://github.com/krovma/pocket-free-cam/blob/master/resources/photo-02.png)

第一个可用PCB

First working PCB

![First working version of the PCB](https://github.com/krovma/pocket-free-cam/blob/master/resources/IMG_5523.jpg)
