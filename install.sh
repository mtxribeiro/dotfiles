#!/bin/bash

sudo pacman -Syu --noconfirm

sudo pacman -S --needed --noconfirm \
    pipewire-audio gstreamer gst-plugins-{base,good,bad,ugly} gst-libav \
    mpv imv pavucontrol \
    gtk{3,4} qt{5,6}-wayland xorg-xwayland \
    xdg-desktop-portal-hyprland xdg-user-dirs \
    polkit-gnome gnome-keyring gvfs \
    noto-fonts{,-emoji,-cjk} ttf-liberation ttf-jetbrains-mono-nerd \
    base-devel flatpak zip unzip unrar vim \
    hyprland hyprpaper hyprlock waybar rofi \
    materia-gtk-theme papirus-icon-theme \
    firefox alacritty pcmanfm

printf ":: Existem 2 opções disponíveis para AUR helper:\n"
printf "   1) paru   2) yay\n\n"
read -rp "Digite um número (default=1): " o
o=${o:-1}

AUR_HELPER=$( [[ $o == 1 ]] && echo paru || echo yay )

if ! command -v "$AUR_HELPER" &>/dev/null; then
    echo ":: Instalando $AUR_HELPER..."
    git clone "https://aur.archlinux.org/${AUR_HELPER}-bin.git" /tmp/aurh
    cd /tmp/aurh && makepkg -si --noconfirm && cd -
fi

$AUR_HELPER -S --needed --noconfirm hyprshot

mkdir -p ~/.config ~/Imagens
cp -r ~/dotfiles/.config/* ~/.config/
cp -r ~/dotfiles/Wallpapers ~/Imagens/
cp ~/dotfiles/.{bashrc,bash_profile} ~/

xdg-user-dirs-update

sudo pacman -Scc --noconfirm
orphans=$(pacman -Qdtq || true); [[ $orphans ]] && sudo pacman -Rns --noconfirm $orphans

echo -e "\n\033[1;32m:: Instalação concluída. Reinicie o sistema.\033[0m"
