#!/bin/sh

gpg --refresh-keys --keyserver hkps://keys.openpgp.org

fdm -vv fetch
pkill -RTMIN+12 dwmblocks

echo "syncing openpgp_backup..."
cd $HOME/repos/openpgp_backup &&
	git pull &&
	git status &&
	git push


pkill -RTMIN+5 dwmblocks
