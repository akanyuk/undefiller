	device zxspectrum128

	define A_PART_GREETS #7000

	org #6000
start	
	module lib
	include "../lib/shared.asm"	
	endmodule

	di : ld sp, start

	xor a : out #fe, a
	ld a,#5c, i,a, hl,interr, (#5cff),hl : im 2 : ei

	call A_PART_GREETS
	call lib.FadeScreenOnInterrupts
	ld a,#44 : call lib.SetScreenAttr
	call A_PART_GREETS + 3
	call A_PART_GREETS + 6

	di : halt

interr	di
	push af,bc,de,hl,ix,iy
	exx : ex af, af'
	push af,bc,de,hl,ix,iy
	
	pop iy,ix,hl,de,bc,af
	exx : ex af, af'
	pop iy,ix,hl,de,bc,af
	ei
	ret

	org A_PART_GREETS
	include "part.asm"
	display /d, 'Part length: ', $ - A_PART_GREETS
	display 'Part ended at: ', $

	; build
	if (_ERRORS == 0 && _WARNINGS == 0)
	;  LABELSLIST "user.l"
	  savesna SNA_FILENAME, start	   ; SNA_FILENAME defined in Makefile
	  savebin BIN_FILENAME, A_PART_GREETS, $-A_PART_GREETS ; BIN_FILENAME defined in Makefile
	endif
