#!/bin/sh

# formula file format
# stock, RoA, P/E
#
# algo: magic formula investing
# 
# author: swrangsar basumatary
# license: GPLv3

[ -n "$1" ] ||
	( echo "Usage: " $0 " <filename>"; exit 1 )

filename="$1"
head -1 $filename

awk -F, '(NR > 1) && $2 > 25.0' $filename | sort -t , -nk 3
