	; de : starting screen address (#4000, #c000, etc...)
DisplayFrame	ld HL,FRAME_0000
	ld c,(hl) : inc hl ; Screen shift
	ld b,(hl) : inc hl
	ex de,hl
	add hl,bc
	ex de,hl
	xor a : ld b,a
cycle	ld  a,(hl)
	inc hl
	ld c,a
	rla
	jp nc,2f
	rlca		; cp  #80
	ret c
	; long jump
	ld  a,c
	and #0f
	add a,d : ld d,a
	bit 4,c
	jp  z, cycle
	ld a,#80
	add e
	ld e,a
	jp nc,cycle
	inc d
	jp  cycle
2	rlca
	jp c,nearJmp
	inc c		; copy N bytes to screen
	ldir
	jp cycle
nearJmp	ld a,c
	res 6,a
	inc a
	add e
	ld e,a
	jp nc,cycle
	inc d
	jp  cycle

NextFrame	ld HL,FRAMES
	inc hl : inc hl
	ld a,l
	cp low(FRAMES_END)
	jp nz, 1f
	ld a,h
	cp high(FRAMES_END)
	jp nz,1f
	ld hl,FRAMES
1	ld (NextFrame+1),hl
	ld e, (hl)
	inc hl
	ld d,(hl)
	ex de,hl
	ld (DisplayFrame+1),hl
	ret

