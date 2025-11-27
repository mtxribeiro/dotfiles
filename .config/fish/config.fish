if test -z "$DISPLAY"; and test (tty) = "/dev/tty1"
    exec Hyprland
end

if status is-interactive
  zoxide init fish | source
  neofetch
end
