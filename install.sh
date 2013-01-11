cd ~/

rm .bash_profile
rm .bash_prompt
rm .bashrc
rm .inputrc
rm .profile
rm -r .vim
rm .vimrc



ln -s ~/dotfiles/.bash_profile   .bash_profile
ln -s ~/dotfiles/.bash_prompt    .bash_prompt
ln -s ~/dotfiles/.bashrc         .bashrc
ln -s ~/dotfiles/.inputrc        .inputrc
ln -s ~/dotfiles/.profile        .profile
ln -s ~/dotfiles/.vim            .vim
ln -s ~/dotfiles/.vimrc          .vimrc
