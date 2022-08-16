	ld a, 3
	ld (#4b27), a
	ld (#4c27), a
	ld (#4d67), a
	ld a, 7
	ld hl, #4a67
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld (#4847), a
	ld (#4e27), a
	ld (#4f27), a
	ld a, 15
	ld hl, #4947
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
	inc h
	ld (hl), a
	ld (#4867), a
	ld (#4967), a
	ld a, 192
	ld (#4c48), a
	ld a, 128
	ld hl, #4868
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld hl, #4d48
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld a, 1
	ld (#4e67), a
	ret
