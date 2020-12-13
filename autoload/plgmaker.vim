scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

if exists('g:loaded_plgmaker')
	finish
endif
let g:loaded_plgmaker = 1

let s:bin_path=expand('<sfile>:p:h:h') . '/bin'
let s:tmp_path=s:bin_path . "/tmp"
function! plgmaker#MakePlugin (...) abort
	if a:0 >= 4
		echo "too many args"
		return 0
	endif
	let l:cmd='bash ' . s:bin_path . '/opscheck.sh ' . join(a:000)
	let l:option_state=system(l:cmd)
	let l:options=a:000
	if l:option_state % 2 == 0
		echo "not plugin name"
		return 0
	elseif l:option_state % 4 < 2 
		if exists('g:plgmaker_pluginpath')==0
			echo l:options
			let l:p=['-d=' . expand('%:p:h')]
			let l:options=l:options + l:p
		else
			let l:p=['-d=' . g:plgmaker_pluginpath ]
			let l:options=l:options + l:p
		endif
	endif

	execute '!bash ' . s:bin_path . '/mkplg.sh '. join(l:options)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
