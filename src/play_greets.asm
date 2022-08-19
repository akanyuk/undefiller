A_amigaImage	equ A_PART_GREETS 
A_greetsMain	equ A_PART_GREETS + 3
A_multipassImage equ A_PART_GREETS + 6
A_multipassText equ A_PART_GREETS + 9
A_amigaShow 	equ A_PART_GREETS + 12
A_amigaHide	equ A_PART_GREETS + 15

	; depack
	ld a, P_GREETS : call lib.SetPage
	ld hl, A_PART_GREETS_PACKED
	ld de, A_PART_GREETS
	call lib.Depack

1	ld de, WAIT_AMIGA : ld hl, (INTS_COUNTER) : sbc hl, de : jr c, 1b

	ld a,%00111000 : call lib.SetScreenAttr
	ld a, 7 : out (#fe), a
	dup 5
	halt
	edup
	xor a : out (#fe), a
	call lib.SetScreenAttr

	call A_amigaImage

	ld hl, ayBlinker
	call interrStart

	ld b,80 : halt : djnz $-1
	
	call amiger
	ld b,50 : halt : djnz $-1

	ld hl, #c840
	call amigaBlinker
	ld b,50 : halt : djnz $-1

	call amiger
	ld b,50 : halt : djnz $-1

	ld hl, #d0a0
	call amigaBlinker
	ld b,30 : halt : djnz $-1

	call amiger
	ld b,50 : halt : djnz $-1

	ld hl, #c080
	call amigaBlinker
	ld b,30 : halt : djnz $-1

	ld hl, #c880
	call amigaBlinker

1	ld de, WAIT_GREETS : ld hl, (INTS_COUNTER) : sbc hl, de : jr c, 1b

	call interrStop

	call lib.FadeScreenOnInterrupts
	ld a,#44 : call lib.SetScreenAttr
	
                call A_greetsMain

1	ld de, WAIT_5_ELEMENT : ld hl, (INTS_COUNTER) : sbc hl, de : jr c, 1b
	
                call A_multipassImage
	call A_multipassText

	jp _playGreetsEnd

amiger 	call A_amigaHide
	ld b,15 : halt : djnz $-1
	jp A_amigaShow

amigaBlinker	push hl
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

_playGreetsEnd