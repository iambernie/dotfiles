" quotation marks are used for comments.
"set background=dark
execute pathogen#infect('~/.vim/bundles/{}')

syntax on

set backspace=indent,eol,start
set hlsearch
set t_Co=256
set ruler
colorscheme mywombat

"removes trailing whitespace:
autocmd BufWritePre * :%s/\s\+$//e

"turns off auto-indenting:
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

"sets background transparent
hi Normal ctermbg=none

let g:SuperTabDefaultCompletionType = "<c-n>"

let g:rbpt_colorpairs = [
    \ ['darkred',     'DarkOrchid3'],
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['yellow',         'yellow'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['red',         'red'],
    \ ]

let g:netrw_dirhistmax = 0


au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

