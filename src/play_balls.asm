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

	ld a, 7 : out (#fe), a
	dup 5
	halt
	edup
	xor a : out (#fe), a

	; Play balls on interrupts
	ld hl,playBallsCycle
	call interrStart

1	ld de, WAIT_BALLS_TRANS : ld hl, (INTS_COUNTER) : sbc hl, de : jr c, 1b
	
	ld hl, TRANS_PIPELINE
	ld b, (TRANS_PIPELINE_END - TRANS_PIPELINE)/4
1	push bc 
	ld a, (hl) : inc hl : ld c, a
	ld a, (hl) : inc hl : ld b, a
	ld a, (hl) : inc hl
	push hl
	call A_PART_BALLS + 9
	pop hl : ld a, (hl) : inc hl
	ld b, a : halt : djnz $-1	
	pop bc : djnz 1b

	call interrStop
	jr playBallsDone
TRANS_PIPELINE	
	db MAGENTA, MAGENTA, 02, 40
	db RED, BLUE, 03, 40

	db GREEN, WHITE, 00, 40
	db LIGHTBLUE, MAGENTA, 01, 82

	db RED, BLUE, 04, 5
	db MAGENTA, WHITE, 04, 5
	db BLUE, RED, 05, 5
	db GREEN, LIGHTBLUE, 03, 5
	db RED, MAGENTA, 02, 5
	db BLUE, LIGHTBLUE, 01, 5
	; db WHITE, GREEN, 00, 1
TRANS_PIPELINE_END


	; part.balls: main
playBallsCycle	ld a,#00
	inc a : and #01 : ld(playBallsCycle+1),a
	or a : ret z
	ld de, #4000
	call A_PART_BALLS + 6
	jp A_PART_BALLS + 3

playBallsDone                