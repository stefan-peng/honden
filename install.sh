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
  echo "ERROR: No installation directory specified.  Please specify it as the first command-line argument for this script." >&2
  exit 1
fi
if [ ! -d "$1" ]; then
  echo "ERROR: $1 is not a directory." >&2
  exit 1
fi

echo "Creating directory hierarchy"
mkdir -p -m 0755 $1/backups
mkdir -p -m 0755 $1/decks
mkdir -p -m 0755 $1/media/recordings/flashcards/ロー
mkdir -p -m 0755 $1/media/sds
mkdir -p -m 0755 $1/other

echo "Installing scripts"
set -x
install backupall backupcards carddate downloadsds edeck filterkanji filtersentences genkanjicards genline getsds logdate newdeck nextid reviewclozes reviewkanji reviewsentences reviewsome rubify seedeck seesome $1

