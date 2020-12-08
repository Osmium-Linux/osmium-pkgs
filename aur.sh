#!/usr/bin/env bash

## This script will generate osmium pkg-files.

## Dirs
DIR="$(pwd)"
PKGDIR="$DIR/osmium-pkgs"

## Packages
PKGS=($(ls $PKGDIR))

##Pacman Packages
#Themix 
sudo pacman -Sy findutils sed git python 
#Webmin
sudo pacman -Sy openssl perl perl-net-ssleay perl-socket6
#Perl Modules
sudo pacman -Sy perl-module-build
#Yay
sudo pacman -Sy sudo go
#Oomox 
sudo pacman -Sy bc findutils gdk-pixbuf2 glib42 gnome-themes-extra grep gtk-engine-murrine gtk-engines gtk3 imagemagick librsvg optipng parallel polkit python-gobject python-pillow python-pystache python-yaml sassc sed zip ##AUR, Fix later breeze-icons colorz gksu python-colorthief python-haishoku xorg-xrdb
#Pygtk
sudo pacman -Sy libglade python2-cairo python2-gobject2 python2-numpy
#Openbox Patched
sudo pacman -Sy imlib2 librsvg libsm libxcursor libxinerama libxml2 libxrandr pango startup-notification python2-pyxdg
#Mkinitcpio Openswap
sudo pacman -Sy mkinitcpio
#Plymouth
sudo pacman -Sy libdrm pango docbook-xsl cantarell-fonts ttf-dejavu xf86-video-fbdev
#Tela Icon Theme
sudo pacman -Sy gtk-update-icon-cache hicolor-icon-theme
#Grub Theme Slaze
sudo pacman -Sy grub
#Obmenu Generator
sudo pacman -Sy perl-data-dump openbox perl-linux-desktopfiles perl gtk2-perl perl-file-desktopentry perl-gtk3
#Loksh
sudo pacman -Sy libbsd meson
#Opensnap
sudo pacman -Sy wmctrl
#Arc Gtk theme 
sudo pacman -Sy inkscape optipng sassc gnome-themes-extra gtk-engine-murrine
#Python Gettext
sudo pacman -Sy python-setuptools python2-setuptools
#Themix Icons Suru Plus Aspromauros
sudo pacman -Sy findutils sed git python
#Themix Icons Suru Plus
sudo pacman -Sy gnome-icon-theme gnome-icon-theme-symbolic
#Themix Gui
sudo pacman -Sy gtk3 xorg-xrdb python-gobject
#Perl Encode Detect
sudo pacman -Sy perl perl-module-build
#Resvg
sudo pacman -Sy rust cairo gdk-pixbuf2 clang cmake extra-cmake-modules kio pango qt5-base qt5-tools 
#Colorz
sudo pacman -Sy python python-pillow python-scipy
#Gconf
sudo pacman -Sy dbus-glib libldap libxml2 polkit python gnome-common gobject-introspection gtk-doc intltool
#Libgksu colormap fix
sudo pacman -Sy gtk2 libgnome-keyring libgtop startup-notification gtk-doc intltool
#Gksu 
sudo pacman -Sy xorg-xauth gtk-doc intltool
#Themix Icons Archdroid
sudo pacman -Sy findutils sed git python breeze-icons gnome-icon-theme gnome-icon-theme-symbolic oxygen-icons
#Themix Plugin Base16
sudo pacman -Sy python-pystache python-yaml
#Openbox Patched
##AUR Packages
#Installing Yay
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ..
rm -rf paru
#Webmin
yay -Sy perl-authen-pam perl-encode-detect 
#Oomox
yay -Sy resvg colorz gksu python-colorthief python-haishoku
#Obmenu Generator
yay -Sy perl-linux-desktopfiles
#Themix Icons Suru Plus
yay -Sy yaru-icon-theme
#Themix Full
yay -Sy themix-export-spotify-git themix-icons-archdroid-git themix-icons-gnome-colors-git\
themix-icons-numix-git themix-icons-papirus-git themix-icons-suru-plus-aspromauros-git\
themix-icons-suru-plus-git themix-import-images-git themix-plugin-base16-git themix-theme-materia-git themix-theme-oomox-git
#unknown
yay -Sy pygtk
###Build

