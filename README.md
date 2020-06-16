
# What
Helper scripts for creating a lab environment for learning about the linux kernel. Specifically, this helps to create an environment where you can step through the source of the kernel as it runs to see whats going on.

# Docker
Docker isn't explicitly needed. However, it is confirmed to have the required libraries installed for basic kernel building and is tested against the build scripts.

The run the docker environment:

```bash
sudo docker run -it --name lkl -h lkl --privileged --device /dev/kvm --network host -v $PWD:/data -v /tmp/.X11-unix/:/tmp/.X11-unix -e DISPLAY=$DISPLAY bannsec/linux-kernel-lab
```

# Using the scripts
## Quick Start
Use the following commands to setup and run things.

```bash
# One time need. This will build a base ubuntu focal system for you
./system_build.sh

# Grab a kernel from kernel.org
wget <kernel>
tar xf <kernel>

# Build script helps to build a minimal kernel.
# Tweak the steps if you wish
./kernel_build_basic.sh <kernel_directory>

# Start up the system with your kernel
./system_start.sh <kernel>

# In a separate window, attach to it
./system_attach.sh <vmlinuz>

# Once attached, you can test it out by breaking on sys open call
gdb> hbreak do_sys_open

# Inside the VM, do anything that will cause an open file
cat /etc/passwd
```

# FAQ
## How do I login?
Login to the system with `root` and no password.

## What are helpful GDB commands?
Non-exhaustive:

- hbreak (hardware breakpoint)
- apropos lx (show helpful kernel gdb commands)

## I can't get to the internet
You may need to manually run `dhclient enp0s3` from inside the VM to correctly configure it.
