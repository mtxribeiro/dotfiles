if status is-interactive
    if test -z "$DISPLAY"; and test (tty) = "/dev/tty1"
        exec Hyprland
    end
end
