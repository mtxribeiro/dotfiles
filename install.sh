#!/bin/bash

sudo pacman -Syu --noconfirm

sudo pacman -S --needed --noconfirm \
    pipewire-audio \
    gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav \
    mpv imv pavucontrol \
    gtk3 gtk4 qt5-wayland qt6-wayland xorg-xwayland \
    xdg-desktop-portal-hyprland xdg-user-dirs \
    polkit-gnome gnome-keyring gvfs \
    noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-liberation ttf-jetbrains-mono-nerd \
    base-devel flatpak zip unzip unrar vim \
    hyprland hyprpaper hyprlock waybar rofi nwg-bar \
    materia-gtk-theme papirus-icon-theme \
    firefox alacritty pcmanfm


if ! command -v paru >/dev/null 2>&1; then
    git clone https://aur.archlinux.org/paru-bin.git /tmp/paru-bin
    cd /tmp/paru-bin
    makepkg -si --noconfirm
    cd -
fi

paru -S --needed --noconfirm hyprshot

mkdir -p ~/.config ~/Imagens
cp -r ~/dotfiles/.config/* ~/.config/
cp -r ~/dotfiles/Wallpapers ~/Imagens/
xdg-user-dirs-update

sudo pacman -Scc --noconfirm

orphans=$(pacman -Qdtq || true)
if [[ -n "$orphans" ]]; then
    sudo pacman -Rns --noconfirm $orphans
fi

echo -e "\n\033[1;32mInstalação concluída. Reinicie o sistema.\033[0m"
