	xor a
	ld d,a
	ld e,a
	ld (#4001), de
	ld (#4761), de
	ld (#4200), a
	ld (#4203), a
	ld (#4300), a
	ld (#4303), a
	ld (#4460), a
	ld (#4463), a
	ld (#4560), a
	ld (#4563), a
	ld a, 15
	ld (#4060), a
	ld (#4101), a
	ld (#4160), a
	ld (#4600), a
	ld (#4661), a
	ld (#4700), a
	ld a, 240
	ld (#4063), a
	ld (#4102), a
	ld (#4163), a
	ld (#4603), a
	ld (#4662), a
	ld (#4703), a
	ld a, 127
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
	ld (#4201), a
	ld (#4561), a
	ld a, 254
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
	ld (#4202), a
	ld (#4562), a
	ld a, 3
	ld (#4360), a
	ld (#4400), a
	ld a, 192
	ld (#4363), a
	ld (#4403), a
	ld a, 7
	ld (#4260), a
	ld (#4500), a
	ld a, 224
	ld (#4263), a
	ld (#4503), a
	ld a, 31
	ld (#4020), a
	ld (#4740), a
	ld a, 248
	ld (#4023), a
	ld (#4743), a
	ld a, 63
	ld hl, #4120
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld hl, #4440
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld a, 252
	ld hl, #4123
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld hl, #4443
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ret
