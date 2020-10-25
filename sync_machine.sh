#!/bin/sh

sync_git_repo() {
	REPODIR="$1"
	
	echo "syncing repo ${REPODIR}..."
	cd "${REPODIR}" && git pull && git push
}

gpg2 --refresh-keys --keyserver hkps://keys.openpgp.org

fdm -vv fetch


sync_git_repo $HOME/repos/openpgp_backup/
sync_git_repo $HOME/repos/backup_gpg/

pass git pull && pass git push

#vdirsyncer discover
#vdirsyncer sync
#vdirsyncer metasync
