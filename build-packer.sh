#!/bin/sh

die() {
  echo "FATAL: $*"
  exit 1
}

if [ "$(whoami)" != root ]; then
  exec su root -c "$0"
fi

portsnap --interactive fetch
portsnap extract
cd /usr/ports/sysutils/packer || die "Can't find packer ports dir."
make install clean

