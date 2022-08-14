	ld a, 7
	ld hl, #4220
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld hl, #4340
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld (#4361), a
	ld (#4401), a
	ld a, 224
	ld hl, #4223
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld hl, #4343
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld (#4362), a
	ld (#4402), a
	ld a, 63
	ld (#4261), a
	ld (#4501), a
	ld a, 252
	ld (#4262), a
	ld (#4502), a
	ld a, 127
	ld (#4161), a
	ld (#4601), a
	ld a, 254
	ld (#4162), a
	ld (#4602), a
	inc a
	ld d,a
	ld e,a
	ld (#4061), de
	ld (#4701), de
	ld a, 1
	ld (#4020), a
	ld (#4740), a
	ld a, 128
	ld (#4023), a
	ld (#4743), a
	ld a, 3
	ld (#4120), a
	ld (#4640), a
	ld a, 192
	ld (#4123), a
	ld (#4643), a
	ld a, 15
	ld hl, #4040
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld hl, #4520
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld a, 240
	ld hl, #4043
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld hl, #4523
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ret
