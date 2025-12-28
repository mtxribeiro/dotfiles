#!/bin/bash

sudo pacman -Syu --noconfirm

sudo pacman -S --needed --noconfirm \
    fish \
    pipewire-audio \
    gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav \
    gtk3 gtk4 qt5-wayland qt6-wayland xorg-xwayland \
    xdg-desktop-portal-hyprland xdg-user-dirs \
    polkit-gnome gnome-keyring gvfs \
    noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-liberation ttf-jetbrains-mono-nerd \
    base-devel flatpak zip unzip unrar vim zoxide fzf \
    hyprland hyprpaper hyprlock hyprshot waybar rofi nwg-bar \
    materia-gtk-theme papirus-icon-theme \
    firefox alacritty pcmanfm pavucontrol mpv imv \
    ufw

if ! command -v yay &>/dev/null && ! command -v paru &>/dev/null; then
    o=""
    while [[ "$o" != 1 && "$o" != 2 && "$o" != 3 ]]; do
        printf ":: Existem 3 opções disponíveis para AUR helper:\n"
        printf "   1) paru  2) yay  3) nenhum\n\n"
        read -rp "Digite um número (padrão=1): " o
        o=${o:-1}
    done

    AUR_HELPER=$([[ $o == 1 ]] && echo paru || ([[ $o == 2 ]] && echo yay))

    if [[ -n "$AUR_HELPER" ]]; then
        git clone "https://aur.archlinux.org/${AUR_HELPER}.git" /tmp/aurh
        cd /tmp/aurh && makepkg -si --noconfirm && cd -
    fi
fi

if [[ "$SHELL" != "/bin/fish" ]]; then
    chsh -s /bin/fish
    fish -c "set -U fish_greeting ''"
fi

if ! systemctl is-enabled --quiet ufw && ! systemctl is-active --quiet ufw; then
    sudo systemctl enable ufw
    sudo systemctl start ufw
    sudo ufw enable
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
