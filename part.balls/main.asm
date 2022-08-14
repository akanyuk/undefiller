	device zxspectrum128

	define _DEBUG_ 1

	define A_PART_BALLS #7000

	org #6000
start	
	module lib
	include "../lib/shared.asm"	
	endmodule

	di : ld sp, start

	xor a : out #fe, a
	ld a,#5c, i,a, hl,interr, (#5cff),hl : im 2 : ei

	ld a,#46 : call lib.SetScreenAttr

                ; Play balls on interrupts
                ld hl,playBallsCycle
                call interrStart

	call A_PART_BALLS + 6
	di : halt

playBallsCycle	ld a,#00
                inc a : and #01 : ld(playBallsCycle+1),a
                or a : ret z
                ld de, #4000
	call A_PART_BALLS + 3
	jp A_PART_BALLS	

	; запуск нужной процедуры на прерываниях
	; HL - адрес процедура
interrStart	ld de, interrCurrent
	ex de, hl
	ld (hl), #c3 ; jp
	inc hl : ld (hl), e
	inc hl : ld (hl), d
	ret

	; остановка процедуры на прерываниях
interrStop	ld hl, interrCurrent
	ld (hl), #c9 ; ret
	ret

interrCurrent	ret
	nop
	nop

interr	di
	push af,bc,de,hl,ix,iy
	exx : ex af, af'
	push af,bc,de,hl,ix,iy
	ifdef _DEBUG_ : ld a, #01 : out (#fe), a : endif ; debug

	call interrCurrent

	ifdef _DEBUG_ : xor a : out (#fe), a : endif ; debug
	pop iy,ix,hl,de,bc,af
	exx : ex af, af'
	pop iy,ix,hl,de,bc,af
	ei
	ret

	org A_PART_BALLS
	include "part.asm"
	display /d, 'Part length: ', $ - A_PART_BALLS
	display 'Part ended at: ', $

	; build
	if (_ERRORS == 0 && _WARNINGS == 0)
	;  LABELSLIST "user.l"
	  savesna SNA_FILENAME, start	   ; SNA_FILENAME defined in Makefile
	  savebin BIN_FILENAME, A_PART_BALLS, $-A_PART_BALLS ; BIN_FILENAME defined in Makefile
	endif
