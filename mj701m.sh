#!/bin/bash
CR_DIR=$(pwd)
CR_TC=/home/m/kernel/aarch64-linux-android-4.9/bin/aarch64-linux-android-
CR_DTS=arch/arm64/boot/dts
CR_OUT=$CR_DIR/MK/Out
CR_AIK=$CR_DIR/MK/A.I.K
CR_RAMDISK=$CR_DIR/MK/Ramdisk2
CR_KERNEL=$CR_DIR/arch/arm64/boot/Image
CR_DTB=$CR_DIR/boot.img-dtb
CR_PACKBOOT=$CR_DIR/MK/Out/MINHKA_kernel_j7pro/MINHKA/j730g
CR_VERSION=V2.4
CR_NAME=MINHKA_Kernel
CR_JOBS=5
CR_ANDROID=o
CR_PLATFORM=8.1.0
CR_ARCH=arm64
export CROSS_COMPILE=$CR_TC
export ANDROID_MAJOR_VERSION=$CR_ANDROID
export PLATFORM_VERSION=$CR_PLATFORM
export $CR_ARCH
CR_DTSFILES_J701M="exynos7870-j7velte_sea_open_00.dtb exynos7870-j7velte_sea_open_01.dtb exynos7870-j7velte_sea_open_03.dtb"
CR_CONFG_J701M=j7veltesea_defconfig
CR_VARIANT_J701M=J701M
CLEAN_SOURCE()
{
echo "Cleaning"
#sudo make clean && sudo make mrproper && sudo ./m.sh
#make mrproper
rm -r -f $CR_DTB
rm -rf $CR_DTS/.*.tmp
rm -rf $CR_DTS/.*.cmd
rm -rf $CR_DTS/*.dtb
}
DIRTY_SOURCE()
{
echo "Cleaning"
rm -r -f $CR_DTB
rm -rf $CR_DTS/.*.tmp
rm -rf $CR_DTS/.*.cmd
rm -rf $CR_DTS/*.dtb
}
BUILD_ZIMAGE()
{
	echo "Building zImage for $CR_VARIANT"
	export LOCALVERSION=-$CR_NAME-$CR_VERSION-$CR_VARIANT
	make  $CR_CONFG
	make -j$CR_JOBS
}
BUILD_DTB()
{
	echo "Building DTB for $CR_VARIANT"
	export $CR_ARCH
	export CROSS_COMPILE=$CR_TC
	export ANDROID_MAJOR_VERSION=$CR_ANDROID
	make  $CR_CONFG
	make $CR_DTSFILES
	./scripts/dtbTool/dtbTool -o ./boot.img-dtb -d $CR_DTS/ -s 2048
	du -k "./boot.img-dtb" | cut -f1 >sizT
	sizT=$(head -n 1 sizT)
	rm -rf sizT
	echo "Combined DTB Size = $sizT Kb"
	rm -rf $CR_DTS/.*.tmp
	rm -rf $CR_DTS/.*.cmd
	rm -rf $CR_DTS/*.dtb
}
PACK_BOOT_IMG()
{
	#echo "Building Boot.img for $CR_VARIANT"
	#cp -rf $CR_RAMDISK/* $CR_AIK
	#cp $CR_KERNEL $CR_OUT/kernelv2-1/zImage
	#cp $CR_DTB $CR_OUT/kernelv2-1/dtb
	#cp $CR_KERNEL $CR_AIK/split_img/boot.img-zImage
	cp $CR_KERNEL $CR_AIK/boot.img-zImage
	cp $CR_DTB $CR_AIK/boot.img-dtb
	#cp $CR_DTB $CR_AIK/split_img/boot.img-dtb
	#$CR_AIK/repackimg.sh
	#echo -n "SEANDROIDENFORCE" » $CR_AIK/image-new.img
	#cp $CR_AIK/image-new.img $CR_OUT/boot.img
	#cp $CR_AIK/image-new.img $CR_OUT/image-new.img
	#mv $CR_AIK/image-new.img $CR_OUT/$CR_NAME-$CR_VERSION-$CR_VARIANT.img
	#cp $CR_OUT/boot.img  /home/m/share/MINHKA_kernel_j7prov2/MINHKA/j730g/boot.img
	#zip -r /home/m/share/kernel_j7pro.zip  /home/m/share/MINHKA_kernel_j7pro/META-INF/ /home/m/share/MINHKA_kernel_j7pro/MINHKA/
	$CR_AIK/cleanup.sh 
}
            clear
            CLEAN_SOURCE
           # echo "Starting $CR_VARIANT_J701M kernel build..."
            CR_VARIANT=$CR_VARIANT_J701M
	    CR_CONFG=$CR_CONFG_J701M
            CR_DTSFILES=$CR_DTSFILES_J701M
	    BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            echo "$CR_VARIANT kernel build finished."
            echo "$CR_VARIANT Ready at $CR_OUT"
            echo "Combined DTB Size = $sizT Kb"
           

