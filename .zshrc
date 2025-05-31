PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
export PATH

# brew install font-jetbrains-mono-nerd-font

# starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# brew install zsh-autosuggestion
# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# brew install zsh-syntax-hightlighting
#source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# brew intall zsh-autocomplete
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# brew install eza (better ls)
alias ls="eza --icons"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

# brew install bat (better cat)
