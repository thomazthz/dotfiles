#!/bin/bash

CONFIG_DIR=$HOME/.config

I3_DIR=$CONFIG_DIR/i3
I3_LOCK_DIR=$CONFIG_DIR/i3-lock
ROFI_DIR=$CONFIG_DIR/rofi
WP_FILENAME=wp.jpg
WP_DIR=$HOME/Pictures/wp

# --------------------
# ----- i3 setup -----
# --------------------
if ! [ -d $I3_DIR ]; then
    echo "[+] Creating i3 directory"
    mkdir -p $I3_DIR
fi

echo "[+] Copying i3 config file"
cp i3/config $I3_DIR


# -------------------------
# ----- i3-lock setup -----
# -------------------------
if ! [ -d $I3_LOCK_DIR ]; then
    echo "[+] Creating i3 lock directory"
    mkdir -p $I3_LOCK_DIR
fi

echo "[+] Copying i3-lock config file and lock image"
cp i3-lock/lock.sh i3-lock/lock.png $I3_LOCK_DIR


# ----------------------
# ----- rofi setup -----
# ----------------------
if ! [ -d $ROFI_DIR ]; then
    echo "[+] Creating rofi directory"
    mkdir -p $ROFI_DIR
fi

echo "[+] Copying rofi config file and rofistart script"
cp rofi/config rofi/rofistart.sh $ROFI_DIR


# ---------------------------
# ----- wallpaper setup -----
# ---------------------------
echo "[+] Downloading wallpaper"
wget https://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-490733.jpg -O $WP_FILENAME --show-progress

if ! [ -d $WP_DIR ]; then
    echo "[+] Creating wallpapers directory"
    mkdir -p $WP_DIR
fi

echo "[+] Copying wallpaper image"
mv $WP_FILENAME $WP_DIR


# ------------------------
# ----- bash aliases -----
# ------------------------
if ! [ -f $HOME/.bash_aliases ]; then
    echo "[+] Copying .bash_aliases"
    cp .bash_aliases $HOME
elif ! grep -Fq "extract ()" $HOME/.bash_aliases; then
    echo "[+] Appending extract function to bash_aliases"
    aliases=$(cat .bash_aliases)
    echo -e "\n$aliases" >> $HOME/.bash_aliases
fi