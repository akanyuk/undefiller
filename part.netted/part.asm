	jp player1.NextFrame
	jp player1.DisplayFrame
	jp player2.NextFrame
	jp player2.DisplayFrame
	jp screenReplace
	
	; 'UNDEFINED' blinker
blinker	ld b,4
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

screenReplace	ld b,32
.loop	push bc
.movePixels	ld hl,BEFORE_SCR
	ld de,#4000

	ld a,192
	ld bc,#0020
	push hl
	push de
1	push af
	ld a,(hl) : ld(de),a
	call lib.DownDE
	add hl,bc
	pop af : dec a : jr nz,1b
	pop de : inc de : ld (.movePixels+4),de
	pop hl : inc hl : ld (.movePixels+1),hl	

.moveAttrs	ld hl,BEFORE_SCR+#1800
	ld de,#5800
	
	ld a,24
	ld bc,#001f
	push hl
	push de	
1	push af
	ldi : inc bc
	add hl,bc
	ex de,hl : add hl,bc : ex de,hl
	pop af : dec a : jr nz,1b
	pop de : inc de : ld (.moveAttrs+4),de
	pop hl : inc hl : ld (.moveAttrs+1),hl	

	halt
	pop bc
	djnz .loop
	ret

BEFORE_SCR	incbin "res/payalnik01.bin"

	module player1
	include "player.asm"
	endmodule
	module player2
	include "player.asm"
	endmodule
	include "res/frames/frames.asm"
