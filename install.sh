#!/usr/bin/env fish

sudo pacman -Syu --noconfirm

set audio_pkgs pipewire-audio
set codecs_pkgs gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav
set toolkits_pkgs gtk3 gtk4 qt5-wayland qt6-wayland xorg-xwayland
set xdg_pkgs xdg-desktop-portal-hyprland xdg-user-dirs
set gnome_pkgs polkit-gnome gnome-keyring gvfs
set fonts_pkgs noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-liberation ttf-font-awesome ttf-jetbrains-mono-nerd
set media_pkgs mpv imv pavucontrol
set tools_pkgs base-devel flatpak curl zip unzip unrar zoxide fzf eza neovim
set gui_pkgs hyprland hyprpaper hyprlock waybar rofi nwg-bar
set themes_pkgs materia-gtk-theme papirus-icon-theme
set softwares_pkgs firefox kitty pcmanfm

sudo pacman -S --needed --noconfirm \
	$audio_pkgs $codecs_pkgs $toolkits_pkgs $xdg_pkgs $gnome_pkgs \
	$fonts_pkgs $media_pkgs $tools_pkgs $gui_pkgs $themes_pkgs $softwares_pkgs

if not type -q paru
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru; makepkg -si --noconfirm; cd -
end

paru -S --needed --noconfirm hyprshot neofetch

curl -sS https://starship.rs/install.sh | sh -s -- -y

mkdir -p ~/.config ~/Imagens
cp -r ~/dotfiles/.config/* ~/.config/
cp -r ~/dotfiles/Wallpapers ~/Imagens/
xdg-user-dirs-update

sudo pacman -Scc --noconfirm
set orphans (pacman -Qdtq)
if test -n "$orphans"
    sudo pacman -Rns $orphans
end

set -U fish_greeting

echo -e "\n\033[1;32mInstalação concluída. Reinicie o sistema.\033[0m"
