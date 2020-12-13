# plgMaker
> Making template plugins for neovim/Vim

Note: This plugin depends on 'bash'.
      If you don't have 'bash' yet, install it!

- [Install](#install)
  - [Requirements](#requirements)
- [Configiration](#configiration)
- [Using](#using)

## install
For dein.vim

```viml
call dein#add('Chatyusha/plgMaker')
if !has('nvim')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
endif
```

### Requirements

plgMaker requires Neovim or Vim8.
If `which bash` returns non-empty string and Bash version 5.0 or higher, then you have you have Bash 5.0 support;

## Configiration
```vim
" The directory path to put the plugin when using plgMaker to create a plugin.
" If this variable is not specified, the Plugin will be created in the cant directory
" It is an example
let g:plgmaker_pluginpath = '~/myPlugins'
```

## using
See `:Mkplg --help` or `:Mkplg -ex`
