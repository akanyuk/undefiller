	; part.balls: depack
	ld a, P_BALLS : call lib.SetPage
	ld hl, A_PART_BALLS_PACKED
	ld de, A_PART_BALLS
	call lib.Depack

	define BLUE	 %01000001
	define RED  	 %01000010
	define MAGENTA   %01000011
	define GREEN  	 %01000100
	define LIGHTBLUE %01000101
	define YELLOW 	 %01000110
	define WHITE 	 %01000111

	; part.preballs: play
	ld b,32
.preballsCycle	push bc
	ld de, #4000
	call A_PART_BALLS
	halt
	halt
	halt
	pop bc
	djnz .preballsCycle

	ld b, 115 : halt : djnz $-1

	ld a, 6 : out (#fe), a
	ld a,%00110000 : call lib.SetScreenAttr
	dup 5
	halt
	edup
	xor a : out (#fe), a
	ld a,#46 : call lib.SetScreenAttr

	; Play balls on interrupts
	ld hl,playBallsCycle
	call interrStart

1	ld de, WAIT_BALLS_TRANS : ld hl, (INTS_COUNTER) : sbc hl, de : jr c, 1b
	
	ld hl, TRANS_PIPELINE
	ld b, (TRANS_PIPELINE_END - TRANS_PIPELINE)/4
	call transPipeline

1	ld de, WAIT_BALLS_MORE : ld hl, (INTS_COUNTER) : sbc hl, de : jr c, 1b

	ld b, 5
1	push bc
	ld a, 7 : out (#fe), a
	ld a,%00111000 : call lib.SetScreenAttr
	halt
	halt
	halt
	xor a : out (#fe), a
	ld a,#47 : call lib.SetScreenAttr
	halt
	halt
	halt
	pop bc
	djnz 1b

	ld hl, TRANS_PIPELINE2
	ld b, (TRANS_PIPELINE2_END - TRANS_PIPELINE2)/4
	call transPipeline

	call interrStop
	jr playBallsDone
TRANS_PIPELINE	
	db MAGENTA, MAGENTA, 02, 40
	db RED, BLUE, 03, 40

	db GREEN, WHITE, 00, 40
	db LIGHTBLUE, MAGENTA, 01, 1

TRANS_PIPELINE_END


TRANS_PIPELINE2	
	db RED, BLUE, 04, 6
	db MAGENTA, YELLOW, 05, 6
	db BLUE, RED, 06, 6
	db GREEN, LIGHTBLUE, 07, 6
	db YELLOW, MAGENTA, 02, 6
	db BLUE, LIGHTBLUE, 01, 6
TRANS_PIPELINE2_END

transPipeline
1	push bc 
	ld a, (hl) : inc hl : ld c, a
	ld a, (hl) : inc hl : ld b, a
	ld a, (hl) : inc hl
	push hl
	call A_PART_BALLS + 9
	pop hl : ld a, (hl) : inc hl
	ld b, a : halt : djnz $-1	
	pop bc : djnz 1b
	ret

	; part.balls: main
playBallsCycle	ld a,#00
	inc a : and #01 : ld(playBallsCycle+1),a
	or a : ret z
	ld de, #4000
	call A_PART_BALLS + 6
	jp A_PART_BALLS + 3

playBallsDone                