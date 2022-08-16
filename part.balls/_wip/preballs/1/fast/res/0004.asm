	ld a, 63
	ld (#44aa), a
	ld a, 127
	ld (#45aa), a
	ld a, 255
	ld (#46aa), a
	ld a, 1
	ld (#47a9), a
	ld a, 254
	ld (#47aa), a
	ld a, 3
	ld (#40c9), a
	ld a, 252
	ld (#40ca), a
	ld a, 7
	ld (#41c9), a
	ld a, 248
	ld (#41ca), a
	ld a, 15
	ld (#42c9), a
	ld a, 240
	ld (#42ca), a
	ld a, 31
	ld hl, #43c9
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld a, 224
	ld (#43ca), a
	ld a, 192
	ld (#44ca), a
	ld a, 128
	ld (#45ca), a
	ld a, 30
	ld (#47c9), a
	ld a, 28
	ld (#40e9), a
	ld a, 24
	ld (#41e9), a
	ld (#42e9), a
	ret
