export PATH=/usr/local/Cellar/openssl@1.1/1.1.1d/include:$PATH:/usr/local/opt/:/Library/TeX/texbin:/opt/homebrew/bin:/opt/homebrew/opt/imagemagick@6/bin
export PATH="$HOME/.goenv/bin:/usr/local/opt/openssl@1.1/bin:$PATH:$PYENV_ROOT/bin"
export PYENV_ROOT="$HOME/.pyenv"
fpath=(~/.zsh/completion $fpath)

eval "$(goenv init -)"
eval "$(rbenv init -)"
eval "$(nodenv init -)"
eval "$(pyenv init -)"

source $HOME/.zinit/bin/zinit.zsh

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit load zdharma/history-search-multi-word

zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

zinit wait lucid atload"zicompinit; zicdreplay" blockf for zsh-users/zsh-completions


# 環境変数
export LANG=ja_JP.UTF-8

# オプション
setopt auto_cd

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
        export PATH=/usr/local/bin:$PATH
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

function chpwd() { ls }


alias la='ls -la'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias be='bundle exec'

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

exec fish
