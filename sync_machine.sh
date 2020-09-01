#!/bin/sh

sync_git_repo() {
	REPODIR="$1"
	
	echo "syncing repo ${REPODIR}..."
	cd "${REPODIR}" && git fetch && git push
}

gpg --refresh-keys --keyserver hkps://keys.openpgp.org

fdm -vv fetch


sync_git_repo ~/src/openpgp_backup/
sync_git_repo ~/src/backup_gpg/

vdirsyncer discover
vdirsyncer sync
vdirsyncer metasync
