echo "Installing Vundle package manager"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

echo "Installing vim plugins..."
vim -u ~/myVim.vimrc +PluginInstall +qall

echo "Creating persistent undo directory"
mkdir ~/.vim/undodir

echo "Creating a new vim alias in ~/.bash_profile"
echo "" >> ~/.bash_profile
echo "###########################" >> ~/.bash_profile
echo "# VIM ALIAS FOR JACOB MARSHALL" >> ~/.bash_profile
echo "alias v=\"vim -u ~/myVim/.vimrc\"" >> ~/.bash_profile
echo "###########################" >> ~/.bash_profile

echo "Ready to go!"
