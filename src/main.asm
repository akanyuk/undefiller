	device zxspectrum128

	page 0

	; define _DEBUG_ 1
	define _MUSIC_ 1

	; адресa частей
A_PART_BALLS 	equ #7000
	define P_INTRO 1 ; "OUTSIDERS" intro
	define P_TRACK 1 ; трек и плеер лежат здесь
	define P_START_SCR 7
	define P_BALLS 3 

	; счетчики
	define C_MINIBALLS1 4500
	define C_MINIBALLS2 4700
	define C_MINIBALLS3 4900
	define C_AFTER_BALLS 5100

	org #6000

page0s	module lib
	include "lib/shared.asm"	
	endmodule

	di : ld sp, page0s
	xor a : out (#fe), a 
	call lib.SetScreenAttr
	ld a,#5c : ld i,a : ld hl,interr : ld (#5cff),hl : im 2 : ei

	include "play_intro.asm"

	ld a, P_START_SCR : call lib.SetPage
	ld hl,START_SCR
	call lib.dispBinScrWithHalts

	call musicStart
	xor a : call lib.SetPage

	ld b,180 : halt : djnz $-1
	call lib.fadeScreenOnInterrupts

	call lib.ClearScreen
	ld a,#44 : call lib.SetScreenAttr

	call A_PART_TEXT
	ld b,20 : halt : djnz $-1

	include "play_netted.asm"	
	
	include "play_balls.asm"	

	ld b,200 : halt : djnz $-1

	; STOP HERE
	ifdef _MUSIC_
	ld a, P_TRACK : call lib.SetPage
	call PT3PLAY + 8
	xor a : ld (MUSIC_STATE), a
	endif

	jr $

musicStart	ifdef _MUSIC_
	ld a, P_TRACK : call lib.SetPage
	call PT3PLAY
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
A_PART_NETTED	include "part.netted/part.asm"

page0e	display /d, '[page 0] free: ', #ffff - $, ' (', $, ')'	

	define _page1 : page 1 : org #c000
page1s	
A_PART_INTRO	include "part.intro/part.intro.asm"
PT3PLAY	include "lib/PTxPlay.asm"
	incbin "res/nq-ATE-not-used.pt3"
page1e	display /d, '[page 1] free: ', 65536 - $, ' (', $, ')'

	define _page3 : page 3 : org #c000
page3s	
A_PART_BALLS_PACKED	incbin "build/part.balls.bin.zx0"
page3e	display /d, '[page 3] free: ', 65536 - $, ' (', $, ')'

	define _page7 : page 7 : org #c000
page7s	
START_SCR	incbin "res/retroPC.bin"
page7e	display /d, '[page 7] free: ', 65536 - $, ' (', $, ')'

	include "src/builder.asm"
