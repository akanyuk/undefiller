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

1	call fast.DisplayFrame
	call fast.NextFrame
	halt
	jr 1b

DATA	module fast
	include "player.asm"
	endmodule

	display /d, "Animation size: ", $-DATA
	savebin "fast.bin", DATA, $-DATA
	savesna "fast.sna", #5d00
