	jp introInit
	jp introMain
	jp pt3Player + 5	; play music on interrupts
	; stop
	jp pt3Player + 8	

introMain	ld a, #41
1	ld hl, #5800 : ld de, #5801 : ld bc, 32*9 - 1 : ld (hl), a : ldir
	halt
	halt
	inc a : cp #48 : jr nz, 1b

	ld b, #10 : halt : djnz $-1

	ld b, 6 : call anima_phase
	ld b, 5 : halt : djnz $-1
	ld b, 4 : call anima_phase

	ld b, #10 : halt : djnz $-1

	; display "CREATIVE MEDIA DEMOMAKING CREW"
	ld bc, #0001
1	push bc
	ld hl, ATTR1
	ld de, #5920
	ldir 
	halt
	pop bc : inc bc
	ld a, c : cp #20 : jr nz, 1b

	ld b, #40 : halt : djnz $-1

	; hide all
	ld de, #4001
	ld a, 80
	push af 
1	push de
	ld h, d : ld l, e : dec hl
	ld (hl), 0
	ld bc, #001f : ldir
	pop de
	call lib.DownDE
	pop af : dec a : jr z, _disp_present_end
	push af
	and #03 : jr nz, 1b : halt : jr 1b
_disp_present_end

	; display "PRESENT"
	ld hl, #5943
1	ld (hl), #47
	inc hl
	ld b, 8 : halt : djnz $-1
	ld a, l : cp #60 : jr nz, 1b
	ret

anima_phase	push bc
	call anm_hl
	pop bc 
	halt
	djnz anima_phase
	ret

SCR_PACKED	incbin "res/otsiders.6144.zx0"
ATTR1	incbin "res/attr1"	
PackedPSG	incbin "res/nq-outsiders-intro.psg.tpp"

anm_hl	ld hl, anima_proc
	ld e, (hl) : inc hl
	ld d, (hl) : inc hl
	ld (anm_hl + 1), hl
	ex de, hl

	; determine data flow start
	push hl
1	ld a, (hl) : inc hl : cp %11111111
	jr nz, 1b
	pop ix

	; set start address
	ld a, (hl) : ld e, a : inc hl
	ld a, (hl) : ld d, a : inc hl
_an_cycle	ld a, (ix + 0) : inc ix
	bit 7, a : jr z, 1f
	ld c, a
	and #e0
	cp #a0 : jr z, _anc_jmp100
	ret 
	; end of frame		
1	bit 6, a : jr z, _anc_set
_anc_jmp	; jump screen address
	and #3f
	inc a : ld c, a : ld b, 0
	ex de, hl : add hl, bc : ex de, hl
	jr _an_cycle
_anc_jmp100	ld a, c
	and #0f
	or a : jr z, 1f
	inc d : dec a : jr nz, $-2
1	ld a, c : and %00010000 : jr z, _an_cycle
	ld bc, #0080	; additional jump +128 bytes
	ex de, hl : add hl, bc : ex de, hl
	jr _an_cycle
_anc_set	; copy N bytes from flow to screen
	inc a
	ldi : dec a : jr nz, $-3
	jr _an_cycle
anima_proc	dw aaa8c_0001
	dw aaa8c_0002
	dw aaa8c_0003
	dw aaa8c_0004
	dw aaa8c_0005
	dw aaa8c_0006
	dw aaa8c_0007
	dw aaa8c_0008
	dw aaa8c_0009
	dw aaa8c_000a
aaa8c_0001	include "res/aa8c/0001.asm"
aaa8c_0002	include "res/aa8c/0002.asm"
aaa8c_0003	include "res/aa8c/0003.asm"
aaa8c_0004	include "res/aa8c/0004.asm"
aaa8c_0005	include "res/aa8c/0005.asm"
aaa8c_0006	include "res/aa8c/0006.asm"
aaa8c_0007	include "res/aa8c/0007.asm"
aaa8c_0008	include "res/aa8c/0008.asm"
aaa8c_0009	include "res/aa8c/0009.asm"
aaa8c_000a	include "res/aa8c/000a.asm"

introInit	ld hl, SCR_PACKED
	ld de, #4000
	call lib.Depack

	; initializing player 
pt3Player	include "../lib/tbkplayer.fast.asm"
	incbin "res/nq-outsiders-intro.psg.tpp"