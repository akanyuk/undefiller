	xor a
	ld d,a
	ld e,a
	ld (#4321), de
	ld (#4441), de
	ld a, 3
	ld (#4341), a
	ld (#4421), a
	ld a, 192
	ld (#4342), a
	ld (#4422), a
	ld a, 7
	ld (#4241), a
	ld (#4521), a
	ld a, 224
	ld (#4242), a
	ld (#4522), a
	ld a, 15
	ld (#4041), a
	ld (#4141), a
	ld (#4621), a
	ld (#4721), a
	ld a, 240
	ld (#4042), a
	ld (#4142), a
	ld (#4622), a
	ld (#4722), a
	ret
