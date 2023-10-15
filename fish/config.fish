# source aliases
if test -e "$alias_file"
    source "$alias_file"
end

set -g -x PATH "$PATH":/usr/local/go/bin
set -g -x ANDROID_HOME "$HOME"/Android/Sdk/
set -g -x PATH "$PATH":$ANDROID_HOME/emulator
set -g -x PATH "$PATH":$ANDROID_HOME/platform-tools

bind \eB backward-word
bind \eF forward-word
# NOTE: need to use Home and End keys to skip to the start or end

# shell setup: https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths


if status is-interactive
  # enable pyenv virtualenv tool
  pyenv init - | source
  pyenv virtualenv-init - | source
end