#Webmin
cd $PKGDIR
git clone https://aur.archlinux.org/webmin.git
cd webmin
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/webmin/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/webmin

#Nvidia-All
cd $PKGDIR
git clone https://github.com/Osmium-Linux/nvidia-all-noninteractive.git
git clone https://github.com/Frogging-Family/nvidia-all
cd nvidia-all
sed -i 's/install -D -m755 "libnvoptix.so.${pkgver}"/#deleted/g' PKGBUILD
cd ..
rm ./nvidia-all/customization.cfg 
cp ./nvidia-all-noninteractive/fileskept/customization.cfg ./nvidia-all/
cd nvidia-all
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/nvidia-all/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/nvidia-all-noninteractive
rm -rf ./osmium-pkgs/nvidia-all

#Pygtk
cd $PKGDIR
git clone https://aur.archlinux.org/pygtk.git
cd pygtk
makepkg -sfd
cd $DIR
rm -rf pygtk
mv ./osmium-pkgs/pygtk/*.pkg.tar.zst ./x86_64/

#Osmium Plymouth Theme
#cd $PKGDIR
#git clone https://github.com/Osmium-Linux/osmium-plymouth-theme.git
#cd osmium-plymouth-theme
#makepkg -sfd
#cd $DIR
#mv ./osmium-pkgs/osmium-plymouth-theme/*.pkg.tar.zst ./x86_64/
#rm -rf ./osmium-pkgs/osmium-plymouth-theme/

#Openbox Patched
cd $PKGDIR
git clone https://aur.archlinux.org/openbox-patched.git
cd openbox-patched
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/openbox-patched/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/openbox-patched

#Mkinitcpio Openswap
cd $PKGDIR
git clone https://aur.archlinux.org/mkinitcpio-openswap.git
cd mkinitcpio-openswap
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/mkinitcpio-openswap/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/mkinitcpio-openswap

#Plymouth
cd $PKGDIR
git clone https://aur.archlinux.org/plymouth.git
cd plymouth
makepkg -sfd 
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/plymouth/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/plymouth

#Oranchelo Icon Theme
cd $PKGDIR
git clone https://aur.archlinux.org/oranchelo-icon-theme.git
cd oranchelo-icon-theme
makepkg -sfd 
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/oranchelo-icon-theme/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/oranchelo-icon-theme

#Tela Icon Theme
cd $PKGDIR
git clone https://aur.archlinux.org/tela-icon-theme.git
cd tela-icon-theme
makepkg -sfd 
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/tela-icon-theme/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/tela-icon-theme

#Grub theme slaze
cd $PKGDIR
git clone https://aur.archlinux.org/grub-theme-slaze-git.git
cd grub-theme-slaze-git
makepkg -sfd 
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/grub-theme-slaze-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/grub-theme-slaze-git

#Obmenu Generator
cd $PKGDIR
git clone https://aur.archlinux.org/obmenu-generator.git
cd obmenu-generator
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/obmenu-generator/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/obmenu-generator

#TTF Comfortaa
cd $PKGDIR
git clone https://aur.archlinux.org/ttf-comfortaa.git
cd ttf-comfortaa
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/ttf-comfortaa/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/ttf-comfortaa

#TTF Iosevka
cd $PKGDIR
git clone https://aur.archlinux.org/ttf-iosevka.git
cd ttf-iosevka
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/ttf-iosevka/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/ttf-iosevka

#PERL Linux Desktopfiles
cd $PKGDIR
git clone https://aur.archlinux.org/perl-linux-desktopfiles.git
cd perl-linux-desktopfiles
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/perl-linux-desktopfiles/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/perl-linux-desktopfiles

#LOKSH Git
cd $PKGDIR
git clone https://aur.archlinux.org/loksh-git.git
cd loksh-git
makepkg -sfd 
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/loksh-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/loksh-git

#Opensnap
cd $PKGDIR
git clone https://aur.archlinux.org/opensnap.git
cd opensnap
makepkg -sfd 
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/opensnap/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/opensnap

#Arc GTK Theme Git
cd $PKGDIR
git clone https://aur.archlinux.org/arc-gtk-theme-git.git
cd arc-gtk-theme-git
makepkg -sfd 
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/arc-gtk-theme-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/arc-gtk-theme-git

#Openbox Arc Theme
cd $PKGDIR
git clone https://aur.archlinux.org/openbox-arc-git.git
cd openbox-arc-git 
makepkg -sfd 
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/openbox-arc-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/openbox-arc-git 

#Python Gettext
cd $PKGDIR
git clone https://aur.archlinux.org/python-gettext.git
cd python-gettext
makepkg -sfd 
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/python-gettext/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/python-gettext

#Suru Plus Aspromauros git
cd $PKGDIR
git clone https://aur.archlinux.org/suru-plus-aspromauros-git.git
cd suru-plus-aspromauros-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/suru-plus-aspromauros-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/suru-plus-aspromauros-git

#Suru Plus Dark Git
cd $PKGDIR
git clone https://aur.archlinux.org/suru-plus-dark-git.git
cd suru-plus-dark-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/suru-plus-dark-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/suru-plus-dark-git

#Suru Plus Git
cd $PKGDIR
git clone https://aur.archlinux.org/suru-plus-git.git
cd suru-plus-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/suru-plus-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/suru-plus-git

#Suru Plus Pack Git
cd $PKGDIR
git clone https://aur.archlinux.org/suru-plus-pack-git.git
cd suru-plus-pack-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/suru-plus-pack-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/suru-plus-pack-git

#Suru Plus Telinkrin git
cd $PKGDIR
git clone https://aur.archlinux.org/suru-plus-telinkrin-git.git
cd suru-plus-telinkrin-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/suru-plus-telinkrin-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/suru-plus-telinkrin-git

#Themix Icons Suru Plus Aspromauros Git
cd $PKGDIR
git clone https://aur.archlinux.org/themix-icons-suru-plus-aspromauros-git.git
cd themix-icons-suru-plus-aspromauros-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/themix-icons-suru-plus-aspromauros-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/themix-icons-suru-plus-aspromauros-git

#Themix Icons Suru Plus Git
cd $PKGDIR
git clone https://aur.archlinux.org/themix-icons-suru-plus-git.git
cd themix-icons-suru-plus-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/themix-icons-suru-plus-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/themix-icons-suru-plus-git

#Themix Full Git
cd $PKGDIR
git clone https://aur.archlinux.org/themix-full-git.git
cd themix-full-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/themix-full-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/themix-full-git

#Themix Gui Git
cd $PKGDIR
git clone https://aur.archlinux.org/themix-gui-git.git
cd themix-gui-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/themix-gui-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/themix-gui-git

#Perl Encode Detect
cd $PKGDIR
git clone https://aur.archlinux.org/perl-encode-detect.git
cd perl-encode-detect
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/perl-encode-detect/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/perl-encode-detect

#Perl Authen Pam
cd $PKGDIR
git clone https://aur.archlinux.org/perl-authen-pam.git
cd perl-authen-pam
makepkg -sf
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/perl-authen-pam/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/perl-authen-pam

#Suru Icon Theme
cd $PKGDIR
git clone https://aur.archlinux.org/suru-icon-theme-git.git
cd suru-icon-theme-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/suru-icon-theme-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/suru-icon-theme-git

#Oomox
cd $PKGDIR
git clone https://aur.archlinux.org/oomox.git
cd oomox
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/oomox/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/oomox

#Resvg
cd $PKGDIR
git clone https://aur.archlinux.org/resvg.git
cd resvg
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/resvg/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/resvg

#Yay
cd $PKGDIR
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/yay/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/yay

#humanity-icon-theme
cd $PKGDIR
git clone https://aur.archlinux.org/humanity-icon-theme.git
cd humanity-icon-theme
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/humanity-icon-theme/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/humanity-icon-theme

#yaru-icon-theme
cd $PKGDIR
git clone https://aur.archlinux.org/yaru.git
cd yaru
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/yaru/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/yaru

#Colorz
cd $PKGDIR
git clone https://aur.archlinux.org/colorz.git
cd colorz
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/colorz/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/colorz

#Gconf
cd $PKGDIR
git clone https://aur.archlinux.org/gconf.git
cd gconf
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/gconf/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/gconf

#libgksu-colormap-fix
cd $PKGDIR
git clone https://aur.archlinux.org/libgksu-colormap-fix.git
cd libgksu-colormap-fix
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/libgksu-colormap-fix/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/libgksu-colormap-fix

#python-colorthief
cd $PKGDIR
git clone https://aur.archlinux.org/python-colorthief.git
cd python-colorthief
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/python-colorthief/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/python-colorthief

#python-haishoku
cd $PKGDIR
git clone https://aur.archlinux.org/python-haishoku.git
cd python-haishoku
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/python-haishoku/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/python-haishoku

#themix-export-spotify-git
cd $PKGDIR
git clone https://aur.archlinux.org/themix-export-spotify-git.git
cd themix-export-spotify-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/themix-export-spotify-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/themix-export-spotify-git

#themix-icons-archdroid-git
cd $PKGDIR
git clone https://aur.archlinux.org/themix-icons-archdroid-git.git
cd themix-icons-archdroid-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/themix-icons-archdroid-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/themix-icons-archdroid-git

#themix-icons-gnome-colors-git
cd $PKGDIR
git clone https://aur.archlinux.org/themix-icons-gnome-colors-git.git
cd themix-icons-gnome-colors-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/themix-icons-gnome-colors-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/themix-icons-gnome-colors-git

#themix-icons-numix-git
cd $PKGDIR
git clone https://aur.archlinux.org/themix-icons-numix-git.git
cd themix-icons-numix-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/themix-icons-numix-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/themix-icons-numix-git

#themix-icons-papirus-git
cd $PKGDIR
git clone https://aur.archlinux.org/themix-icons-papirus-git.git
cd themix-icons-papirus-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/themix-icons-papirus-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/themix-icons-papirus-git

#themix-icons-suru-plus-aspromauros-git
cd $PKGDIR
git clone https://aur.archlinux.org/themix-icons-suru-plus-aspromauros-git.git
cd themix-icons-suru-plus-aspromauros-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/themix-icons-suru-plus-aspromauros-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/themix-icons-suru-plus-aspromauros-git

#themix-icons-suru-plus-git
cd $PKGDIR
git clone https://aur.archlinux.org/themix-icons-suru-plus-git.git
cd themix-icons-suru-plus-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/themix-icons-suru-plus-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/themix-icons-suru-plus-git

#themix-import-images-git
cd $PKGDIR
git clone https://aur.archlinux.org/themix-import-images-git.git
cd themix-import-images-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/themix-import-images-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/themix-import-images-git

#themix-plugin-base16-git
cd $PKGDIR
git clone https://aur.archlinux.org/themix-plugin-base16-git.git
cd themix-plugin-base16-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/themix-plugin-base16-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/themix-plugin-base16-git

#themix-theme-materia-git
cd $PKGDIR
git clone https://aur.archlinux.org/themix-theme-materia-git.git
cd themix-theme-materia-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/themix-theme-materia-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/themix-theme-materia-git

#themix-theme-oomox-git
cd $PKGDIR
git clone https://aur.archlinux.org/themix-theme-oomox-git.git
cd themix-theme-oomox-git
makepkg -sfd
cd $PKGDIR
cd $DIR
mv ./osmium-pkgs/themix-theme-oomox-git/*.pkg.tar.zst ./x86_64/
rm -rf ./osmium-pkgs/themix-theme-oomox-git
