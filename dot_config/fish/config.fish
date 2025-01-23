set fish_greeting
set -Ua fish_user_paths $HOME/.local/bin

export MICRO_TRUECOLOR=1
printf '\033[?1h\033=' >/dev/tty

export ESCDELAY=0

alias vi='nvim'

set -gx EDITOR 'nvim'

set -x STARSHIP_CONFIG ~/.config/starship/starship.toml
starship init fish | source
zoxide init fish | source
atuin init fish | source

# Using eza instead of ls
alias ls='eza --color=always --group-directories-first --icons'
alias l='eza -bGF --header --git --color=always --group-directories-first --icons'
alias ll='eza -la --icons --octal-permissions --group-directories-first'
alias llm='eza -lbGd --header --git --sort=modified --color=always --group-directories-first --icons'
alias la='eza --long --all --group --group-directories-first'
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons'

# Specialty views
alias lS='eza -1 --color=always --group-directories-first --icons'
alias lt='eza --tree --level=2 --color=always --group-directories-first --icons'
alias l.="eza -a | grep -E \"^\.\""

# Complete replacement of cd with zoxide
alias cd='z'
# remember zi command also

# Atuin settings, brought over from https://gist.github.com/nikvdp/f72ff1776815861c5da78ceab2847be2
# Use atuin to power ctrl-r history search but with fzf. Also disable atuin's up arrow bindings and use ctrl-e to bring up atuin's own tui
## Atuin improved history search
type -q atuin || exit

set -gx ATUIN_NOBIND true
atuin init fish | source

# Ctrl-R: FZF history search
bind \cr 'set cmd (atuin search --cmd-only --limit 5000 | tac | fzf --height 40% -n2..,.. --tiebreak=index --bind=ctrl-r:toggle-sort,ctrl-z:ignore); and commandline -i $cmd'

# Ctrl-E: Default atuin search
bind \ce _atuin_search_widget
