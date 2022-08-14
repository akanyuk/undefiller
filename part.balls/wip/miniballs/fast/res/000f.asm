	ld a, 15
	ld (#4001), a
	ld (#4260), a
	ld (#4500), a
	ld (#4761), a
	ld a, 240
	ld (#4002), a
	ld (#4263), a
	ld (#4503), a
	ld (#4762), a
	ld a, 127
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
	ld (#4101), a
	ld (#4661), a
	ld a, 254
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
	ld (#4102), a
	ld (#4662), a
	ld a, 1
	ld (#4200), a
	ld (#4560), a
	ld a, 255
	ld hl, #4040
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld hl, #4043
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
	ld hl, #4423
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld d,a
	ld e,a
	ld (#4201), de
	ld (#4561), de
	ld a, 128
	ld (#4203), a
	ld (#4563), a
	ld a, 3
	ld (#4300), a
	ld (#4460), a
	ld a, 192
	ld (#4303), a
	ld (#4463), a
	ld a, 7
	ld (#4360), a
	ld (#4400), a
	ld a, 224
	ld (#4363), a
	ld (#4403), a
	ld a, 31
	ld (#4160), a
	ld (#4600), a
	ld a, 248
	ld (#4163), a
	ld (#4603), a
	ld a, 63
	ld (#4020), a
	ld (#4060), a
	ld (#4700), a
	ld (#4740), a
	ld a, 252
	ld (#4023), a
	ld (#4063), a
	ld (#4703), a
	ld (#4743), a
	ret
