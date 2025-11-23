#!/usr/bin/env fish

sudo pacman -Syu --noconfirm

set audio_pkgs pipewire-audio
set codecs_pkgs gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav
set toolkits_pkgs gtk3 gtk4 qt5-wayland qt6-wayland xorg-xwayland
set xdg_pkgs xdg-desktop-portal-hyprland xdg-user-dirs
set gnome_pkgs polkit-gnome gnome-keyring gvfs
set fonts_pkgs noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-liberation ttf-jetbrains-mono-nerd
set media_pkgs mpv imv ffmpeg pavucontrol
set tools_pkgs base-devel zip unzip unrar flatpak
set gui_pkgs hyprland hyprpaper waybar materia-gtk-theme
set softwares_pkgs firefox ghostty pcmanfm

sudo pacman -S --needed --noconfirm \
	$audio_pkgs $codecs_pkgs $toolkits_pkgs $xdg_pkgs $gnome_pkgs \
	$fonts_pkgs $media_pkgs $tools_pkgs $gui_pkgs $softwares_pkgs

if not type -q paru
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru; makepkg -si --noconfirm; cd -
end

paru -S --needed --noconfirm hyprshot tofi neofetch

mkdir -p ~/.config ~/Imagens
cp -r ~/desktop/.config/* ~/.config/
cp -r ~/desktop/Wallpapers ~/Imagens/

xdg-user-dirs-update

sudo pacman -Scc --noconfirm
set orphans (pacman -Qdtq)
if test -n "$orphans"
    sudo pacman -Rns $orphans
end

set -U fish_greeting

echo -e "\n\033[1;32mInstalação concluída. Reinicie o sistema.\033[0m"
