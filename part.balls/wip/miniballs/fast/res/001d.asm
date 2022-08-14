	xor a
	ld d,a
	ld e,a
	ld (#4241), de
	ld (#4521), de
	inc a
	ld (#4141), a
	ld (#4621), a
	ld a, 128
	ld (#4142), a
	ld (#4622), a
	ld a, 3
	ld (#4041), a
	ld (#4721), a
	ld a, 192
	ld (#4042), a
	ld (#4722), a
	ret
