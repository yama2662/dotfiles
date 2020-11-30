export PATH=/usr/local/Cellar/openssl@1.1/1.1.1d/include:$PATH:/usr/local/opt/:/Library/TeX/texbin
export ZPLUG_HOME=/usr/local/opt/zplug
#export LIBRARY_PATH=/usr/local/Cellar/openssl@1.1/1.1.1d/lib
source $ZPLUG_HOME/init.zsh
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
export PATH="$HOME/.goenv/bin:/usr/local/opt/openssl@1.1/bin:$PATH"
fpath=(~/.zsh/completion $fpath)

eval "$(goenv init -)"
eval "$(pyenv init -)"
eval "$(rbenv init -)"

zplug "themes/wedisagree",   from:oh-my-zsh

# テーマファイルを読み込む
#zplug 'dracula/zsh', as:theme

# 未インストール項目をインストールする
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose

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
