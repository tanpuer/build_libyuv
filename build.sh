#!/bin/bash
SDK_PATH=/Users/dzsb-000848/Library/Android/sdk
NDK_PATH=$SDK_PATH/ndk-bundle

function build 
{
cmake -G"Unix Makefiles" \
-DANDROID_NDK=${NDK_PATH} \
-DCMAKE_TOOLCHAIN_FILE=${NDK_PATH}/build/cmake/android.toolchain.cmake \
-DANDROID_ABI=$1 \
-DANDROID_NATIVE_API_LEVE=16 \
-DCMAKE_INSTALL_PREFIX=`pwd`/android/arm/$1 \
-DANDROID_ARM_NEON=TRUE \

make clean
make -j8 install
}


build armeabi-v7a

build arm64-v8a