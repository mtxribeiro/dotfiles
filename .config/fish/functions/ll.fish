function ll --wraps=ls --wraps='eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions' --description 'alias ll=eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions'
    eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions $argv
end
