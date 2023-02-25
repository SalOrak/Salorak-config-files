# Basic Installation
### Install nvim
sudo apt install neovim -y 

### Install Vim-Plug: A minimalist Vim plugn manager 

Source: https://github.com/junegunn/vim-plug

```bash

curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

```

### Create nvim init file ( .vimrc for vim, init.vim for neovim)
```bash
mkdir -p ~/.config/nvim 
touch ~/.config/nvim/init.vim
```

### Start basic plugin settings

Add to `~/config/nvim/init.vim`

```python
call plug#begin()

"" Theme for nvim
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

```

Now, save `:w`, source it `:source %` and run `:PlugInstall`

That's it, you are ready to go!

# APT Requirements

- `nvim`
- `latexmk` : Compile `.tex` files and more. 
- `zathura` : PDF viewer. Extremily powerful and customizable. Vi keys works by default.

# Plugins

List of plugins:
- vim-airline
- vim-airline-themes
- plenary
- telescope
- syntastic
- rust.vim
- vimtex (To work with `.tex` files)

