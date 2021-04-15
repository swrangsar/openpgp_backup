#!/bin/sh

gpg --refresh-keys --keyserver hkps://keys.openpgp.org

fdm -vv fetch

echo "syncing openpgp_backup..."
cd $HOME/repos/openpgp_backup &&
	git pull &&
	echo "rsync dotfiles..." &&
	rsync -axPuv $HOME/.config/sxhkd/sxhkdrc $HOME/repos/openpgp_backup/.config/sxhkd/ &&
	rsync -axPuv $HOME/.local/bin/sb-* $HOME/repos/openpgp_backup/.local/bin &&
	git commit -am "dotfile update" &&
	git status &&
	git push
