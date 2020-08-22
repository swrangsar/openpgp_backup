#!/bin/sh

function sync_git_repo {
	local REPODIR="$1"
	
	echo "syncing repo ${REPODIR}..."
	if [ -d $REPODIR ]; then
		cd $REPODIR
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
