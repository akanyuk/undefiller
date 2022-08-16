	ld a, 15
	ld (#4020), a
	ld (#4120), a
	ld (#4201), a
	ld (#4561), a
	ld (#4640), a
	ld (#4740), a
	ld a, 240
	ld (#4023), a
	ld (#4123), a
	ld (#4202), a
	ld (#4562), a
	ld (#4643), a
	ld (#4743), a
	ld a, 63
	ld hl, #4040
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld hl, #4420
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld (#4301), a
	ld (#4461), a
	ld a, 252
	ld hl, #4043
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld hl, #4423
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld (#4302), a
	ld (#4462), a
	ld a, 255
	ld d,a
	ld e,a
	ld (#4361), de
	ld (#4401), de
	ld a, 1
	ld (#4260), a
	ld (#4500), a
	ld a, 128
	ld (#4263), a
	ld (#4503), a
	ld a, 3
	ld (#4160), a
	ld (#4600), a
	ld a, 192
	ld (#4163), a
	ld (#4603), a
	ld a, 7
	ld (#4060), a
	ld (#4700), a
	ld a, 224
	ld (#4063), a
	ld (#4703), a
	ld a, 31
	ld (#4220), a
	ld (#4320), a
	ld (#4440), a
	ld (#4540), a
	ld a, 248
	ld (#4223), a
	ld (#4323), a
	ld (#4443), a
	ld (#4543), a
	ret
