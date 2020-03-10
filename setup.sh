# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# dein
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
sh ~/installer.sh ~/.cache/dein

# ないもの追加
find . -type f | grep -v .git | grep -v setup.sh | while read line; do
    if [ -e ~/$line ]; then
        continue
    fi
    # echo $line
done

