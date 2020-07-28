#!/bin/bash


gpg --refresh-keys --keyserver hkps://keys.openpgp.org

fdm -vv fetch


cd /home/swrangsar/src/openpgp_backup/
pwd
git pull
git push
git pull

cd /home/swrangsar/src/backup_gpg/
pwd
git pull
git push
git pull
