	ld a, 7
	ld (#4021), a
	ld (#4741), a
	ld a, 224
	ld (#4022), a
	ld (#4742), a
	ld a, 31
	ld (#4121), a
	ld (#4641), a
	ld a, 248
	ld (#4122), a
	ld (#4642), a
	ld a, 63
	ld (#4221), a
	ld (#4541), a
	ld a, 252
	ld (#4222), a
	ld (#4542), a
	ld a, 127
	ld (#4321), a
	ld (#4341), a
	ld (#4421), a
	ld (#4441), a
	ld a, 254
	ld (#4322), a
	ld (#4342), a
	ld (#4422), a
	ld (#4442), a
	inc a
	ld hl, #4041
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld hl, #4042
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld hl, #4521
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld hl, #4522
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ret
