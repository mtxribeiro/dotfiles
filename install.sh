#!/bin/bash

sudo pacman -Syu --noconfirm

sudo pacman -S --needed --noconfirm \
    pipewire-audio \
    gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav \
    gtk3 gtk4 qt5-wayland qt6-wayland xorg-xwayland \
    xdg-desktop-portal-hyprland xdg-user-dirs \
    polkit-gnome gnome-keyring gvfs \
    noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-liberation ttf-jetbrains-mono-nerd \
    base-devel flatpak zip unzip unrar vim \
    hyprland hyprpaper hyprlock hyprshot waybar rofi nwg-bar \
    materia-gtk-theme papirus-icon-theme \
    firefox alacritty pcmanfm pavucontrol mpv imv

o=""
while [[ "$o" != 1 && "$o" != 2 && "$o" != 3 ]]; do
    printf ":: Existem 3 opções disponíveis para AUR helper:\n"
    printf "   1) paru  2) yay  3) nenhum\n\n"
    read -rp "Digite um número (default=1): " o
    o=${o:-1}
done

AUR_HELPER=$([[ $o == 1 ]] && echo paru || ([[ $o == 2 ]] && echo yay))

if ! command -v "$AUR_HELPER" &>/dev/null && [[ -n "$AUR_HELPER" ]]; then
    echo ":: Instalando $AUR_HELPER..."
    git clone "https://aur.archlinux.org/${AUR_HELPER}.git" /tmp/aurh
    cd /tmp/aurh && makepkg -si --noconfirm && cd -
fi

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
