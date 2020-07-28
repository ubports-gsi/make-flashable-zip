#!/bin/bash

#   creating: data/
#  inflating: data/system.img
#  inflating: data/rootfs.img
#   creating: META-INF/
#   creating: META-INF/com/
#   creating: META-INF/com/google/
#   creating: META-INF/com/google/android/
#  inflating: META-INF/com/google/android/update-binary
# extracting: META-INF/com/google/android/updater-script
#   creating: tools/
#  inflating: tools/busybox
#  inflating: ubports.sh

home=`pwd`
rm -rf buildzip
cp ziptemplate buildzip -r
cd buildzip
cd data
rm rootfs.img system.img
wget "http://oldpc/ci/view/all/job/ubports-gsi-rootfs-to-img/lastSuccessfulBuild/artifact/target-rootfs.img" -O rootfs.img
wget "http://oldpc/ci/view/all/job/ubports-gsi-rootfs-to-img/lastSuccessfulBuild/artifact/target-system.img" -O system.img
cd ..
zip ../../target/target.zip * -r
