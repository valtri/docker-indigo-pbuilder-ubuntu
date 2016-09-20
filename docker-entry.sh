#! /bin/sh

if ! test -f /var/cache/pbuilder/ubuntu-14-x86_64.tgz; then
    su jenkins -c ~jenkins/scripts/refresh-chroot --initial || :
fi

exec "$@"
