#!/bin/bash


gpg --refresh-keys --keyserver keys.openpgp.org

fdm -vv fetch


cd /home/swrangsar/src/openpgp_backup/
pwd
git pull

cd /home/swrangsar/src/backup_gpg/
pwd
git pull
