#!/usr/bin/env bash

# Ver qué procesos usan el lock
$ fuser /var/lib/dpkg/lock
/var/lib/dpkg/lock: 1234 5678

# Matar esos procesos
$ fuser -k /var/lib/dpkg/lock
/var/lib/dpkg/lock: 1234 5678
