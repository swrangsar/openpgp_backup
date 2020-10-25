#!/bin/sh

syspatch; fw_update; sysmerge;
sysupgrade && syspatch
pkg_add -v rsync syncthing links+
pkg_add -v pstree neofetch newsboat neomutt git gnupg
pkg_add -v dwm dmenu st sic sxiv feh mpv curl password-store
pkg_add -v surf
