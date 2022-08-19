	; depack
	ld a, P_GREETS : call lib.SetPage
	ld hl, A_PART_GREETS_PACKED
	ld de, A_PART_GREETS
	call lib.Depack

1	ld de, WAIT_AMIGA : ld hl, (INTS_COUNTER) : sbc hl, de : jr c, 1b

	ld a,%00111000 : call lib.SetScreenAttr
	ld a, 7 : out (#fe), a
	dup 5
	halt
	edup
	xor a : out (#fe), a
	call lib.SetScreenAttr

	call A_PART_GREETS

1	ld de, WAIT_GREETS : ld hl, (INTS_COUNTER) : sbc hl, de : jr c, 1b

	call lib.FadeScreenOnInterrupts
	ld a,#44 : call lib.SetScreenAttr
	
                call A_PART_GREETS + 3

1	ld de, WAIT_5_ELEMENT : ld hl, (INTS_COUNTER) : sbc hl, de : jr c, 1b
	
                call A_PART_GREETS + 6
	call A_PART_GREETS + 9