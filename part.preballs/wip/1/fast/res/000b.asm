	ld a, 252
	ld (#49e8), a
	ld (#4ae8), a
	ld a, 126
	ld (#4be8), a
	ld (#4ce8), a
	ld a, 63
	ld hl, #4de8
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld a, 128
	ld (#4fe9), a
	ld (#5009), a
	ld a, 31
	ld (#5008), a
	ld a, 15
	ld (#5108), a
	ld a, 192
	ld (#5109), a
	ld a, 1
	ld hl, #5208
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld a, 224
	ld (#5209), a
	ld (#5309), a
	ld a, 240
	ld (#5409), a
	ld a, 248
	ld (#5509), a
	ld a, 120
	ld (#5609), a
	ret
