function! s:ExpandMethodChain(line1, line2) abort
    let l:lines = getline(a:line1, a:line2)
    let l:expanded = []
    let l:indent_size = &shiftwidth
    for l:line in l:lines
        let l:indent = matchstr(l:line, '^\s*')
        let l:line_content = l:line[strlen(l:indent):]
        let l:parts = split(l:line_content, '\.')
        let l:expanded_indent = l:indent . repeat(' ', l:indent_size)
        let l:expanded_line = l:indent . join(map(copy(l:parts), { idx, val -> idx == 0 ? val : '.' . val }), "\n" . l:expanded_indent)
        call extend(l:expanded, split(l:expanded_line, "\n"))
    endfor
    call setline(a:line1, l:expanded[0])
    call append(a:line1, l:expanded[1:])
endfunction

command! -range ExpandMethod call s:ExpandMethodChain(<line1>, <line2>)

function! s:Expand(line1, line2) abort
    let l:lines = getline(a:line1, a:line2)
    let l:expanded = []
    let l:indent_size = &shiftwidth
    for l:line in l:lines
        let l:indent = matchstr(l:line, '^\s*')
        let l:line_content = l:line[strlen(l:indent):]
        let l:parts = split(l:line_content, ', ')
        let l:expanded_indent = l:indent . repeat(' ', l:indent_size)
        if len(l:parts) > 1
            let l:expanded_line = l:indent . join(map(copy(l:parts), { idx, val -> val . ',' }), "\n" . l:expanded_indent)
            let l:last_comma_idx = strridx(l:expanded_line, ',')
            let l:expanded_line = strpart(l:expanded_line, 0, l:last_comma_idx) . strpart(l:expanded_line, l:last_comma_idx + 1)
        else
            let l:expanded_line = l:indent . l:parts[0] . ","
        endif
        call extend(l:expanded, split(l:expanded_line, "\n"))
    endfor
    call setline(a:line1, l:expanded[0])
    call append(a:line1, l:expanded[1:])
endfunction

command! -range Expand call s:Expand(<line1>, <line2>)

command! -range -nargs=0 Condense <line1>,<line2>s/\n\s*//g | '<,'>s/)\zs\s*\ze[^{;]$/\r/ | <line1>,<line2>s/\n\s*\././g

