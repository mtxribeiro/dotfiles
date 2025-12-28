zoxide init fish | source

if status --is-login; and test (tty) = "/dev/tty1"
    exec Hyprland
end
