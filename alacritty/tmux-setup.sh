#!/bin/bash

devdir='$HOME/development/'

tmux rename-window bastion
tmux split-window
tmux new-window -n 'editor' -c "$devdir"
tmux new-window -n 'terminal' -c "$devdir"
tmux new-window -n 'ssh-sessions'
tmux new-window -n 'misc' -c "$devdir"
