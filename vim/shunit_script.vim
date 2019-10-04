if !exists('g:test#bash#shunit#file_pattern')
  let g:test#bash#shunit2#file_pattern = '\v\.bash$'
endif

function! test#bash#shunit2#test_file(file) abort
  return a:file =~# g:test#bash#shunit2#file_pattern
endfunction

function! test#bash#shunit2#build_position(type, position) abort
  return [a:position['file']]
endfunction

function! test#bash#shunit2#build_args(args) abort
  return a:args
endfunction

function! test#bash#shunit2#executable() abort
  return 'bash'
endfunction
