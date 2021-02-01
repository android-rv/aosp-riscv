apply_patch(){
	echo apply patch for $1
	pushd . >> /dev/null
	cd ${AOSP_RISCV_BUILD_TOP}/$1
	git apply ${AOSP_RISCV_PATCH_TOP}/$1/*.patch
	popd >> /dev/null
}

apply_zip(){
	echo unpack zip for $1
	#rm -rf  $1
	pushd . >> /dev/null
	mkdir -p ${AOSP_RISCV_BUILD_TOP}/$1
	cd ${AOSP_RISCV_BUILD_TOP}/$1
	unzip -q -o ${AOSP_RISCV_PATCH_TOP}/$1/*.zip
	popd >> /dev/null
}

apply_patch cts
apply_patch prebuilts/clang/host/linux-x86
apply_patch prebuilts/ndk
apply_patch prebuilts/vndk/v28
apply_patch prebuilts/vndk/v27

apply_zip prebuilts/gcc/linux-x86/riscv64/
apply_zip prebuilts/misc
apply_zip prebuilts/ndk
apply_zip prebuilts/qemu-kernel
apply_zip prebuilts/android-emulator
apply_zip prebuilts/clang-tools
apply_zip prebuilts/clang/host/linux-x86
apply_zip prebuilts/vndk/v28
