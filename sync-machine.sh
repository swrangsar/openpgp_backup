#!/bin/sh

gpg --refresh-keys --keyserver hkps://keys.openpgp.org

fdm -vv fetch
