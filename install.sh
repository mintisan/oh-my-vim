echo "remove old vim config, u should backup firstly"
sudo rm -rf ~/.vim ~/oh-my-vim ~/.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/mintisan/oh-my-vim.git ~/oh-my-vim
cd ~/oh-my-vim
ln -s $PWD/vimrc ~/.vimrc
