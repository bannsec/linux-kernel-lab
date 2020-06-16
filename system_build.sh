
qemu-img create rootfs.img 2G
mkfs.ext4 rootfs.img
mkdir mnt
mount -o loop rootfs.img mnt/
debootstrap focal mnt/
sed -i 's/root:.:/root::/g' mnt/etc/shadow

# Apparently deboostrap is unmounting proc...
mount -t proc proc /proc
umount mnt

# Convert to qcow2 to save space
qemu-img convert -O qcow2 ./rootfs.img rootfs.qcow2
rm rootfs.img
qemu-img resize rootfs.qcow2 16G

echo "Use 'system_start.sh <kernel>' to run the system with your kernel."
echo "Use 'system_attach.sh <kernel>' to attach to the system with gdb."
