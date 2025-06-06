# ---------- WezTerm ---------- 
PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
export PATH

# --------- Nerd Font -----------
# brew install font-jetbrains-mono-nerd-font

# --------- Starship -----------
# starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# --------- zah-autosuggestion ----------- 
# brew install zsh-autosuggestion
# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# --------- zsh-syntax-highting ----------- 
# brew install zsh-syntax-hightlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --------- zsh-auto-complete ----------- 
# brew intall zsh-autocomplete
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# --------- eza ----------- 
# brew install eza (better ls)
# download theme from https://github.com/eza-community/eza-themes/blob/main/themes/tokyonight.yml
# rename theme.yml
alias ls="eza --icons"
export EZA_CONFIG_DIR=~/.config/eza

# --------- fzf ----------- 
# brew install fzf
source ~/.config/fzf/config.sh

# --------- bat ----------- 
# brew install bat (better cat)

# --------- fd ----------- 
# brew install fd (better find)

# --------- delta-git -----------
# brew install git-delta
# https://github.com/dandavison/delta
# git config --global include.path ~/.config/git-delta/.gitconfig.delta

# --------- tldr -----------
# tlrc is rust client for tldr
# brew install tlrc

# --------- tmux ----------- 
# brew install tmux
alias tmux="tmux -f ~/.config/tmux/tmux.conf"

