# dotvim: Vim configuration

My current Vim configuration. It is fairly standard with the addition of gdb (Conque, Nvim-r) and QOL keybinds. 

Packages are managed via pathogen.

* surround
* fugitive
* tabular
* airline
* goyo.vim
* easymotion
* tComment
* vim-indent-guides

* NerdTREE
* ConqueGDB
* Nvim-R

## Installation:

```
# Clone repo
git clone git://github.com/levvim/dotvim.git ~/.vim

# Create symlinks
ln -s ~/.vim/vimrc ~/.vimrc

# Fetch submodules
cd ~/.vim/bundle
git clone https://github.com/altercation/vim-colors-solarized
git clone https://github.com/tpope/vim-surround
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/godlygeek/tabular
git clone https://github.com/vim-airline/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes
git clone https://github.com/junegunn/goyo.vim
git clone https://github.com/easymotion/vim-easymotion
git clone https://github.com/tomtom/tcomment_vim
git clone https://github.com/nathanaelkane/vim-indent-guides
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/vim-scripts/Conque-GDB
git clone https://github.com/jalvesaq/nvim-r
```
