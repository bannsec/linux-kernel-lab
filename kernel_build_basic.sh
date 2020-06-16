
if [[ "$#" == "1" ]]; then
    pushd . >/dev/null
    cd $1
else
    echo "Usage: $0 <base_dir_of_kernel_src>"
    exit 1
fi

make defconfig
make kvmconfig
./scripts/config -e CONFIG_DEBUG_INFO -d CONFIG_RANDOMIZE_BASE -d CONFIG_MODULES -e GDB_SCRIPTS
make olddefconfig
make -j`nproc`

popd >/dev/null

# gdb -ex 'target remote :1234' -iex 'source linux-5.7.2/scripts/gdb/vmlinux-gdb.py' linux-5.7.2/vmlinux
