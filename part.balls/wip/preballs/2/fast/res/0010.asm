	ld a, 255
	ld hl, #508e
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld hl, #508f
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld (#576e), a
	ld a, 192
	ld hl, #5090
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld (#576f), a
	ld a, 127
	ld (#538e), a
	ld (#548f), a
	ret
