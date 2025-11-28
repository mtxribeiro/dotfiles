#!/usr/bin/env fish

sudo pacman -Syu --noconfirm

set pkgs \
    pipewire-audio \
    gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav \
    gtk3 gtk4 qt5-wayland qt6-wayland xorg-xwayland \
    xdg-desktop-portal-hyprland xdg-user-dirs \
    polkit-gnome gnome-keyring gvfs \
    noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-liberation ttf-jetbrains-mono-nerd \
    mpv imv pavucontrol \
    base-devel flatpak zip unzip unrar zoxide fzf neovim \
    hyprland hyprpaper hyprlock waybar rofi nwg-bar \
    materia-gtk-theme papirus-icon-theme \
    firefox kitty pcmanfm

if not type -q paru
    git clone https://aur.archlinux.org/paru-bin.git /tmp/paru-bin
    cd /tmp/paru-bin; makepkg -si --noconfirm
    cd -
end

sudo pacman -S --needed --noconfirm $pkgs
paru -S --needed --noconfirm hyprshot

mkdir -p ~/.config ~/Imagens
cp -r ~/dotfiles/.config/* ~/.config/
cp -r ~/dotfiles/Wallpapers ~/Imagens/
xdg-user-dirs-update

set -U fish_greeting

sudo pacman -Scc --noconfirm
set orphans (pacman -Qdtq)
test -n "$orphans"; and sudo pacman -Rns $orphans

echo -e "\n\033[1;32mInstalação concluída. Reinicie o sistema.\033[0m"
