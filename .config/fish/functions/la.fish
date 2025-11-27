function la --wraps=ls --wraps='eza --color=always --all --git --no-filesize --icons=always --no-time --no-user --no-permissions' --description 'alias la=eza --color=always --all --git --no-filesize --icons=always --no-time --no-user --no-permissions'
    eza --color=always --all --git --no-filesize --icons=always --no-time --no-user --no-permissions $argv
end
