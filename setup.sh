echo "Installing vim plugins..."
git submodule init && git submodule update

echo "Copying Vim plugins to ~/.vim/bundle/"
cp -R .vim  ~/.vim

echo "Creating persistent undo directory"
mkdir ~/.vim/undodir

echo "Creating a new vim alias in ~/.bash_profile"
echo "" >> ~/.bash_profile
echo "###########################" >> ~/.bash_profile
echo "# VIM ALIAS FOR JACOB MARSHALL" >> ~/.bash_profile
echo "alias v=\"vim -u ~/myVim/.vimrc\"" >> ~/.bash_profile
echo "###########################" >> ~/.bash_profile

echo "Ready to go!"
