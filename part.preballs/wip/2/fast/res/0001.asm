	ld a, 63
	ld (#466d), a
	ld a, 1
	ld hl, #408c
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld (#476c), a
	ld a, 255
	ld (#408d), a
	ld (#418d), a
	ld (#476d), a
	ld a, 254
	ld (#428d), a
	ld a, 240
	ld (#438d), a
	ld a, 128
	ld (#448d), a
	ret
