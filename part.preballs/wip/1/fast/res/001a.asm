	ld a, 6
	ld (#44f6), a
	inc a
	ld (#45f6), a
	ld a, 3
	ld (#46f6), a
	ld a, 128
	ld hl, #4938
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ld (#46f7), a
	ld (#47f7), a
	ld a, 1
	ld (#47f6), a
	ld (#4816), a
	ld a, 192
	ld (#4817), a
	ld (#4c38), a
	ld (#4d38), a
	ld a, 224
	ld (#4917), a
	ld (#4e38), a
	ld a, 240
	ld (#4958), a
	ld (#4a17), a
	ld a, 120
	ld (#4b17), a
	ld (#4c17), a
	ld a, 60
	ld (#4d17), a
	ld (#4e17), a
	ld a, 30
	ld (#4f17), a
	inc a
	ld (#4837), a
	ld (#4937), a
	ld a, 15
	ld hl, #4a37
	ld (hl), a
	inc h
	ld (hl), a
	inc h
	ld (hl), a
	ret
