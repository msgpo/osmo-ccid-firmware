#!/bin/bash

GADGET_NAME=osmo-hub

GADGET_CONFIGFS=/sys/kernel/config/usb_gadget

set -e
set -x

gadgetdir="$GADGET_CONFIGFS/$GADGET_NAME"

# unmount the endpoints from the filesystem
umount /dev/ffs-hub

# detach from USB gadget/bus
echo "" > "$gadgetdir/UDC" || true

# remove function from config
rm "$gadgetdir/configs/c.1/ffs.usb0"

# remove strings in config
rmdir "$gadgetdir/configs/c.1/strings/0x409"

# remove config
rmdir "$gadgetdir/configs/c.1"

# remove function
rmdir "$gadgetdir/functions/ffs.usb0"

# remove strings in gadget
rmdir "$gadgetdir/strings/0x409"

rmdir $gadgetdir
