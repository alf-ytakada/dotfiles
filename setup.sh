# fzf
if [ ! -e ~/.fzf ] ; then
	echo "setup fzf"
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
fi

# dein
if [ ! -e ~/.cache/dein ] ; then
	echo "setup dein"
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > ~/installer.sh
	sh ~/installer.sh ~/.cache/dein
fi

# anyenv
if [ ! -e ~/.anyenv ] ; then
	echo "setup anyenv"
	git clone https://github.com/anyenv/anyenv ~/.anyenv
	echo 'export PATH="$HOME/.anyenv/bin:$PATH"' >> ~/.bash_profile
	~/.anyenv/bin/anyenv init
	. ~/.bash_profile
	anyenv install --init
fi

# ないもの追加
find . -maxdepth 1 | grep -v -e .git -v -e setup.sh -v -e "^.$" | while read line; do
    if [ -e ~/$line ]; then
		echo "skip $line"
        continue
    fi
	cp $line ~/
done

