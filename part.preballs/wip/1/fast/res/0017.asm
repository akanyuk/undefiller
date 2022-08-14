	ld a, 1
	ld hl, #48b7
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld hl, #4d97
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld a, 128
	ld (#4e98), a
	ld a, 192
	ld hl, #4bd8
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld (#4f98), a
	ld a, 224
	ld hl, #48d8
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld (#48b8), a
	ld (#4fb8), a
	ld a, 240
	ld hl, #49b8
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld a, 3
	ld hl, #4bb7
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld a, 7
	ld (#48d7), a
	ld (#49d7), a
	ret
