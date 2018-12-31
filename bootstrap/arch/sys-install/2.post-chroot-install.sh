#! /bin/bash

ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
sed -i 's/^#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen
sed -i 's/^#pt_BR.UTF-8 UTF-8/pt_BR.UTF-8 UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf
echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 jupiter-arch.rafaelmoreira.org jupiter-arch" >> /etc/hosts
systemctl enable dhcpcd.service
mkinitcpio -p linux
passwd
pacman -Syu
echo "vmware || hyper-v || physical? "
read mtype
if [ $mtype == "vmware" ]
then
  # vmware setup
  pacman -S vim grub 
  grub-install --target=i368-pc /dev/sda
elif [ $mtype == "hyper-v" ]
then
	pacman -S vim grub efibootmgr
	grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch
elif [ $mtype == "physical" ]
then
  # phys machine setup
  pacman -S vim intel-ucode grub efibootmgr
  grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=arch
fi
sed -i 's/^GRUB_CMDLINE_LINUX_DEFAULT="quiet"/GRUB_CMDLINE_LINUX_DEFAULT=""/' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg
