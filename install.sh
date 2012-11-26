#!/bin/sh

# Honden Installation Script
# Written in 2012 by 伴上段
#
# To the extent possible under law, the author(s) have dedicated all copyright
# and related and neighboring rights to this software to the public domain
# worldwide. This software is distributed without any warranty.
#
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software. If not, see
# <http://creativecommons.org/publicdomain/zero/1.0/>.

if [ $# -eq 0 ]; then
  echo "no installation directory specified" >&2
  exit 1
fi
if [ ! -d "$1" ]; then
  echo "$1 is not a directory." >&2
  exit 1
fi

set -x
install backupcards defaultfilter edeck genline honden nextid review seedeck $1

