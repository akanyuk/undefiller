	; blink 'UNDEFINED'
	call A_PART_NETTED + 15

	; initial screen
	call A_PART_NETTED + 12

1	ld de, WAIT_PAYALNIK_END : ld hl, (INTS_COUNTER) : sbc hl, de : jr c, 1b

	ld a,#02 : call nettedCycle
	ld a,#02 : call nettedCycle
	ld a,#02 : call nettedCycle
	
	call lib.ClearScreen
	dup 5
	halt
	edup

	ld a,#02 : call nettedCycle
	ld a,#02 : call nettedCycle

	call lib.ClearScreen
	ld a,#42 : call lib.SetScreenAttr

	ld a,#02 : call nettedCycle

	ld a,#41 : call lib.SetScreenAttr
	ld a,#02 : call nettedCycle

	xor a : call lib.SetScreenAttr
	call lib.ClearScreen

	ld b, 12 : halt : djnz $-1

	ld a,%00111000 : call lib.SetScreenAttr
	ld a, 7 : out (#fe), a
	halt
	halt
	xor a : out (#fe), a
	ld a,#03 : call lib.SetScreenAttr

	ld b, 4 : halt : djnz $-1

	ld a,#01 : call nettedCycle

	ld b, 32
1	push bc
	call A_PART_NETTED + 6
	pop bc
	djnz 1b

	ld a,#01 : call nettedCycle
	ld a,#01 : call nettedCycle

	ld b, 32
1	push bc
	call A_PART_NETTED + 6
	pop bc
	djnz 1b

	ld a,#43 : call lib.SetScreenAttr
	ld a,#01 : call nettedCycle

	ld a,#44 : call lib.SetScreenAttr
	ld a,#01 : call nettedCycle

	ld a,#47 : call lib.SetScreenAttr
	ld a,#01 : call nettedCycle

	ld a,#46 : call lib.SetScreenAttr
	ld a,#01 : call nettedCycle

	jr playNettedDone

	; a - speed (1 - fast, 2 - normal)
nettedCycle	ld (.spd+1),a
	ld b,64
1	push bc
	ld de,#4000 
	call A_PART_NETTED + 3
	call A_PART_NETTED
	ld de,#4000 
	call A_PART_NETTED + 9
	call A_PART_NETTED + 6
.spd 	ld a,#00
	halt : dec a : or a : jr nz, .spd+2
	pop bc 
	djnz 1b
	ret

playNettedDone	