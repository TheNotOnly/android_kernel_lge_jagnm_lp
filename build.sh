make clean && make oldconfig && make CONFIG_NO_ERROR_ON_MISMATCH=y -j3 && ./dtbToolCM -2 -o ./arch/arm/boot/dt.img -s 2048 -p ./scripts/dtc/ ./arch/arm/boot/ && cp -f ./arch/arm/boot/zImage ~/Desktop/ && cp -f ./arch/arm/boot/dt.img ~/Desktop/

