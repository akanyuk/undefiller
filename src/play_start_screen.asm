SAD_FILIN       equ #40d6

	ld a, P_START_SCR : call lib.SetPage
	ld hl,START_SCR
	call lib.DispBinOnInterrupts

                ld b,30 : halt : djnz $-1

                ld hl, START_NAMES
                call plStartName

                ld b,80 : halt : djnz $-1

                call plStartEraser
                ld b,10 : halt : djnz $-1
                ld hl, START_NAMES + 12*8*3
                call plStartName

                ld b,80 : halt : djnz $-1

                call plStartEraser
                ld b,10 : halt : djnz $-1
                ld hl, START_NAMES + 12*8*6
                call plStartName

                ld b,30 : halt : djnz $-1

                ; happy filin
                ld hl, SAD_FILIN
                ld (hl), %00001000 : inc h
                ld (hl), %00001000 : inc h
                ld (hl), %00001000 : inc h : inc h
                ld (hl), 0 : inc h
                ld (hl), 0 : inc h
                ld (hl), 0 

                jp _playStartEnd

plStartName     ld de, #40c1
                ld bc, 12
                ld a, 12
1               push af
                push hl
                push de
                ld a,16
2               push af
                ld a, (hl) : ld (de), a
                call lib.DownDE
                add hl, bc
                pop af
                dec a : jr nz, 2b
                halt                
                pop de : inc de
                pop hl : inc hl
                pop af : dec a : jr nz, 1b
                ret

plStartEraser   ld hl, #40c1 + 12
                ld a, 13
1               push af
                push hl
                ld b, 16
2               ld (hl), 0
                call lib.DownHL
                djnz 2b
                halt                
                pop hl : dec hl
                pop af : dec a : jr nz, 1b
                ret

_playStartEnd

