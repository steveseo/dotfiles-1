" options
" =======
setlocal completeopt=longest,menuone,preview


" cpp-specific Keymaps
" ====================

" Show <Quickfix List> buffer at the right splitted vertically
noremap <F6> <ESC>:cclose<CR>:vertical 60copen<CR>:wincmd h<CR>

" Automatic makeprg generation (regarding %:r.in, %r.ans)
if !filereadable('Makefile')
	let s:sourcefile = expand("%")
	let s:basename = expand("%:r")
	let s:has_input  = filereadable(s:basename . ".in")
	let s:has_answer = filereadable(s:basename . ".ans")

	let s:makeprg_compile = printf("g++ -g -Wall --std=c++0x -O2 %s -o %s", s:sourcefile, s:basename)
	let s:makeprg_run     = printf("time ./%s", s:basename)
	if s:has_input  | let s:makeprg_run .= printf(" < %s.in", s:basename) | endif
	if s:has_answer | let s:makeprg_run .= printf(" | tee %s.out && diff -wu %s.out %s.ans", s:basename, s:basename, s:basename) | endif

	let s:makeprg_cmds = [s:makeprg_compile, s:makeprg_run]
	let &g:makeprg = "(" . join(s:makeprg_cmds, " && ") . ")"
endif
