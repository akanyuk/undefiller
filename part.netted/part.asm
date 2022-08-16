	jp player1.NextFrame
	jp player1.DisplayFrame
	jp player2.NextFrame
	jp player2.DisplayFrame
	jp screenReplace

	; 'UNDEFINED' blinker
	ld b,4
1	push bc
	xor a : call lib.SetScreenAttr
	dup 6
	halt
	edup
	ld a,#44 : call lib.SetScreenAttr
	dup 5
	halt
	edup
	pop bc 
	djnz 1b

	ld b,6
1	push bc
	xor a : call lib.SetScreenAttr
	dup 5
	halt
	edup
	ld a,#44 : call lib.SetScreenAttr
	dup 4
	halt
	edup
	pop bc 
	djnz 1b

	ld b,8
1	push bc
	xor a : call lib.SetScreenAttr
	dup 3
	halt
	edup
	ld a,#44 : call lib.SetScreenAttr
	dup 2
	halt
	edup
	pop bc 
	djnz 1b

	ld b,12
1	push bc
	xor a : call lib.SetScreenAttr
	dup 2
	halt
	edup
	ld a,#44 : call lib.SetScreenAttr
	halt
	pop bc 
	djnz 1b

	ret

screenReplace	ld hl,UD_LOGO
	ld de,#4840

	ld a,32
1	push af
	push de
	ld bc,12
	ldir
	pop de
	call lib.DownDE
	pop af
	dec a : jr nz,1b

	ld b,50 : halt : djnz $-1
	
	ld hl,BEFORE_SCR
	jp lib.dispBinScrWithHalts
BEFORE_SCR	incbin "res/start_scr.bin"
UD_LOGO	incbin "res/udlogo.bin"

	module player1
	include "player.asm"
	endmodule
	module player2
	include "player.asm"
	endmodule
	include "res/frames/frames.asm"
