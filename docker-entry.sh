#! /bin/sh

if ! test -f /var/cache/pbuilder/ubuntu-14-x86_64.tgz; then
    ~jenkins/scripts/refresh-chroot
fi

exec "$@"
