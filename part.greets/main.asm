	device zxspectrum128

	define A_PART_TEXT #7000

	org #6000
start	
	module lib
	include "../lib/shared.asm"	
	endmodule

	di : ld sp, start

	xor a : out #fe, a
	ld a,#5c, i,a, hl,interr, (#5cff),hl : im 2 : ei

	ld a,#44 : call lib.SetScreenAttr

	call A_PART_TEXT

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

	org A_PART_TEXT
	include "part.asm"
	display /d, 'Part length: ', $ - A_PART_TEXT
	display 'Part ended at: ', $

	; build
	if (_ERRORS == 0 && _WARNINGS == 0)
	;  LABELSLIST "user.l"
	  savesna SNA_FILENAME, start	   ; SNA_FILENAME defined in Makefile
	  savebin BIN_FILENAME, A_PART_TEXT, $-A_PART_TEXT ; BIN_FILENAME defined in Makefile
	endif
