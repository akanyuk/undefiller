	ld a, 3
	ld hl, #4d27
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld (#42e8), a
	ld (#4847), a
	ld (#4947), a
	ld a, 7
	ld (#43e8), a
	ld (#44e8), a
	ld a, 127
	ld (#4a08), a
	ld a, 1
	ld (#4a47), a
	ld (#4c27), a
	ld a, 240
	ld (#4c28), a
	ld a, 224
	ld hl, #4d28
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld a, 192
	ld hl, #4848
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ret
