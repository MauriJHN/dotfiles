# ALIASES
alias bat 'batcat -f --pager "less -RF"'

set -g -x DENO_INSTALL "/home/mau/.deno"
set -g -x PATH "$PATH":"$DENO_INSTALL"/bin
set -g -x JAVA_HOME "/usr/lib/jvm/java-17-openjdk-amd64"
set -g -x PATH "$PATH":"$JAVA_HOME"/bin
set -g -x PATH "$PATH":/usr/local/go/bin
set -g -x XDG_CONFIG_HOME "$HOME/.config"
set -g -x ANDROID_HOME "$HOME"/Android/Sdk/
set -g -x PATH "$PATH":$ANDROID_HOME/emulator
set -g -x PATH "$PATH":$ANDROID_HOME/platform-tools

bind \eB backward-word
bind \eF forward-word
# NOTE: need to use Home and End keys to skip to the start or end

# shell setup: https://github.com/pyenv/pyenv#set-up-your-shell-environment-for-pyenv
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

set -gx NVM_DIR (if test -z "$XDG_CONFIG_HOME"; echo "$XDG_CONFIG_HOME/nvm"; else; echo "$HOME/.nvm"; end)
if test -e "$NVM_DIR/nvm.sh"
    bash "$NVM_DIR/nvm.sh"
end

if status is-interactive
  # enable pyenv virtualenv tool
  pyenv init - | source
  pyenv virtualenv-init - | source
end
