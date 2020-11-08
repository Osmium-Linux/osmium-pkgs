#!/usr/bin/env bash

## This script will generate aeolus pkg-files.

## Dirs
DIR="$(pwd)"
PKGDIR="$DIR/aeolus-pkgs"

## Packages
PKGS=($(ls $PKGDIR))

cd $PKGDIR
cd aeolus-about-dev
makepkg -s 
cd $DIR
cp ./aeolus-pkgs/aeolus-about-dev/*.pkg.tar.zst ./x86_64
cd $PKGDIR
cd aeolus-fonts
makepkg -s 
cd $DIR
cp ./aeolus-pkgs/aeolus-fonts/*.pkg.tar.zst ./x86_64
cd $PKGDIR
cd aeolus-get-started
makepkg -s 
cd $DIR
cp ./aeolus-pkgs/aeolus-get-started/*.pkg.tar.zst ./x86_64
cd $PKGDIR
cd aeolus-grid-icon-theme
makepkg -s 
cd $DIR
cp ./aeolus-pkgs/aeolus-grid-icon-theme/*.pkg.tar.zst ./x86_64
cd $PKGDIR
cd aeolus-gtk-themepack
makepkg -s 
cd $DIR
cp ./aeolus-pkgs/aeolus-gtk-themepack/*.pkg.tar.zst ./x86_64
cd $PKGDIR
cd aeolus-hybrid-icon-theme
makepkg -s 
cd $DIR
cp ./aeolus-pkgs/aeolus-hybrid-icon-theme/*.pkg.tar.zst ./x86_64
cd $PKGDIR
cd aeolus-lxdm-theme
makepkg -s 
cd $DIR
cp ./aeolus-pkgs/aeolus-lxdm-theme/*.pkg.tar.zst ./x86_64
cd $PKGDIR
cd aeolus-lxdm-theme-circuit
makepkg -s 
cd $DIR
cp ./aeolus-pkgs/aeolus-lxdm-theme-circuit/*.pkg.tar.zst ./x86_64
cd $PKGDIR
cd aeolus-lxdm-theme-gears
makepkg -s 
cd $DIR
cp ./aeolus-pkgs/aeolus-lxdm-theme-gears/*.pkg.tar.zst ./x86_64
cd $PKGDIR
cd aeolus-pixmaps
makepkg -s 
cd $DIR
cp ./aeolus-pkgs/aeolus-pixmaps/*.pkg.tar.zst ./x86_64
cd $PKGDIR
cd aeolus-tint2-configs
makepkg -s 
cd $DIR
cp ./aeolus-pkgs/aeolus-tint2-configs/*.pkg.tar.zst ./x86_64
cd $PKGDIR
cd aeolus-wallpapers
makepkg -s 
cd $DIR
cp ./aeolus-pkgs/aeolus-wallpapers/*.pkg.tar.zst ./x86_64
