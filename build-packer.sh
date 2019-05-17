#!/bin/sh

die() {
  echo "FATAL: $*"
  exit 1
}

if [ "$(whoami)" != root ]; then
  exec su root -c "sh $0"
fi

portsnap --interactive fetch
portsnap extract
cd /usr/ports/lang/go || die "Can't find go ports dir."
make install clean
echo "=-=-=-=-=-=-=-=-=-=-=-="
go version
go env
echo "=-=-=-=-=-=-=-=-=-=-=-="
sleep 15
cd /usr/ports/sysutils/packer || die "Can't find packer ports dir."
make install clean

