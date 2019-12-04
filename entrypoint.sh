#!/bin/bash -x
echo "Building reposiotory ${1} on branch ${2}."
source /opt/rh/devtoolset-2/enable
git clone ${1} repository
cd repository
git checkout ${2}
sed -i -e 's : / ' -e 's git@ http:// ' .gitmodules
git submodule update --init
./build.sh
cp release/* SVSBase/release/* /out
exit 0
