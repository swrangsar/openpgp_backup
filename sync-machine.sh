#!/bin/sh

gpg --refresh-keys --keyserver hkps://keys.openpgp.org

fdm -vv fetch
pkill -RTMIN+12 dwmblocks

echo "syncing openpgp_backup..."
cd $HOME/repos/openpgp_backup &&
	git pull &&
	echo "rsync dotfiles..." &&
	rsync -axPuv $HOME/.config/sxhkd/sxhkdrc $HOME/repos/openpgp_backup/.config/sxhkd/ &&
	rsync -axPuv $HOME/.local/bin/sb-forecast $HOME/repos/openpgp_backup/.local/bin/ &&
	rsync -axPuv $HOME/.local/bin/sb-mailbox $HOME/repos/openpgp_backup/.local/bin/ &&
	rsync -axPuv $HOME/.local/bin/transadd $HOME/repos/openpgp_backup/.local/bin/ &&
	git commit -am "dotfile update" &&
	git status &&
	git push

## [ -d $HOME/.password-store ] && [ -d /media/password-store ] &&
	rsync -axPuv $HOME/.password-store/  /home/media/password-store

pkill -RTMIN+5 dwmblocks
