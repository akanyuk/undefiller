	; part.balls: depack
	ld a, P_BALLS : call lib.SetPage
	ld hl, A_PART_BALLS_PACKED
	ld de, A_PART_BALLS
	call lib.Depack

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

	; Play balls on interrupts
	ld hl,playBallsCycle
	call interrStart

1	ld de, C_PART_MINIBALLS1 : ld hl, (INTS_COUNTER) : sbc hl, de : jr c, 1b
	ld a,%01000010 : call A_PART_BALLS + 9

1	ld de, C_PART_MINIBALLS2 : ld hl, (INTS_COUNTER) : sbc hl, de : jr c, 1b
	ld a,%01000011 : call A_PART_BALLS + 9

1	ld de, C_PART_MINIBALLS3 : ld hl, (INTS_COUNTER) : sbc hl, de : jr c, 1b
	ld a,%01000111 : call A_PART_BALLS + 9

	jr playBallsDone

	; part.balls: main
playBallsCycle	ld a,#00
	inc a : and #01 : ld(playBallsCycle+1),a
	or a : ret z
	ld de, #4000
	call A_PART_BALLS + 6
	jp A_PART_BALLS + 3

playBallsDone                