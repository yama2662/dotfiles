source ~/.zplug/init.zsh

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

function chpwd() { ls }


alias la='ls -la'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias be='bundle exec'

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
