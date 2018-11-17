# Wingpanel bup backup indicator.

Displays an [ElementaryOS Wingpanel](https://github.com/elementary/wingpanel) indicator for the [Bup backup system](https://bup.github.io/): a very efficient backup system based on the git packfile format, providing fast incremental saves and global deduplication (among and within files, including virtual machine images).

## Install, build and run

```bash
# install elementary-sdk, meson and libwingpanel
sudo apt install elementary-sdk meson libwingpanel-2.0-dev libxml2-dev
# clone repository
git clone {{repourl}} wingpanel-indicator-bup
# cd to dir
cd wingpanel-indicator-bup
# run meson
meson build --prefix=/usr
# cd to build, build and test
cd build
sudo ninja install
# restart switchboard to load your indicator
pkill wingpanel -9
```

## Generating pot file

```bash
# after setting up meson build
cd build

# generates pot file
sudo ninja wingpanel-indicator-bup-pot

# to regenerate and propagate changes to every po file
sudo ninja wingpanel-indicator-bup-update-po
```
