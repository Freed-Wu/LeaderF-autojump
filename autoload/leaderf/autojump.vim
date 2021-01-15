function! leaderf#autojump#source(args) abort "{{{
	let l:file = $HOME .. '/.local/share/autojump/autojump.txt'
	if !filereadable(l:file)
		echohl WarningMsg
		echo 'Autojump histories is empty!'
		echohl None
		return []
	else
		return sort(readfile(l:file), 'leaderf#autojump#sort')
	endif
endfunction "}}}

function! leaderf#autojump#sort(a, b) abort "{{{
	return a:b - a:a
endfunction "}}}

function! leaderf#autojump#accept(line, args) abort "{{{
	let l:path = fnameescape(split(a:line, "\t")[1])
	if exists('g:leaderf#autojump#explorer')
		execute g:leaderf#autojump#explorer l:path
	elseif exists(':Defx') == 2
		execute 'Defx' l:path
	elseif exists(':LeaderfFiler') == 2
		execute 'LeaderfFiler' l:path
	elseif exists(':CocCommand') == 2
		execute 'CocCommand explorer' l:path
	elseif exists(':Explore') == 2
		execute 'Explore' l:path
	elseif
		call leaderf#autojump#open(l:path)
	endif
endfunction "}}}

function! leaderf#autojump#open(path) abort "{{{
	if has('win32')
		let l:cmd = "!start rundll32 url.dll,FileProtocolHandler"
	elseif has('mac')
		let l:cmd = "open"
	elseif executable('xdg-open')
		let l:cmd = "xdg-open"
	endif
	call system(l:cmd .. a:path)
endfunction "}}}

