pacman -Syu --needed --noconfirm --noprogressbar 
pacman -Sy autogen efibootmgr base-devel python rsync fuse2 xorg-xauth libxinerama libxrandr libxcursor imlib2 libqalculate hicolor-icon-theme gtk-update-icon-cache git sudo fakeroot go binutils rofi  docbook-xsl libdrm patch autoconf automake gcc bdf-unifont help2man ttf-dejavu --needed --noconfirm --noprogressbar 
tee -a /etc/sudoers > /dev/null <<EOT
nobody    ALL=(ALL) NOPASSWD:ALL
EOT
chmod -R 777 .
su -s /bin/sh nobody -c "./main.sh"
