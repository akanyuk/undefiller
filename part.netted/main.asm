	device zxspectrum128

	define A_PART_NETTED   #7000

	org #6000
start	
	module lib
	include "../lib/shared.asm"	
	endmodule

	di : ld sp, start

	xor a : out #fe, a
	ld a,#5c, i,a, hl,interr, (#5cff),hl : im 2 : ei

	; blink 'UNDEFINED'
	call A_PART_NETTED + 15

	; initial screen
	call A_PART_NETTED + 12

	ld b,60 : halt : djnz $-1

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

	jr $

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

interr	di
	push af,bc,de,hl,ix,iy
	exx : ex af, af'
	push af,bc,de,hl,ix,iy
	
	pop iy,ix,hl,de,bc,af
	exx : ex af, af'
	pop iy,ix,hl,de,bc,af
	ei
	ret

	org #4000
	incbin "wip/before.scr"

	org A_PART_NETTED
	include "part.asm"
	display /d, 'Part length: ', $ - A_PART_NETTED
	display 'Part ended at: ', $

	; build
	if (_ERRORS == 0 && _WARNINGS == 0)
	;  LABELSLIST "user.l"
	  savesna SNA_FILENAME, start	   ; SNA_FILENAME defined in Makefile
	  savebin BIN_FILENAME, A_PART_NETTED, $-A_PART_NETTED ; BIN_FILENAME defined in Makefile
	endif
