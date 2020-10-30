#!/bin/sh


gpg2 --refresh-keys --keyserver hkps://keys.openpgp.org

fdm -vv fetch


echo "syncing openpgp_backup..."
cd $HOME/repos/openpgp_backup &&
	git pull &&
	echo "rsync dotfiles..." &&
	rsync -axPuv $HOME/.config/sxhkd/sxhkdrc $HOME/repos/openpgp_backup/.config/sxhkd/ &&
	rsync -axPuv $HOME/.config/youtube-dl/config $HOME/repos/openpgp_backup/.config/youtube-dl/ &&
	rsync -axPuv $HOME/.local/bin/{battery,mailbox} $HOME/repos/openpgp_backup/.local/bin &&
	git commit -am "dotfiles update" &&
	git status &&
	git push

echo "syncing backup_gpg..."
cd $HOME/repos/backup_gpg &&
	git pull &&
	echo "rsync dotfiles backup_gpg..." &&
	rsync -axPuv $HOME/.config/mutt/muttrc $HOME/repos/backup_gpg/.config/mutt/ &&
	rsync -axPuv $HOME/.fdm.conf $HOME/repos/backup_gpg/ &&
	git commit -am "dotfile update" &&
	git status &&
	git push

pass git pull && pass git push

if [ $(date +%s) -gt $(expr `stat -f %m $HOME/.cache/hosts` + 86400) ]; then
	curl -o $HOME/.cache/hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
	su root -c "rsync $HOME/.cache/hosts /etc/hosts"
fi

#vdirsyncer discover
#vdirsyncer sync
#vdirsyncer metasync
