./dtbToolCM -2 -o ./arch/arm/boot/dt.img -s 2048 -p ./scripts/dtc/ ./arch/arm/boot/ && find -name "*.ko" -exec cp -f '{}'  ./RAMDISK/Stock/D724/system/lib/modules/ \; && cp -f ./arch/arm/boot/zImage ./RAMDISK/Stock/D724/split_img/zImage && mv -f ./arch/arm/boot/dt.img ./RAMDISK/Stock/D724/split_img/dt.img && cd RAMDISK/Stock/D724/ && ./repackimg.sh && ./bump.py boot.img && cd ../../..
exec bash
