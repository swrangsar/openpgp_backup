#!/bin/zsh

gpg --refresh-keys --keyserver hkps://keys.openpgp.org

fdm -vv fetch
pkill -RTMIN+12 dwmblocks

echo "syncing openpgp_backup..."
cd $HOME/repos/openpgp_backup &&
	git pull &&
	git status &&
	git push

# rsync -axPuv $HOME/.config/zsh/  $HOME/repos/openpgp_backup/.config/zsh/

pkill -RTMIN+5 dwmblocks
