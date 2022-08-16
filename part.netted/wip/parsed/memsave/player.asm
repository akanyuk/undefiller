	; de : starting screen address (#4000, #c000, etc...)
DisplayFrame	ld HL,FRAME_0000
	ld c,(hl) : inc hl ; Screen shift
	ld b,(hl) : inc hl
	ex de,hl
	add hl,bc
	ex de,hl
	xor a : ld b,a
cycle	ld  a,(hl)
	inc hl
	ld c,a
	rla
	jp nc,2f
	rlca		; cp  #80
	ret c
	; long jump
	ld  a,c
	and #0f
	add a,d : ld d,a
	bit 4,c
	jp  z, cycle
	ld a,#80
	add e
	ld e,a
	jp nc,cycle
	inc d
	jp  cycle
2	rlca
	jp c,nearJmp
	inc c		; copy N bytes to screen
	ldir
	jp cycle
nearJmp	ld a,c
	res 6,a
	inc a
	add e
	ld e,a
	jp nc,cycle
	inc d
	jp  cycle

NextFrame	ld HL,FRAMES
	inc hl : inc hl
	ld a,l
	cp low(FRAMES_END)
	jp nz, 1f
	ld a,h
	cp high(FRAMES_END)
	jp nz,1f
	ld hl,FRAMES
1	ld (NextFrame+1),hl
	ld e, (hl)
	inc hl
	ld d,(hl)
	ex de,hl
	ld (DisplayFrame+1),hl
	ret

FRAMES
	dw FRAME_0000
	dw FRAME_0001
	dw FRAME_0002
	dw FRAME_0003
	dw FRAME_0004
	dw FRAME_0005
	dw FRAME_0006
	dw FRAME_0007
	dw FRAME_0008
	dw FRAME_0009
	dw FRAME_000a
	dw FRAME_000b
	dw FRAME_000c
	dw FRAME_000d
	dw FRAME_000e
	dw FRAME_000f
	dw FRAME_0010
	dw FRAME_0011
	dw FRAME_0012
	dw FRAME_0013
	dw FRAME_0014
	dw FRAME_0015
	dw FRAME_0016
	dw FRAME_0017
	dw FRAME_0018
	dw FRAME_0019
	dw FRAME_001a
	dw FRAME_001b
	dw FRAME_001c
	dw FRAME_001d
	dw FRAME_001e
	dw FRAME_001f
	dw FRAME_0020
	dw FRAME_0021
	dw FRAME_0022
	dw FRAME_0023
	dw FRAME_0024
	dw FRAME_0025
	dw FRAME_0026
	dw FRAME_0027
	dw FRAME_0028
	dw FRAME_0029
	dw FRAME_002a
	dw FRAME_002b
	dw FRAME_002c
	dw FRAME_002d
	dw FRAME_002e
	dw FRAME_002f
	dw FRAME_0030
	dw FRAME_0031
	dw FRAME_0032
	dw FRAME_0033
	dw FRAME_0034
	dw FRAME_0035
	dw FRAME_0036
	dw FRAME_0037
	dw FRAME_0038
	dw FRAME_0039
	dw FRAME_003a
	dw FRAME_003b
	dw FRAME_003c
	dw FRAME_003d
	dw FRAME_003e
	dw FRAME_003f
FRAMES_END
FRAME_0000	include "res/0000.asm"
FRAME_0001	include "res/0001.asm"
FRAME_0002	include "res/0002.asm"
FRAME_0003	include "res/0003.asm"
FRAME_0004	include "res/0004.asm"
FRAME_0005	include "res/0005.asm"
FRAME_0006	include "res/0006.asm"
FRAME_0007	include "res/0007.asm"
FRAME_0008	include "res/0008.asm"
FRAME_0009	include "res/0009.asm"
FRAME_000a	include "res/000a.asm"
FRAME_000b	include "res/000b.asm"
FRAME_000c	include "res/000c.asm"
FRAME_000d	include "res/000d.asm"
FRAME_000e	include "res/000e.asm"
FRAME_000f	include "res/000f.asm"
FRAME_0010	include "res/0010.asm"
FRAME_0011	include "res/0011.asm"
FRAME_0012	include "res/0012.asm"
FRAME_0013	include "res/0013.asm"
FRAME_0014	include "res/0014.asm"
FRAME_0015	include "res/0015.asm"
FRAME_0016	include "res/0016.asm"
FRAME_0017	include "res/0017.asm"
FRAME_0018	include "res/0018.asm"
FRAME_0019	include "res/0019.asm"
FRAME_001a	include "res/001a.asm"
FRAME_001b	include "res/001b.asm"
FRAME_001c	include "res/001c.asm"
FRAME_001d	include "res/001d.asm"
FRAME_001e	include "res/001e.asm"
FRAME_001f	include "res/001f.asm"
FRAME_0020	include "res/0020.asm"
FRAME_0021	include "res/0021.asm"
FRAME_0022	include "res/0022.asm"
FRAME_0023	include "res/0023.asm"
FRAME_0024	include "res/0024.asm"
FRAME_0025	include "res/0025.asm"
FRAME_0026	include "res/0026.asm"
FRAME_0027	include "res/0027.asm"
FRAME_0028	include "res/0028.asm"
FRAME_0029	include "res/0029.asm"
FRAME_002a	include "res/002a.asm"
FRAME_002b	include "res/002b.asm"
FRAME_002c	include "res/002c.asm"
FRAME_002d	include "res/002d.asm"
FRAME_002e	include "res/002e.asm"
FRAME_002f	include "res/002f.asm"
FRAME_0030	include "res/0030.asm"
FRAME_0031	include "res/0031.asm"
FRAME_0032	include "res/0032.asm"
FRAME_0033	include "res/0033.asm"
FRAME_0034	include "res/0034.asm"
FRAME_0035	include "res/0035.asm"
FRAME_0036	include "res/0036.asm"
FRAME_0037	include "res/0037.asm"
FRAME_0038	include "res/0038.asm"
FRAME_0039	include "res/0039.asm"
FRAME_003a	include "res/003a.asm"
FRAME_003b	include "res/003b.asm"
FRAME_003c	include "res/003c.asm"
FRAME_003d	include "res/003d.asm"
FRAME_003e	include "res/003e.asm"
FRAME_003f	include "res/003f.asm"
