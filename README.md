# TL;DR

This branch make use of the local_manifests mechanism to add in FydeOS bits.

https://gerrit.googlesource.com/git-repo/+/master/docs/manifest-format.md#Local-Manifests

Follow below steps.

```
# Initial the Chromium OS soure repo as usual. Assume $TOPDIR is the dir to keep the Chromium OS source
mkdir -p $TOPDIR/fydeos
cd $TOPDIR
repo init -u https://chromium.googlesource.com/chromiumos/manifest -b release-R89-13729.B

# Then checkout this repo
git clone -b fydeos_m89_v12-kai-test git@gitlab.fydeos.xyz:fydeos_buildtools/manifest.git fydeos/manifest

# Add it as the local manifest
ln -snfr fydeos/manifest .repo/local_manifests

# Sync as usual
repo sync -j4

# You will see a fydeos dir with manifest, overlays and chromium dir in it, and links to the overlays in src/overlays
ls -l fydeos/
ls -l src/overlays

# The chromium source need to be synced or there will be depot_tools related errors
cd fydeos/chromium
gclient sync -j8

# This file needs a minor tweak to use local checkout of chromium source
echo -e "\nCHROME_ROOT=/mnt/host/source/fydeos/chromium" >> fydeos/overlays/project-fydeos/make.conf

# Then build as usual, any board in fydeos/overlays should build OK
cros_sdk --nouse-image
(chroot) setup_board --board=amd64-fydeos --default
(chroot) ./build_packages
```
