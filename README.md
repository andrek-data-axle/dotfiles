These are a few of my files from my home directory.

Normally hidden files have the `.` removed.

## oh-my-zsh
install oh-my-zsh in ~/oh-my-zsh
you will also need to recreate .zshrc_aws with aws credentials

```
ln -s ~/platform/dotfiles/zshrc ~/.zshrc
```

## vim/nvim
You must run both of those commands if you want to use nvim and vim.
For nvim:
```
ln -s ~/platform/dotfiles/init.vim ~/.config/nvim
```

For vim:
```
ln -s ~/platform/dotfiles/vimrc ~/.vimrc
```

## vundle
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

## powerline fonts

Install powerline fonts from github: https://github.com/powerline/fonts
