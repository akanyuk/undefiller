	; multimatograf
	ld de,#4000 : call PrintCursor
	ld b,20 : halt : djnz $-1

	ld hl,TEXT1
	ld de,#4001
	call PrintHuman

	ld b,10 : halt : djnz $-1

	ld de,#4040 : call PrintWait
	ld b,20 : halt : djnz $-1

	ld hl,TEXT2
	ld de,#4040 
	call PrintCpu

	ld de,#40a0 : call PrintCursor
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
	call PrintCpu

	ld de,#4840 : call PrintCursor
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
	call PrintCpu

	ld de,#48e0 : call PrintCursor
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
	call PrintCpu

	ld de,#5080 : call PrintCursor

	ld b,200 : halt : djnz $-1

	; begin clean
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

	ld b,100 : halt : djnz $-1

	; continue clean
	halt
	xor a : call lib.SetScreenAttr
	call lib.ClearScreen
	ld a,#44 : call lib.SetScreenAttr
	
	; restoring "UNDEFINED"
	ld hl,TEXT2
	ld de,#4880 
1 	ld a, (hl)
	or a : jr z, 1f
	call PrintChar_8x8B
	jr 1b
1

	ld b,200 : halt : djnz $-1

	ret

TEXT1	db "undefine \"multimatograf\"", 0
TEXT2	db "UNDEFINED", 0

TEXT3	db "undefine \"dihalt\"", 0
TEXT4	db "Failed remove \"dihalt.winter\"", 0

TEXT5	db "undefine \"chaos constructions\"", 0

TEXT6	db "undefine \"cafe\"", 0
TEXT7	db "DANGER! BUGULMA!", 0

PrintCursor	ld a,">"
	call PrintChar_8x8B
	ld a,"_"
	jp PrintChar_8x8B

; Print zero ended string with font 8х8 - human speed
; DE - Screen memory address
; HL - Text pointer
PrintHuman 	ld a, (hl)
	or a : ret z
	push af
	ld a,"_"
	call PrintChar_8x8
	pop af
	dec de
	dec hl
	ld b,6 : halt : djnz $-1
	call PrintChar_8x8
	jr PrintHuman

PrintCpu 	ld a, (hl)
	or a : ret z
	call PrintChar_8x8B
	halt
	jr PrintCpu

PrintWait	ld b,9
.PrintWait	push bc
	ld b,20 : halt : djnz $-1
	ld a,"."
	call PrintChar_8x8
	pop bc
	djnz .PrintWait
	ret

; Print one char with ROM font
; DE - Screen memory address
; A  - char
PrintChar_8x8 	push hl, de, bc
	sub #1f
	ld hl, #3d00 - #08
	ld bc, #08
1	add hl, bc
	dec a
	jr nz, 1b

	dup 8 
	ld a,(hl) : ld (de),a		; normal
	inc d : inc l
	edup 

	pop bc, de, hl
	inc hl : inc de
	ret 

; Print one char with ROM font
; DE - Screen memory address
; A  - char
PrintChar_8x8B 	push hl, de, bc
	sub #1f
	ld hl, #3d00 - #08
	ld bc, #08
1	add hl, bc
	dec a
	jr nz, 1b

	dup 8 
	ld a,(hl) : ld b, a : rla : or b : ld (de), a   ; bold
	inc d : inc l
	edup 

	pop bc, de, hl
	inc hl : inc de
	ret 