highlight LineNr ctermfg=gray guifg=#808080
set number
set smartindent
set smarttab
set nocompatible
set hlsearch
set incsearch
set tabstop=4
set shiftwidth=4
set softtabstop=4
set makeprg=g++-14\ -std=c++20\ -Wall\ -Wextra\ -O2\ %\ -o\ %<
"autocmd BufWinEnter * match ErrorMsg /\s\+$/
let mapleader = " "
"vnoremap <leader>y :w !win32yank.exe -i --crlf<CR><CR>
if executable('win32yank.exe')
    let g:clipboard = {
          \   'name': 'win32yank-wsl',
          \   'copy': {
          \      '+': 'win32yank.exe -i --crlf',
          \      '*': 'win32yank.exe -i --crlf',
          \    },
          \   'paste': {
          \      '+': 'win32yank.exe -o --lf',
          \      '*': 'win32yank.exe -o --lf',
          \   },
          \   'cache_enabled': 0,
          \ }
endif
"set clipboard=unnamedplus
"vnoremap <leader>y "+y
" 视觉模式下：精准复制选中的内容到 Windows 剪贴板
vnoremap <leader>y y:call system("win32yank.exe -i --crlf", getreg('"'))<CR>
augroup cpp_template
    autocmd!
    autocmd BufNewFile *.cpp call append(0, [
        \ '#include <bits/stdc++.h>',
        \ '',
        \ 'int main() {',
        \ '    std::ios::sync_with_stdio(false);',
        \ '    std::cin.tie(nullptr);',
        \ '',
        \ '}'
        \ ])
augroup END

call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
call plug#end()

" 启用ALE
let g:ale_enabled = 1

" 设置C/C++使用的检查工具，例如使用gcc和clang
let g:ale_c_gcc_executable = 'gcc'
let g:ale_cpp_gcc_executable = 'g++'
"let g:ale_c_clang_executable = 'clang'
"let g:ale_cpp_clang_executable = 'clang++'

" 定义希望启用的linter（语法检查器）
" 对于C语言，你可以选择gcc和/或clang
let g:ale_c_cc_options = '-Wall -Wextra -std=c11'
let g:ale_cpp_cc_options = '-Wall -Wextra -std=c++23'

" 只在保存文件时进行检查，输入时不实时检查，避免干扰
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1

" 设置错误和警告的标志
"let g:ale_sign_error = 'ⓧ '
"let g:ale_sign_warning = '⚠️'
let g:ale_sign_warning = '❗'


let g:ale_sign_error = '❌'      " 错误图标
"let g:ale_sign_error = '✖'      " 错误图标
"highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
highlight ALEErrorSign guifg=#ff5555 guibg=NONE ctermbg=NONE
highlight ALEWarningSign guifg=#ffb86c guibg=NONE ctermbg=NONE
set signcolumn=yes
highlight SignColumn guibg=NONE ctermbg=NONE
" 在状态栏显示错误信息
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%] <%code%>'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"let g:ale_type_map = {'g++': {'W': 'E'}} "
"let g:ale_cursor_detail = 1
"let g:ale_floating_window_border = ['|', '-', '+', '+', '+', '+', '+', '+']

let g:ale_set_highlights = 0

