# AnyKernel2 Ramdisk Mod Script
# osm0sis @ xda-developers

# AnyKernel setup
properties() {
do.devicecheck=0
do.modules=0
do.cleanup=1
do.cleanuponabort=0
}

block=/dev/block/platform/13540000.dwmmc0/by-name/BOOT;
is_slot_device=0;
ramdisk_compression=auto;

# AnyKernel methods (DO NOT CHANGE)
. /tmp/anykernel/tools/ak2-core.sh;

# AnyKernel install
dump_boot;

# Enable Spectrum Support
replace_file sbin/spa 755 spectrum/spa;
replace_file init.spectrum.rc 644 spectrum/init.spectrum.rc;
replace_file init.spectrum.sh 644 spectrum/init.spectrum.sh;
insert_line init.samsungexynos7870.rc "import init.spectrum.rc" after "import init.fac.rc" "import init.spectrum.rc";

write_boot;

# end install
