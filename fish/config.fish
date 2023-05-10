# source aliases
set -l alias_file "$HOME/.zsh_aliases"

if test -e "$alias_file"
    source "$alias_file"
end

alias svenv="set VIRTUAL_ENV ./venv"
set -g -x JAVA_HOME (/usr/libexec/java_home)

bind \eB backward-word
bind \eF forward-word
# NOTE: need to use Home and End keys to skip to the start or end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
