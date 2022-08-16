	ld a, 4
	ld (#48d7), a
	ld a, 6
	ld (#49d7), a
	inc a
	ld (#4ad7), a
	ld a, 15
	ld hl, #4bd7
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld a, 128
	ld hl, #4cd8
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld (#48f8), a
	ld a, 31
	ld (#48f7), a
	ld (#4ed7), a
	ld (#4fd7), a
	ld a, 63
	ld (#49f7), a
	ld (#4af7), a
	ld a, 126
	ld (#4bf7), a
	ld (#4cf7), a
	ret
