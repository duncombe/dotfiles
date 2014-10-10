" I hate highlighted search
:se nohls
" If we are running a diff turn syntax off
:if &diff
:   syntax off
:else
:   syntax on
:endif 
" Turn on folding using marker method
:se foldmethod=marker
" Make F7 paragraph format
:map <F7> gqap
" Use a modeline in files
:se modeline
" IMPORTANT: access local.vimrc
" if the current directory has a .vimrc, source it (unless it is the home directory, when an infinite loop occurs)
:if getcwd() != expand("~")
:   if filereadable(".vimrc")
:       so .vimrc
:   endif
:endif
" take advantage of the modeline and use it when editing THIS file
" vim: se nowrap tw=0 :

