if status is-interactive
    # Commands to run in interactive sessions can go here
end

fish_add_path ~/.cargo/bin
fish_add_path /usr/local/go/bin

# disable fish greeting
set fish_greeting
clear

if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ll="ls -al"
alias c="clear"
alias ch="clear && cd"
alias cr="cargo run"
alias conf="cd ~/.config"
alias confn="cd ~/.config/nvim"
alias cdos="cd ~/projects/open_source"

alias gs="git status"
alias ga="git add ."
alias gne="git commit --amend --no-edit"

alias tmux="tmux new-session -A -s workspace -f ~/.config/tmux/.tmux.conf"

tmux kill-session -a
tmux
clear

clear

function nv
    nvim $argv
end

function sql
    sqlite3 $argv
end
