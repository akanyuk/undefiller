	ld a, 3
	ld (#418d), a
	ld (#436e), a
	ld a, 240
	ld hl, #436f
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld (#418e), a
	ld a, 127
	ld (#446e), a
	ld a, 7
	ld (#408d), a
	ld (#456d), a
	ld (#476d), a
	ld a, 255
	ld hl, #456e
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld (#408e), a
	ld a, 15
	ld (#466d), a
	ld a, 192
	ld (#408f), a
	ld a, 2
	ld (#428d), a
	ret
