#!/bin/sh

sync_git_repo() {
	REPODIR="$1"
	
	echo "syncing repo ${REPODIR}..."
	cd "${REPODIR}" && git fetch && git push
}

gpg2 --refresh-keys --keyserver hkps://keys.openpgp.org

fdm -vv fetch


sync_git_repo ~/repos/openpgp_backup/
sync_git_repo ~/repos/backup_gpg/

#vdirsyncer discover
#vdirsyncer sync
#vdirsyncer metasync
