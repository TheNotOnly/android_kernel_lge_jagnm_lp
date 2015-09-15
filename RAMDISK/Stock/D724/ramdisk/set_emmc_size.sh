#!/system/bin/sh

#10485760 is 5GB size
#18874368 is 9GB size
#15269888 is 8GB size
#30777344 is 16GB size
#30785536 is 16GB size(hynix 16GB)
#61071360 is 32GB size

emmc_size=`cat /sys/block/mmcblk0/size`

case "$emmc_size" in
        "61071360")
    setprop persist.sys.emmc_size 32GB
    echo 32GB model
    ;;
esac

case "$emmc_size" in
        "30777344")
    setprop persist.sys.emmc_size 16GB
    echo 16GB model
    ;;
esac

case "$emmc_size" in
        "30785536")
    setprop persist.sys.emmc_size 16GB
    echo 16GB model
    ;;
esac

case "$emmc_size" in
        "18874368")
    setprop persist.sys.emmc_size 8GB
    echo 8GB model
    ;;
esac

case "$emmc_size" in
        "15269888")
    setprop persist.sys.emmc_size 8GB
    echo 8GB model
    ;;
esac

case "$emmc_size" in
        "12582912")
    setprop persist.sys.emmc_size 4GB
    echo 4GB model
    ;;
esac
