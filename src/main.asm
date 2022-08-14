	device zxspectrum128

	page 0

	; define _DEBUG_ 1
	define _MUSIC_ 1

	; адресa частей
A_PART_NETTED	equ #7000
A_PART_PREBALLS equ #7000
A_PART_BALLS 	equ #7000

	define P_TRACK 1 ; трек и плеер лежат здесь
	define P_BALLS 3 
	define P_PREBALLS 3 

	; счетчики
	define C_PART_BALLS_END 200

	org #6000

page0s	module lib
	include "lib/shared.asm"	
	endmodule

	di : ld sp, page0s
	xor a : out (#fe), a 
	call lib.ClearScreen
	ld a,#5c : ld i,a : ld hl,interr : ld (#5cff),hl : im 2 : ei

	ld a,#44 : call lib.SetScreenAttr

	call musicStart
	xor a : call lib.SetPage

	ld b,250 : halt : djnz $-1

	call A_PART_TEXT

	include "play_netted.asm"	

	; part.preballs: depack
	ld a, P_PREBALLS : call lib.SetPage
	ld hl, A_PART_PREBALLS_PACKED
	ld de, A_PART_PREBALLS
	call lib.Depack

	; part.preballs: play
	ld b,32
1	push bc
	ld de, #4000
	call A_PART_PREBALLS
	halt
	halt
	halt
	pop bc
	djnz 1b

	; part.balls: depack
	ld a, P_BALLS : call lib.SetPage
	ld hl, A_PART_BALLS_PACKED
	ld de, A_PART_BALLS
	call lib.Depack

	; part.balls: main
1	ld de, #4000
	call A_PART_BALLS + 3
	halt
	halt
	call A_PART_BALLS	
	jr 1b

	; ld de, C_PART_BALLS_END
	; ld hl, (INTS_COUNTER) : sbc hl, de : jr c, 1b

	xor a : out (#fe), a : call lib.SetScreenAttr
	ld b, 50 : halt : djnz $ -1

	jr $

musicStop	ifdef _MUSIC_
	ld a, P_TRACK : call lib.SetPage
	call PT3PLAY + 8
	xor a : ld (MUSIC_STATE), a
	endif
	ret
musicStart	ifdef _MUSIC_
	ld a, P_TRACK : call lib.SetPage
	call PT3PLAY
	ld a, #01 : ld (MUSIC_STATE), a
	endif
	ret

musicStartWoInit
	ifdef _MUSIC_	
	ld a, #01 : ld (MUSIC_STATE), a
	endif
	ret

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

	ifdef _MUSIC_
MUSIC_STATE	equ $+1	
	ld a, #00 : or a : jr z, 1f
	ld a, (lib.CUR_SCREEN) : ld b, a
	ld a, P_TRACK : or b : or %00010000
	ld bc, #7ffd : out (c), a
	call PT3PLAY + 5	
	// Restore page
	ld a, (lib.CUR_SCREEN) : ld b, a 
	ld a, (lib.CUR_PAGE) : or b : or %00010000
	ld bc, #7ffd : out (c), a
1	
	endif

	call interrCurrent

	; счетчик интов
INTS_COUNTER	equ $+1
	ld hl, #0000 : inc hl : ld ($-3), hl

	ifdef _DEBUG_ : xor a : out (#fe), a : endif ; debug
	pop iy,ix,hl,de,bc,af
	exx : ex af, af'
	pop iy,ix,hl,de,bc,af
	ei
	ret

A_PART_TEXT	include "part.text/part.asm"

	display /d, '[page 0] bytes before overlap at #7000: ', #7000 - $

	org A_PART_NETTED
	include "part.netted/part.asm"

page0e	display /d, '[page 0] free: ', #ffff - $, ' (', $, ')'	

	define _page1 : page 1 : org #c000
page1s	
PT3PLAY	include "lib/PTxPlay.asm"
	incbin "res/nq-ATE-not-used.pt3"
page1e	display /d, '[page 1] free: ', 65536 - $, ' (', $, ')'

	define _page3 : page 3 : org #c000
page3s	
A_PART_PREBALLS_PACKED	incbin "build/part.preballs.bin.zx0"
A_PART_BALLS_PACKED	incbin "build/part.balls.bin.zx0"
page3e	display /d, '[page 3] free: ', 65536 - $, ' (', $, ')'

	include "src/builder.asm"
