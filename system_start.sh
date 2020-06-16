
if [[ "$#" != "1" ]]; then
    echo "Usage: $0 <kernel_to_use>"
    echo "Example: $0 linux-4.20.6/arch/x86/boot/bzImage"
    exit 1
fi

qemu-system-x86_64 -nic user,model=virtio-net-pci -nographic -kernel $1 -hda rootfs.qcow2 -append "root=/dev/sda rw console=ttyS0" -s
