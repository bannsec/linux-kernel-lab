FROM ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt dist-upgrade -y qemu-system-x86 qemu-utils wget vim build-essential gdb debootstrap less flex bison libelf-dev libssl-dev bc curl
RUN mkdir -p /opt/linux-kernel-lab

WORKDIR /opt/linux-kernel-lab
COPY . .

CMD "/bin/bash"
