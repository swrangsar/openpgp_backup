#!/bin/sh

syspatch; fw_update; sysmerge;
sysupgrade && syspatch
pkg_add -v rsync neovim syncthing links+
pkg_add -v pstree neofetch newsboat neomutt git gnupg
pkg_add -v dwm dmenu st sic sxiv feh mpv curl password-store
pkg_add -v maim surf noice fdm sxhkd zathura
pkg_add -v zathura-ps zathura-pdf-mupdf zathura-djvu youtube-dl
pkg_add -v ImageMagick wordnet pass-otp zbar
pkg_add -v transmission sc scim
