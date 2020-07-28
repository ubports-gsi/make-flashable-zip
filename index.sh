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
mkdir data
cd data
echo "Downloading rootfs.img"
wget -q "http://oldpc/ci/view/all/job/ubports-gsi-rootfs-to-img/lastSuccessfulBuild/artifact/target-rootfs.img" -O rootfs.img || exit 1
echo "Downloading system.img"
wget -q "http://oldpc/ci/view/all/job/ubports-gsi-rootfs-to-img/lastSuccessfulBuild/artifact/target-system.img" -O system.img || exit 1
cd ..
sed -i "s/DEVICE/$DEVICE/g" META-INF/com/google/android/update-binary
sed -i "s/BRANCH_NAME/$BRANCH_NAME/g" META-INF/com/google/android/update-binary
sed -i "s/BUILD_ID/$BUILD_ID/g" META-INF/com/google/android/update-binary
sed -i "s/JENKINS_URL/$(printf '%s\n' "$JENKINS_URL" | sed -e 's/[\/&]/\\&/g')/g" META-INF/com/google/android/update-binary


rm ../target.zip &>/dev/null
zip ../target.zip * -r
