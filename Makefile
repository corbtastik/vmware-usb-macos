devices:
	diskutil list

esxi.img.dmg:
	hdiutil convert -format UDRW -o esxi.img esxi.iso

vmware: esxi.img.dmg
	# Format USB device as a bootable MS-DOS volume
	diskutil unmountDisk /dev/disk$(DISK)
	diskutil eraseDisk MS-DOS ESXI MBR /dev/disk$(DISK)
	# Mount USB device to add SYSLINUX.CFG and remove ISOLINUX.CFG
	mkdir -p source
	mkdir -p target
	hdiutil mount esxi.iso -mountpoint ./source
	cp -r source/ /Volumes/ESXI/
	cp SYSLINUX.CFG /Volumes/ESXI/
	rm /Volumes/ESXI/ISOLINUX.CFG
	hdiutil eject ./source
	diskutil unmountDisk /dev/disk$(DISK)
	diskutil eject /dev/disk$(DISK)
	rm -rf source
	rm -rf target
	rm esxi.img.dmg	
