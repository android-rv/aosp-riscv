#!/bin/bash
set -e
SCRIPT_PATH=`realpath $0`
export AOSP_RISCV_TOP=`dirname $SCRIPT_PATH`
export AOSP_RISCV_PATCH_TOP=${AOSP_RISCV_TOP}/patches
export AOSP_RISCV_BUILD_TOP=${AOSP_RISCV_TOP}/..

#check path
if [ -z $AOSP_RISCV_TOP -o $AOSP_RISCV_TOP = "" ] ; then
    echo "Script path is not valid."
    exit -1
fi

mkdir -p ${AOSP_RISCV_TOP}/stages

#download prebuilts
if [ ! -f ${AOSP_RISCV_TOP}/stages/.stamp_download_pre ]; then
    ${AOSP_RISCV_TOP}/script/download_prebuilts.sh
    touch ${AOSP_RISCV_TOP}/stages/.stamp_download_pre
fi

#patch aosp
if [ ! -f ${AOSP_RISCV_TOP}/stages/.stamp_aosp_patch ]; then
    ${AOSP_RISCV_TOP}/script/patch.sh
    touch ${AOSP_RISCV_TOP}/stages/.stamp_aosp_patch
fi
