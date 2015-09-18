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
	make1="echo """

fi

if [ "$compile" = "y" ]
then

if [ "$model" = "D722" ]
then

	$make1 && $make2 && make CONFIG_NO_ERROR_ON_MISMATCH=y -j3 CONFIG_MACH_MSM8226_JAG3GDS_GLOBAL_COM=n CONFIG_MACH_MSM8926_JAGNM_GLOBAL_COM=y && ./dtbToolCM -2 -s 2048 -p ./scripts/dtc/ -o ./arch/arm/boot/dt.img ./arch/arm/boot/

elif [ "$model" = "D724" ]
then

	$make1 && $make2 && make CONFIG_NO_ERROR_ON_MISMATCH=y -j3 CONFIG_MACH_MSM8226_JAG3GDS_GLOBAL_COM=y CONFIG_MACH_MSM8926_JAGNM_GLOBAL_COM=n && ./dtbToolCM -2 -s 2048 -p ./scripts/dtc/ -o ./arch/arm/boot/dt.img ./arch/arm/boot/

fi
fi

rm -rf ./Output
echo "Copying files to respective folder"
if [ "$model" = "D722" ]
then
	if [ "$os" = "Stock" ]
	then
		cd ./RAMDISK/D722/
		cp ./arch/arm/boot/zImage ./split_img/boot.img-zImage
		cp ./arch/arm/boot/dt.img ./split_img/boot.img-dtb
		echo "Repacking Kernel"
		./repackimg.sh
		echo "Signing Kernel"
		./bump.py image-new.img
		cd ../../
		echo "Moving Kernel to output folder"
		mkdir Output
		mv ./RAMDISK/D722/image-new_bumped.img ./Output/D722Stock.img

	elif [ "$os" = "CM" ]
	then
		cd ./RAMDISK/D722CM/
		cp ./arch/arm/boot/zImage ./split_img/boot.img-zImage
		cp ./arch/arm/boot/dt.img ./split_img/boot.img-dtb
		echo "Repacking Kernel"
		./repackimg.sh
		echo "Signing Kernel"
		./bump.py image-new.img
		cd ../../
		echo "Moving Kernel to output folder"
		mkdir Output
		mv ./RAMDISK/D722CM/image-new_bumped.img ./Output/D722CM.img
	fi

elif [ "$model" = "D724" ]
then
	if [ "$os" = "Stock" ]
	then
		cd ./RAMDISK/D724/
		cp ./arch/arm/boot/zImage ./split_img/boot.img-zImage
		cp ./arch/arm/boot/dt.img ./split_img/boot.img-dtb
		echo "Repacking Kernel"
		./repackimg.sh
		echo "Signing Kernel"
		./bump.py image-new.img
		cd ../../
		echo "Moving Kernel to output folder"
		mkdir Output
		mv ./RAMDISK/D724/image-new_bumped.img ./Output/D724Stock.img

	elif [ "$os" = "CM" ]
	then
		cd ./RAMDISK/D724CM/
		cp ./arch/arm/boot/zImage ./split_img/boot.img-zImage
		cp ./arch/arm/boot/dt.img ./split_img/boot.img-dtb
		echo "Repacking Kernel"
		./repackimg.sh
		echo "Signing Kernel"
		./bump.py image-new.img
		cd ../../
		echo "Moving Kernel to output folder"
		mkdir Output
		mv ./RAMDISK/D724CM/image-new_bumped.img ./Output/D724CM.img
	fi

fi

