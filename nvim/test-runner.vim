function! AppendToTestFile(data)
  if a:data =~ "test"
    redir! >> /tmp/testlist
  endif
  call UpdateTestFile(a:data)
endfunction
function! WriteToTestFile(data)
  if a:data =~ "test"
    redir! > /tmp/testlist
  endif
  call UpdateTestFile(a:data)
endfunction
function! UpdateTestFile(data)
  let @+=a:data
  silent echo a:data
  redir END
  write
endfunction

"https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript
function! GetVisualSelection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

nnoremap <silent> <Leader>cf :call WriteToTestFile(expand("%"))<CR>
nnoremap <silent> <Leader>cl :call WriteToTestFile(expand("%") . ":" . line("."))<CR>
vnoremap <silent> <Leader>cl :<C-U>call WriteToTestFile(expand("%") . " --name \"$(printf \"%q\" \"/" . GetVisualSelection() . "/\")\"")<CR>
nnoremap <silent> <Leader>cF :call AppendToTestFile(expand("%"))<CR>
nnoremap <silent> <Leader>cL :call AppendToTestFile(expand("%") . ":" . line("."))<CR>
vnoremap <silent> <Leader>cL :<C-U>call AppendToTestFile(expand("%") . " --name \"$(printf \"%q\" \"/" . GetVisualSelection() . "/\")\"")<CR>

function! SetTestLocationList()
  let lines = systemlist("cat /tmp/testoutput | grep ']:$\\|bin/rails'")
  call setloclist(0, [], ' ', { 'lines' : l:lines, 'efm':  '%m [%f:%l]:,bin/rails test %f:%l' })
  lfirst
endfunction
nnoremap <silent> <Leader>ce :call SetTestLocationList()<CR>
