	ld hl,#5800
	ld de,#5801
	ld a,#20
1	ld bc,#0020
	ld (hl),0
	ldir
	halt
	dec a : jr nz, 1b
	 