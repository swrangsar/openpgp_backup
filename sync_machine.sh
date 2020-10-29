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
cd $HOME/repos/openpgp_backup \
	&& git pull \
	&& rsync -axPuv $HOME/.config/sxhkd/sxhkdrc $HOME/repos/openpgp_backup/.config/sxhkd/ \
	&& rsync -axPuv $HOME/.config/youtube-dl/config $HOME/repos/openpgp_backup/.config/youtube-dl/ \
	&& git commit -am "dotfiles update" \
	&& git push
sync_git_repo $HOME/repos/backup_gpg/

pass git pull && pass git push

#vdirsyncer discover
#vdirsyncer sync
#vdirsyncer metasync
