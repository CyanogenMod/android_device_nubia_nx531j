#!/system/bin/sh
factory=`getprop persist.sys.usb.factory`
config="$1"

case $factory in
    "0")
        case $config in
            "nubia")
                echo 0 > /sys/class/android_usb/android0/enable
                echo 19D2 > /sys/class/android_usb/android0/idVendor
                echo FFCC > /sys/class/android_usb/android0/idProduct
                echo mass_storage > /sys/class/android_usb/android0/functions
                echo 1 > /sys/class/android_usb/android0/enable
            ;;
            "nubia_adb" | "")
                echo 0 > /sys/class/android_usb/android0/enable
                echo 19D2 > /sys/class/android_usb/android0/idVendor
                echo FFCD > /sys/class/android_usb/android0/idProduct
                echo mass_storage,adb > /sys/class/android_usb/android0/functions
                echo 1 > /sys/class/android_usb/android0/enable
            ;;
            *)
                echo "$0: Invalid argument ($config)"
            ;;
        esac
    ;;
    *)
        case $config in
            "nubia")
                echo 0 > /sys/class/android_usb/android0/enable
                echo 19D2 > /sys/class/android_usb/android0/idVendor
                echo FFAF > /sys/class/android_usb/android0/idProduct
                echo char_bridge > /sys/class/android_usb/android0/f_serial/transports
                echo diag > /sys/class/android_usb/android0/f_diag/clients
                echo diag,serial,mass_storage > /sys/class/android_usb/android0/functions
                echo 1 > /sys/class/android_usb/android0/enable
            ;;
            "nubia_adb" | "")
                echo 0 > /sys/class/android_usb/android0/enable
                echo 19D2 > /sys/class/android_usb/android0/idVendor
                echo FFB0 > /sys/class/android_usb/android0/idProduct
                echo char_bridge > /sys/class/android_usb/android0/f_serial/transports
                echo diag > /sys/class/android_usb/android0/f_diag/clients
                echo diag,serial,mass_storage,adb > /sys/class/android_usb/android0/functions
                echo 1 > /sys/class/android_usb/android0/enable
            ;;
            *)
                echo "$0: Invalid argument ($config)"
            ;;
        esac
    ;;
esac

