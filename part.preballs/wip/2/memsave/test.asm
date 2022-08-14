	device zxspectrum128

	org #5d00
	ld sp, $-2
	ld hl, #5800
	ld de, #5801
	ld bc, #02ff
	ld (hl), %01000111
	ldir
	xor a : out (#fe), a
	ei

1	ld de, #4000
	call memsave.DisplayFrame
	call memsave.NextFrame
	halt
	jr 1b

DATA	module memsave
	include "player.asm"
	endmodule

	display /d, "Animation size: ", $-DATA
	savebin "memsave.bin", DATA, $-DATA
	savesna "memsave.sna", #5d00
