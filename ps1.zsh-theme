setopt nopromptbang prompt{cr,percent,sp,subst}

typeset -g VIRTUAL_ENV_DISABLE_PROMPT=1
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

typeset -gA git_info
if (( ${+functions[git-info]} )); then
  # Set git-info parameters.
  zstyle ':zim:git-info' verbose yes
  zstyle ':zim:git-info:action' format '%F{default}:%F{1}%s'
  zstyle ':zim:git-info:ahead' format ' %F{5}⬆'
  zstyle ':zim:git-info:behind' format ' %F{5}⬇'
  zstyle ':zim:git-info:commit' format ' %F{3}%c'
  zstyle ':zim:git-info:indexed' format ' %F{2}✚'
  zstyle ':zim:git-info:unindexed' format ' %F{4}✱'
  zstyle ':zim:git-info:position' format ' %F{5}%p'
  zstyle ':zim:git-info:stashed' format ' %F{6}✭'
  zstyle ':zim:git-info:untracked' format ' %F{default}◼'
  zstyle ':zim:git-info:branch' format '%b'
  zstyle ':zim:git-info:keys' format \
    'prompt' ' (%b)' \
    'status' '$(coalesce "%p" "%c")%s%A%B%S%i%I%u'

  # Add hook for calling git-info before each command.
  autoload -Uz add-zsh-hook && add-zsh-hook precmd git-info
fi

branch_color="%F{222,92,64}"
PS1='%n@%m %1~$branch_color${(e)git_info[prompt]}%F{reset} %# '
RPS1='${VIRTUAL_ENV:+"%F{3}(${VIRTUAL_ENV:t})"}%(?:: %F{1}✘ %?)%B${VIM:+" %F{6}V"}${(e)git_info[status]}%f%b'
SPROMPT='zsh: correct %F{1}%R%f to %F{2}%r%f [nyae]? '
