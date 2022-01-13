#!/bin/bash


pushd $LFS
tar -cJpf $HOME/lfs-temp-backup.tar.xz .
popd
