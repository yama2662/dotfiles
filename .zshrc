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

function chpwd() { ls }

alias be='bundle exec'

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
