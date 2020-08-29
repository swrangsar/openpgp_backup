#!/bin/sh

sync_git_repo() {
	REPODIR="$1"
	
	echo "syncing repo ${REPODIR}..."
	if [ -d "${REPODIR}" ]; then
		cd "${REPODIR}" || (echo "warn: cd ${REPODIR} failed"; return)
		git fetch
		git push
	else
		echo "warn: could not sync repo ${REPODIR}"
	fi
}

gpg --refresh-keys --keyserver hkps://keys.openpgp.org

fdm -vv fetch


sync_git_repo ~/src/openpgp_backup/
sync_git_repo ~/src/backup_gpg/

vdirsyncer discover
vdirsyncer sync
vdirsyncer metasync
