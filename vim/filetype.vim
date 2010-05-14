if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
  au! BufRead,BufNewFile *.haml         setfiletype haml 
  au! BufRead,BufNewFile *.sass         setfiletype sass 
augroup END
