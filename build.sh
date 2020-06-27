#!/usr/bin/env bash
if [ $# -ne 1 ]; then
  echo "mkalterisoを指定してください。" 1>&2
  exit 1
fi
mkalteriso=$1
source ./packages.sh
$mkalteriso -a x86_64 -w work/x86_64 -C pacman-x86_64.conf -D install_dir init
cp pacman.conf.nosig work/x86_64/airootfs/etc/pacman.d/pacman.conf
cp mirrorlist work/x86_64/airootfs/etc/pacman.d/
cp mirrorlist-alter work/x86_64/airootfs/etc/pacman.d/
cp sudoers work/x86_64/airootfs/etc/
cp adduser-deb-3.113+nmu3-1-any.pkg.tar.xz work/x86_64/airootfs/
sed -i -e "s/#ja_JP.UTF-8/ja_JP.UTF-8/" work/x86_64/airootfs/etc/locale.gen
echo "LANG=ja_JP.UTF-8" | tee work/x86_64/airootfs/etc/locale.conf
rm -rf work/x86_64/airootfs/etc/mtab
echo "rootfs / rootfs rw 0 0" | tee work/x86_64/airootfs/etc/mtab
rm -rf `find  work/x86_64/airootfs/root/ -type f`
rm -rf `find work/x86_64/airootfs/var/cache/pacman/pkg/ -type f`
echo "compressing..."
(cd work/x86_64/airootfs/;tar -zcpf ../../../install.tar.gz *)
chown `id -un` install.tar.gz
$mkalteriso 
