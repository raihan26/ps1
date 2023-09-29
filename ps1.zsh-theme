setopt nopromptbang prompt{cr,percent,sp,subst}

zstyle ':zim:git-info:branch' format '%b'
zstyle ':zim:git-info:keys' format 'prompt' ' (%b)'

autoload -Uz add-zsh-hook && add-zsh-hook precmd git-info

branch_color="%F{222,92,64}"
PS1='%n@%m %1~$branch_color${(e)git_info[prompt]}%F{reset} %# '
