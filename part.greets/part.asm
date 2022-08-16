	ld de, #4000
	call PrintCursor	
	dec de
	ld b,30 : halt : djnz $-1	

	ld hl, GREETS
	ld b,7 ; greets num limes
1	push bc
	call greetsLine
	pop bc 
	djnz 1b

	ld b,200 : halt : djnz $-1

	ret

greetsLine	push de
	push hl
	ld hl, .gstrt
	call PrintHuman
	pop hl
	call PrintHuman
	ld a,"\""
	call PrintChar_8x8	
	pop de
	dup 8
	call lib.DownDE
	edup
	dec e
	call PrintCursor	
	ld b,30 : halt : djnz $-1	
	dec e
	dec hl
	dec hl
	ret

; .allnight	db "I CAN DO IT ALL NIGHT", 0

.gstrt	db "undefine \"", 0

GREETS	db "stardust", 0
	db "lom", 0
	db "demarche", 0
	db "sibcrew", 0
	db "tbk4d", 0
	db "qbone", 0
	db "errorsoft", 0

PrintCursor	ld a,">"
	call PrintChar_8x8
	ld a,"_"
	jp PrintChar_8x8

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
	halt : halt
	call PrintChar_8x8
	jr PrintHuman

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
