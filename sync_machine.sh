#!/bin/sh

sync_git_repo() {
	REPODIR="$1"
	
	echo "syncing repo ${REPODIR}..."
	cd "${REPODIR}" && git pull && git push
}

gpg2 --refresh-keys --keyserver hkps://keys.openpgp.org

fdm -vv fetch



# sync_git_repo $HOME/repos/openpgp_backup/
echo "syncing openpgp_backup..."
cd $HOME/repos/openpgp_backup &&
	git pull &&
	echo "rsync dotfiles..." &&
	rsync -axPuv $HOME/.config/sxhkd/sxhkdrc $HOME/repos/openpgp_backup/.config/sxhkd/ &&
	rsync -axPuv $HOME/.config/youtube-dl/config $HOME/repos/openpgp_backup/.config/youtube-dl/ &&
	git status &&
	git commit -am "dotfiles update" &&
	git push

# sync_git_repo $HOME/repos/backup_gpg/
echo "syncing backup_gpg..."
cd $HOME/repos/backup_gpg &&
	git pull &&
	echo "rsync dotfiles backup_gpg..." &&
	rsync -axPuv $HOME/.config/mutt/muttrc $HOME/repos/backup_gpg/.config/mutt/ &&
	git status &&
	git commit -am "dotfile update" &&
	git push

pass git pull && pass git push

#vdirsyncer discover
#vdirsyncer sync
#vdirsyncer metasync
