	xor a
	ld d,a
	ld e,a
	ld (#4161), de
	ld (#4601), de
	ld (#4320), a
	ld (#4323), a
	ld (#4340), a
	ld (#4343), a
	ld (#4420), a
	ld (#4423), a
	ld (#4440), a
	ld (#4443), a
	ld a, 7
	ld (#4061), a
	ld (#4701), a
	ld a, 224
	ld (#4062), a
	ld (#4702), a
	ld a, 31
	ld (#4021), a
	ld (#4741), a
	ld a, 248
	ld (#4022), a
	ld (#4742), a
	ld a, 63
	ld (#4121), a
	ld (#4641), a
	ld a, 252
	ld (#4122), a
	ld (#4642), a
	ld a, 127
	ld (#4221), a
	ld (#4541), a
	ld a, 254
	ld (#4222), a
	ld (#4542), a
	ld a, 1
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
	ld a, 128
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