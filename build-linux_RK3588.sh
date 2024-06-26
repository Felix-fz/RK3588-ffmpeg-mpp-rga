#!/bin/bash

# --------------- source --------------- #
set -e

TARGET_SOC="rk3588"
GCC_COMPILER=aarch64-linux-gnu

# export LD_LIBRARY_PATH=${TOOL_CHAIN}/lib64:$LD_LIBRARY_PATH
export CC=${GCC_COMPILER}-gcc
export CXX=${GCC_COMPILER}-g++

ROOT_PWD=$( cd "$( dirname $0 )" && cd -P "$( dirname "$SOURCE" )" && pwd )

# build
BUILD_DIR=${ROOT_PWD}/build/build_linux_aarch64

if [[ ! -d "${BUILD_DIR}" ]]; then
  mkdir -p ${BUILD_DIR}
fi

cd ${BUILD_DIR}
cmake ../.. -DCMAKE_SYSTEM_NAME=Linux -DTARGET_SOC=${TARGET_SOC}
make -j4
# make install
cd -

cd build/build_linux_aarch64
./mpp_test

# cd install/rknn_yolov5_demo_Linux

# ./rknn_yolov5_video_demo ./model/RK3588/sci12.rknn ./model/JS_VPPA000.mp4 ./model/RK3588/VIFv1116.rknn ./model/RK3588/RRNv1116.rknn

#./model/palace.mp4   rtmp://192.168.2.48/video  JS_VPPA000.mp4

#rtsp://192.168.2.32:8557/ch00/PSIA/Streaming/channels/2

#./model/palace.mp4 

#./model/RK3588/sci12.rknn ./model/test5.mp4  ./model/RK3588/VIFv6.rknn ./model/RK3588/rrn_v4.rknn


# rtsp://192.168.0.102:8554/video
