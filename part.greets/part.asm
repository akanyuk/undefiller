	jp preImage
	jp main
	jp postImage

	; multipass text
	ld de, #4842
	ld hl, POST_TEXT
	ld b,5
1	push bc
	push de
	call printHuman
	inc hl
	pop de
	call nextLine
	ld b,30 : halt : djnz $-1
	pop bc 
	djnz 1b
	ret

POST_SCR	incbin "res/multipass.bin"
POST_TEXT	db "shuran33",0
	db "n1k-o",0
	db "apeape",0
	db "--------",0
	db "2022",0

postImage
screenReplace	ld b,32
.loop	push bc
.movePixels	ld hl,POST_SCR
	ld de,#4000

	ld a,192
	ld bc,#0020
	push hl
	push de
1	push af
	ld a,(hl) : ld(de),a
	call lib.DownDE
	add hl,bc
	pop af : dec a : jr nz,1b
	pop de : inc de : ld (.movePixels+4),de
	pop hl : inc hl : ld (.movePixels+1),hl	

.moveAttrs	ld hl,POST_SCR+#1800
	ld de,#5800
	
	ld a,24
	ld bc,#001f
	push hl
	push de	
1	push af
	ldi : inc bc
	add hl,bc
	ex de,hl : add hl,bc : ex de,hl
	pop af : dec a : jr nz,1b
	pop de : inc de : ld (.moveAttrs+4),de
	pop hl : inc hl : ld (.moveAttrs+1),hl	

	halt
	pop bc
	djnz .loop
	ret

preImage	ld hl,PRE_SCR
	jp lib.DispBinOnInterrupts
PRE_SCR	incbin "res/amiga.bin"

main	ld de, #4000

	ld hl, GREETS
	ld b,8
1	push bc
	call greetsLine
	pop bc 
	djnz 1b

	call nextLine

	ld b,50 : halt : djnz $-1	

	; "I CAN DO IT ALL NIGHT"
	push de

	; scr -> attr
	ld a,d : rrca : rrca : rrca : and 3 : or #58 : ld d,a
	ld h,a : ld a, e : ld l, a 
	inc e

	ld bc,#001f
	ld (hl),#46
	ldir

	pop de
	push de
	ld hl, allnight
	call lib.PrintCpu
	pop de
	call nextLine
	call nextLine

	ld b,120 : halt : djnz $-1

	call lib.PrintCursor	
	dec e

	ld hl, GREETS2
	ld b,6
	call greetsFast
	call nextLine

	call lib.PrintCursor	
	dec e
	
	ld b,80 : halt : djnz $-1
	
	ld hl, GREETS3
	ld b,6
	jp greetsFast

allnight	db "I CAN DO IT ALL NIGHT", 0

greetsLine	push de
	push hl
	call lib.PrintCursor	
	dec e
	ld b,15 : halt : djnz $-1	
	ld hl, .gstrt
	call printHuman
	pop hl
	call printHuman
	inc hl
	push hl
	ld a,"\""
	call lib.PrintChar_8x8	
	pop hl
	pop de
	call nextLine
	ret
.gstrt	db "undefine \"", 0
GREETS	db "stardust", 0
	db "sibcrew", 0
	db "shiru", 0
	db "rmda", 0
	db "life on mars", 0
	db "errorsoft", 0
	db "demarche", 0
	db "bfox", 0

greetsFast	push bc
	push de
	call printHumanFast
	inc hl		
	pop de
	call nextLine
	dec e
	pop bc
	dec b

1	push bc	
	push de
	call printHumanFast
	inc hl	
	pop de
	call nextLine
	pop bc
	djnz 1b
	ret

GREETS2	db "undefine (uris, toughthrough,", 0
	db "prof4d, pixelrat, nodeus, vinnny", 0
	db "kakos_nonos, joe vondayl, flast,", 0
	db "helpcomputer0, grongy, garvalf,", 0
	db "dman, dimidrol, devstratum,", 0
	db "blastoff, art-top, aggressor)", 0

GREETS3	db "undefine (target, speccy.pl,", 0
	db "serzhsoft, q-bone, nedopc,", 0
	db "megus, mayhem, marquee design,", 0
	db "joker, invaders, hooy-program,", 0
	db "gogin, gemba boys, excess team,", 0
	db "darklite / offence, ate bit)", 0

; GREETS2	db "undefine (aggressor, art-top,",0
; 	db "blastoff, devstratum, dimidrol,", 0
; 	db "diver, dman, garvalf, grongy,", 0
; 	db "helpcomputer0, joe vondayl,",0
; 	db "kakos_nonos, nodeus, pixelrat,",0
; 	db "prof4d, toughthrough, uris)", 0

; GREETS3	db "undefine (ate bit, darklite", 0
; 	db "excess team, gemba, gogin,",0
; 	db "hooy-program, invaders, joker,",0
; 	db "marquee design, mayhem, megus,",0
; 	db "nedopc, offence, q-bone,", 0
; 	db "serzhsoft, speccy.pl, target)",0

nextLine	ld b, 8
	call lib.DownDE
	djnz $-3
	ret

; Print zero ended string with font 8х8 - human speed
; DE - Screen memory address
; HL - Text pointer
printHuman 	ld a, (hl)
	or a : ret z
	push af
	ld a,"_"
	call lib.PrintChar_8x8
	pop af
	dec de
	dec hl
	halt : halt
	call lib.PrintChar_8x8
	jr printHuman

printHumanFast 	ld a, (hl)
	or a : ret z
	push af
	ld a,"_"
	call lib.PrintChar_8x8
	pop af
	dec de
	dec hl
	push af
phf	ld a, #00 : inc a : and #03 : ld (phf+1), a
	or a : jr nz, $+3
	halt
	pop af
	call lib.PrintChar_8x8
	jr printHumanFast