# source aliases
# set -l alias_file "$HOME/.zsh_aliases"

if test -e "$alias_file"
    source "$alias_file"
end

# alias svenv "set VIRTUAL_ENV ./venv"
# set -g -x JAVA_HOME (/usr/libexec/java_home)

bind \eB backward-word
bind \eF forward-word
# NOTE: need to use Home and End keys to skip to the start or end

# shell setup: https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths


if status is-interactive
  # enable virtualenv
  pyenv init - | source
  pyenv virtualenv-init - | source
end

