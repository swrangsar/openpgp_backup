#!/bin/bash

function sync-git-repo {
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


sync-git-repo ~/src/openpgp_backup/
sync-git-repo ~/src/backup_gpg/
