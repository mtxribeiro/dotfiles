if test -z "$DISPLAY"; and test (tty) = "/dev/tty1"
    exec Hyprland
end

if status is-interactive
  starship init fish | source
  zoxide init fish | source
  neofetch
end
