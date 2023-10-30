setopt nopromptbang prompt{cr,percent,sp,subst}

zstyle ':zim:git-info:branch' format '%b'
zstyle ':zim:git-info:keys' format 'prompt' ' (%b)'

autoload -Uz add-zsh-hook && add-zsh-hook precmd git-info

branch_color="%F{red}"
PS1='%B%F{159}%n@%m%f%b %B%F{yellow}%1~%f%b$branch_color${(e)git_info[prompt]}%F{reset} %B%F{cyan}%#%f%b '
