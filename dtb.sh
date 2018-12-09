#!/bin/bash
#
# Cronos Build Script
# For Exynos7870
# Coded by BlackMesa/AnanJaser1211 @2018
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software

# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Directory Contol
CR_DIR=$(pwd)
CR_TC=/home/m/kernel/aarch64-linux-android-4.9/bin/aarch64-linux-android-
CR_DTS=arch/arm64/boot/dts
CR_OUT=$CR_DIR/MK/Out
CR_AIK=$CR_DIR/MK/A.I.K
CR_RAMDISK=$CR_DIR/MK/Ramdisk
CR_KERNEL=$CR_DIR/arch/arm64/boot/Image
CR_DTB=$CR_DIR/boot.img-dtb
# Kernel Variables
CR_VERSION=V2.3
CR_NAME=MINHKA_Kernel
CR_JOBS=5
CR_ANDROID=o
CR_PLATFORM=8.1.0
CR_ARCH=arm64
# Init build
export CROSS_COMPILE=$CR_TC
export ANDROID_MAJOR_VERSION=$CR_ANDROID
export PLATFORM_VERSION=$CR_PLATFORM
export $CR_ARCH
##########################################
# Device specific Variables [SM-J730F/G]
CR_DTSFILES_J730F="exynos7870-j7y17lte_eur_open_00.dtb exynos7870-j7y17lte_eur_open_01.dtb exynos7870-j7y17lte_eur_open_02.dtb exynos7870-j7y17lte_eur_open_03.dtb exynos7870-j7y17lte_eur_open_04.dtb exynos7870-j7y17lte_eur_open_05.dtb exynos7870-j7y17lte_eur_open_06.dtb exynos7870-j7y17lte_eur_open_07.dtb"
CR_CONFG_J730F=j7y17lte_eur_open_defconfig
CR_VARIANT_J730F=J730F-G
#####################################################
################# TEST VERSION ######################
#####################################################

# Script functions
PACK_BOOT_IMG()
{
	echo "----------------------------------------------"
	echo " "
	echo "Building Boot.img for $CR_VARIANT"
	cp -rf $CR_RAMDISK/* $CR_AIK
	cp $CR_KERNEL $CR_OUT/kernelv2-1/zImage
	cp $CR_DTB $CR_OUT/kernelv2-1/dtb
	cp $CR_KERNEL $CR_AIK/split_img/boot.img-zImage
	cp $CR_DTB $CR_AIK/split_img/boot.img-dtb
	$CR_AIK/repackimg.sh
	echo -n "SEANDROIDENFORCE" » $CR_AIK/image-new.img
	mv $CR_AIK/image-new.img $CR_OUT/$CR_NAME-$CR_VERSION-$CR_VARIANT.img
	$CR_AIK/cleanup.sh
}
#####################################################
################# TEST VERSION ######################
#####################################################
TEST_KERNEL()
{
echo "Cleaning"
# make clean
# make mrproper
# rm -r -f $CR_OUT/*
CR_VARIANT=$CR_VARIANT_TEST
CR_VERSION2=$CR_VERSION_TEST
CR_NAME=$CR_NAME_TEST
rm -r -f $CR_DTB
rm -rf $CR_DTS/.*.tmp
rm -rf $CR_DTS/.*.cmd
rm -rf $CR_DTS/*.dtb
echo "Building zImage for $CR_VARIANT"
export LOCALVERSION=-$CR_NAME-$CR_VERSION2-$CR_VARIANT
make  $CR_CONFG_TEST
make -j$CR_JOBS
echo "Building DTB for $CR_VARIANT"
export $CR_ARCH
export CROSS_COMPILE=$CR_TC
export ANDROID_MAJOR_VERSION=$CR_ANDROID
make  $CR_CONFG_TEST
make $CR_DTSFILES_TEST
./scripts/dtbTool/dtbTool -o ./boot.img-dtb -d $CR_DTS/ -s 2048
du -k "./boot.img-dtb" | cut -f1 >sizT
sizT=$(head -n 1 sizT)
rm -rf sizT
echo "Combined DTB Size = $sizT Kb"
rm -rf $CR_DTS/.*.tmp
rm -rf $CR_DTS/.*.cmd
rm -rf $CR_DTS/*.dtb
echo "Building Boot.img for $CR_VARIANT_TEST"
cp -rf $CR_RAMDISK/* $CR_AIK
mv $CR_KERNEL $CR_AIK/split_img/boot.img-zImage
mv $CR_DTB $CR_AIK/split_img/boot.img-dtb
$CR_AIK/repackimg.sh
echo -n "SEANDROIDENFORCE" » $CR_AIK/image-new.img
mv $CR_AIK/image-new.img $CR_OUT/$CR_NAME-$CR_VERSION2-$CR_VARIANT.img
$CR_AIK/cleanup.sh
}
            clear
            CLEAN_SOURCE
            echo "Starting $CR_VARIANT_J730F kernel build..."
            CR_VARIANT=$CR_VARIANT_J730F
	    CR_CONFG=$CR_CONFG_J730F
            CR_DTSFILES=$CR_DTSFILES_J730F
	    BUILD_ZIMAGE
            BUILD_DTB
            PACK_BOOT_IMG
            echo " "
            echo "----------------------------------------------"
            echo "$CR_VARIANT kernel build finished."
            echo "$CR_VARIANT Ready at $CR_OUT"
            echo "Combined DTB Size = $sizT Kb"
	    echo "Press Any key to end the script"
            echo "----------------------------------------------"
            read -n1 -r key
           

