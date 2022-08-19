	device zxspectrum128

	define _MUSIC_ 1

A_PART_GREETS 	equ #7000
A_amigaImage	equ A_PART_GREETS 
A_greetsMain	equ A_PART_GREETS + 3
A_multipassImage equ A_PART_GREETS + 6
A_multipassText equ A_PART_GREETS + 9
A_amigaShow 	equ A_PART_GREETS + 12
A_amigaHide	equ A_PART_GREETS + 15

	org #6000
start	
	module lib
	include "../lib/shared.asm"	
	endmodule

	di : ld sp, start

	xor a : out #fe, a
	ld a,#5c, i,a, hl,interr, (#5cff),hl : im 2 : ei

	xor a : call lib.SetScreen
	ld a, 7 : call lib.SetPage

	ifdef _MUSIC_
	call PT3PLAY
	endif

	ld hl, 0 : ld (INTS_COUNTER), hl

	; ---

	call A_amigaImage

	ld b,80 : halt : djnz $-1
	
	call amiger
	ld b,50 : halt : djnz $-1

	ld hl, #c840
	call blinker
	ld b,50 : halt : djnz $-1

	call amiger
	ld b,50 : halt : djnz $-1

	ld hl, #c0a0
	call blinker
	ld b,30 : halt : djnz $-1

	call amiger
	ld b,50 : halt : djnz $-1

	ld hl, #c080
	call blinker
	ld b,30 : halt : djnz $-1

1	ld de, 477 : ld hl, (INTS_COUNTER) : sbc hl, de : jr c, 1b

	ifdef _MUSIC_
	call PT3PLAY + 8
	ld a, #c9 : ld (PT3PLAY + 5), a
	endif

	call A_amigaHide
	ld b,50 : halt : djnz $-1

	call lib.FadeScreenOnInterrupts
	ld a,#44 : call lib.SetScreenAttr
	call A_greetsMain
	call A_multipassImage
	call A_multipassText

	jr $

amiger 	call A_amigaHide
	ld b,15 : halt : djnz $-1
	jp A_amigaShow

blinker	push hl
	ld hl, #4000 : ld de, #c000 : ld bc, #1b00 : 
1	ldi
	ld a, b : or c : jr nz, 1b

	pop hl

	call disortLine
	inc h
	call disortLine
	call disortLine
	call disortLine
	call disortLine
	inc h
	call disortLine
	call disortLine
	call disortLine
	call disortLine
	call disortLine
	call disortLine
	inc h
	call disortLine
	call disortLine
	call disortLine
	call disortLine
	inc h
	call disortLine
	call disortLine
	call disortLine
	call disortLine
	inc h
	call disortLine
	call disortLine

	ld a, 8 : call lib.SetScreen
	ld b,5 : halt : djnz $-1
	xor a : jp lib.SetScreen

disortLine	push hl
	ld b, #1f
1	rlc (hl) : inc hl : djnz 1b
	pop hl
	ret

ayBlinker	ld bc,#fffd : ld a, #08 : out (c),a : in a,(c)
CUR_AY	ld e,#00
	cp e : jr nc, $+4
	ld a,e : dec a
	ld (CUR_AY + 1), a		
	cp #0f : jr c, 1f
		
	; or #40
	ld hl, danC
	ld (hl), #F6
	inc hl : ld (hl), #40
	jr 2f
		
	; and #3f
1	ld hl, danC
	ld (hl), #E6
	inc hl : ld (hl), #3f
		
2
	ld hl, #5800 + 32*6 + 8 : call dan
	ld hl, #5800 + 32*6 + 9 : call dan

	ld hl, #5800 + 32*7 + 7 : call dan
	ld hl, #5800 + 32*7 + 8 : call dan
	ld hl, #5800 + 32*7 + 9 : call dan
	ld hl, #5800 + 32*7 + 10 : call dan

	ld hl, #5800 + 32*8 + 7 : call dan
	ld hl, #5800 + 32*8 + 8 : call dan
	ld hl, #5800 + 32*8 + 9 : call dan

	ld hl, #5800 + 32*9 + 7 : call dan
	ld hl, #5800 + 32*9 + 8 : call dan
	ld hl, #5800 + 32*9 + 9

dan	ld a, (hl) 
danC	or #40 : ld (hl), a
	ret

interr	di
	push af,bc,de,hl,ix,iy
	exx : ex af, af'
	push af,bc,de,hl,ix,iy
	
	ifdef _MUSIC_
	call PT3PLAY + 5	
	endif

	call ayBlinker

	; счетчик интов
INTS_COUNTER	equ $+1
	ld hl, #0000 : inc hl : ld ($-3), hl

	pop iy,ix,hl,de,bc,af
	exx : ex af, af'
	pop iy,ix,hl,de,bc,af
	ei
	ret

	org A_PART_GREETS
	include "part.asm"
	display /d, 'Part length: ', $ - A_PART_GREETS
	display 'Part ended at: ', $

	page 7
	org #e000
PT3PLAY	include "lib/PTxPlay.asm"
	incbin "wip/amiga-cut.pt3"


	; build
	if (_ERRORS == 0 && _WARNINGS == 0)
	;  LABELSLIST "user.l"
	  savesna SNA_FILENAME, start	   ; SNA_FILENAME defined in Makefile
	  savebin BIN_FILENAME, A_PART_GREETS, $-A_PART_GREETS ; BIN_FILENAME defined in Makefile
	endif
