#!/bin/bash

echo "Input Model: D722, D724"
read model
echo "CM/Stock"
read os
echo "mrproper, clean or build"
read instruct
echo "compile: y/N"
read compile

if [ "$instruct" = "mrproper" ]
then

	make1="make mrproper"
	make2="make jagnm_global_com_defconfig"

elif [ "$instruct" = "clean" ]
then

	make1="make clean"
	make2="make oldconfig"

elif [ "$instruct" = "build" ]
then

	make1="echo """
	make2="echo """

fi

if [ "$compile" = "y" ]
then

if [ -e "./arch/arm/boot/dt.img" ]; then
rm ./arch/arm/boot/dt.img
fi

if [ -e "./arch/arm/boot/msm8226-v1-jagnm.dtb" ]; then
rm ./arch/arm/boot/msm8226-v1-jagnm.dtb
rm ./arch/arm/boot/msm8226-v2-jagnm.dtb
fi

if [ -e "./arch/arm/boot/msm8226-jag3gds.dtb" ]; then
rm ./arch/arm/boot/msm8226-jag3gds.dtb
fi

if [ "$model" = "D722" ]
then

	$make1 && $make2 && make -j3 CONFIG_MACH_MSM8226_JAG3GDS_GLOBAL_COM=n CONFIG_MACH_MSM8926_JAGNM_GLOBAL_COM=y && ./dtbToolCM -2 -s 2048 -p ./scripts/dtc/ -o ./arch/arm/boot/dt.img ./arch/arm/boot/

elif [ "$model" = "D724" ]
then

	$make1 && $make2 && make -j3 CONFIG_MACH_MSM8226_JAG3GDS_GLOBAL_COM=y CONFIG_MACH_MSM8926_JAGNM_GLOBAL_COM=n && ./dtbToolCM -2 -s 2048 -p ./scripts/dtc/ -o ./arch/arm/boot/dt.img ./arch/arm/boot/

fi
fi

if [ ! -d "Output" ]; then
mkdir Output
fi

echo "Copying files to respective folder"

		cd ./RAMDISK/$model$os/
		cp ../../arch/arm/boot/zImage ./split_img/boot.img-zImage
		cp ../../arch/arm/boot/dt.img ./split_img/boot.img-dtb
		echo "Repacking Kernel"
		./repackimg.sh
		echo "Signing Kernel"
		./bump.py image-new.img
		cd ../../
		echo "Moving Kernel to output folder"
		mv ./RAMDISK/$model$os/image-new_bumped.img ./Output/$model$os.img


