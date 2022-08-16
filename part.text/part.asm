	; multimatograf
	ld de,#4000 : call lib.PrintCursor
	ld b,20 : halt : djnz $-1

	ld hl,TEXT1
	ld de,#4001
	call PrintHuman

	ld b,10 : halt : djnz $-1

	ld de,#4040 : call PrintWait
	ld b,20 : halt : djnz $-1

	ld hl,TEXT2
	ld de,#4040 
	call lib.PrintCpu

	ld de,#40a0 : call lib.PrintCursor
	ld b,100 : halt : djnz $-1

	; dihalt
	ld hl,TEXT3
	ld de,#40a1
	call PrintHuman

	ld b,10 : halt : djnz $-1

	ld de,#40e0 : call PrintWait
	ld b,20 : halt : djnz $-1

	ld hl,TEXT4
	ld de,#40e0 
	call lib.PrintCpu

	ld de,#4840 : call lib.PrintCursor
	ld b,100 : halt : djnz $-1

	; cc
	ld hl,TEXT5
	ld de,#4841
	call PrintHuman

	ld b,10 : halt : djnz $-1

	ld de,#4880 : call PrintWait
	ld b,20 : halt : djnz $-1

	ld hl,TEXT2
	ld de,#4880 
	call lib.PrintCpu

	ld de,#48e0 : call lib.PrintCursor
	ld b,100 : halt : djnz $-1

	; cafe
	ld hl,TEXT6
	ld de,#48e1
	call PrintHuman

	ld b,10 : halt : djnz $-1

	ld de,#5020 : call PrintWait
	ld b,20 : halt : djnz $-1

	ld hl,#5a20
	ld de,#5a21
	ld (hl),#42
	ld bc,#1f
	ldir

	ld hl,TEXT7
	ld de,#5020 
	call lib.PrintCpu

	ld de,#5080 : call lib.PrintCursor

	ld b,150 : halt : djnz $-1

	; begin slow clean
	ld hl,#5800
	ld de,#5801
	ld (hl),0
	ld bc,#0148
1	ldi
	ldi
	ldi
	ldi
	ldi
	ldi
	ldi
	ldi
	halt
	ld a, b : or c : jr nz, 1b

	ld hl,#59e0
	ld de,#59e1
	ld bc,#00c0
	ld (hl),0
	ldir

	; really cleanup
	ld hl,#4000
	ld de,#4001
	ld bc,#07ff
	ld (hl),l
	ldir

	ld hl,#5000
	ld de,#5001
	ld bc,#07ff
	ld (hl),l
	ldir

	ld de,#4840 
	ld b,9
1	push bc
	ld a, " "
	call lib.PrintChar_8x8
	pop bc
	djnz 1b

	ld de,#48e0 
	ld b,16
1	push bc
	ld a, " "
	call lib.PrintChar_8x8
	pop bc
	djnz 1b

	ld b,50 : halt : djnz $-1

	;  removing "chaos constructions"
	ld de,#484a
	ld b,21
1	push bc
	ld a, " "
	call lib.PrintChar_8x8
	pop bc
	djnz 1b

	ld a,#44 : call lib.SetScreenAttr

	ret

TEXT1	db "undefine \"multimatograf\"", 0
TEXT2	db "UNDEFINED", 0

TEXT3	db "undefine \"dihalt\"", 0
TEXT4	db "Failed remove \"dihalt.winter\"", 0

TEXT5	db "undefine \"chaos constructions\"", 0

TEXT6	db "undefine \"cafe\"", 0
TEXT7	db "DANGER! BUGULMA!", 0

; Print zero ended string with font 8х8 - human speed
; DE - Screen memory address
; HL - Text pointer
PrintHuman 	ld a, (hl)
	or a : ret z
	push af
	ld a,"_"
	call lib.PrintChar_8x8
	pop af
	dec de
	dec hl
	ld b,6 : halt : djnz $-1
	call lib.PrintChar_8x8
	jr PrintHuman

PrintWait	ld b,9
.PrintWait	push bc
	ld b,20 : halt : djnz $-1
	ld a,"."
	call lib.PrintChar_8x8
	pop bc
	djnz .PrintWait
	ret
