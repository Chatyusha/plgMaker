scriptencoding utf-8
let s:save_cpo = &cpo
set cpo&vim

if exists('g:loaded_plgmaker')
	finish
endif
let g:loaded_plgmaker = 1

let s:bin_path=expand('<sfile>:p:h:h') . '/bin'
let s:tmp_path=s:bin_path . "/tmp"

let &cpo = s:save_cpo
unlet s:save_cpo

