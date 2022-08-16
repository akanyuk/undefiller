	; blink 'UNDEFINED'
	call A_PART_NETTED + 15

	; initial screen
	call A_PART_NETTED + 12

	ld b,60 : halt : djnz $-1

	ld bc,#0244 : call nettedCycle

	; удаление остатоков "undefined"
	ld hl,#4880
	ld de,#4881 
	ld a,8
1	push af
	push hl
	push de
	ld (hl),0
	ld b,9 : ldir
	pop de : inc d
	pop hl : inc h
	pop af : dec a : jr nz, 1b

	ld bc,#0243 : call nettedCycle
	ld bc,#0242 : call nettedCycle
	ld bc,#0201 : call nettedCycle

	ld bc,#0146 : call nettedCycle
	ld bc,#0146 : call nettedCycle

	ld b, 32
1	push bc
	call A_PART_NETTED + 6
	pop bc
	djnz 1b

	ld bc,#0146 : call nettedCycle
	ld bc,#0146 : call nettedCycle

	ld b, 32
1	push bc
	call A_PART_NETTED + 6
	pop bc
	djnz 1b

	ld bc,#0146 : call nettedCycle
	ld bc,#0146 : call nettedCycle

	jr playNettedDone

	; b - speed (1 - fast, 2 - normal)
	; c - color
nettedCycle	ld a,b : ld (.spd+1),a
	ld a,c : call lib.SetScreenAttr
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