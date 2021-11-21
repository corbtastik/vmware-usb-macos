# vmware-usb-osx

This repo is a fork of [cbednarski/vmware-usb-osx](https://github.com/cbednarski/vmware-usb-osx) with slight tweaks to the `Makefile` and `README.md`.

For the most part my homelab is made up of Apple Mac-minis (6,2 & 8,1) and Mac Pro Cheese Graters (5,1) because they're easy to come by, cheap, low maintenance, and run ESXi well.

* This `Makefile` helps in creating a bootable USB installer for VMware ESXi on MacOS.

## vSphere Hypervisor version

VMware vSphere Hypervisor is proprietary software, however VMware offers a free version that I don't know much about. Please do your due diligence to determine which version is appropriate for you.

## Prerequisites

* You're running on MacOS.
* Download the VMware vSphere Hypervisor (aka ESXi) ISO from [VMware](https://www.vmware.com/go/download-vsphere).
  * For example: `VMware-VMvisor-Installer-201912001-15160138.x86_64.iso`

## Instructions

1. Copy the ESXi ISO into the same folder as this project.
2. Rename the ESXi ISO to `esxi.iso` so the `Makefile` can find it.
3. Run `make devices` to list storage devices.
4. Insert your USB stick.
5. Run `make devices` and you'll see the new device for your USB stick.
6. Note the disk number for your USB stick. It will be something like `/dev/disk2`. The only part you care about is **2** (or **3**, or **4**, or whatever it is). Use this number in the next step.
7. Run `make vmware DISK=2`, this will format and copy ISO installer content to the USB stick. This could take a couple minutes to complete and will prompt for your password.
8. Pop the USB stick into the computer you want to install ESXi on, restart and follow instructions.
