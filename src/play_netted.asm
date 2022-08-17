	; blink 'UNDEFINED'
	call A_PART_NETTED + 15

	; initial screen
	call A_PART_NETTED + 12

	ld b,255 : halt : djnz $-1
	ld b,100 : halt : djnz $-1

	ld a,#02 : call nettedCycle
	
	call lib.ClearScreen

	ld a,#02 : call nettedCycle

	ld a,#42 : call lib.SetScreenAttr
	ld a,#02 : call nettedCycle

	ld a,#41 : call lib.SetScreenAttr
	ld a,#02 : call nettedCycle

	ld a,#46 : call lib.SetScreenAttr

	ld a,#01 : call nettedCycle
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

	ld a,#01 : call nettedCycle
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