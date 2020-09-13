if !exists('g:Lf_Extensions')
	let g:Lf_Extensions = {}
endif

let g:Lf_Extensions.autojump = {
			\ 'source': 'leaderf#autojump#source',
			\ 'accept': 'leaderf#autojump#accept',
			\ 'highlights_def': {
			\ 'Lf_hl_autojumpScore': '^\d\+\.\d\+',
			\ 'Lf_hl_autojumpDirectory': '^\d\+\.\d\+\t\zs.*',
			\ },
			\ 'highlights_cmd': [
			\ 'hi link Lf_hl_autojumpScore Number',
			\ 'hi link Lf_hl_autojumpDirectory Directory',
			\ ],
			\ }

