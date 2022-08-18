	; a - индекс транзации
	; c - цвет
	cp 1 : jp z, transition1
	cp 2 : jp z, transition2
	cp 3 : jp z, transition3
	cp 4 : jp z, transition4
	cp 5 : jp z, transition5
	jp transition0

	include "player.asm"

; a: Цвет
; b: Количество знакомест по горизонтали
; c: Количество знакомест по вертикали
; hl: Адрес начала атрибутной области
SetColor	ld de, #0020
1	push bc
	push hl
2	ld (hl), a
	inc hl
	djnz 2b
	ex af, af'    
	pop hl
	add hl, de
	pop bc
	dec c
	ld a, c : or a 
	ret z
	ex af, af'
	jr 1b
	ret

setColorsMiniBalls
	ld a, c
	push af
	ld b, 4 ; Количество знакомест по горизонтали
	ld c, 24 ; Количество знакомест по вертикали
	ld hl, #581c ; адрес начала атрибутной области
	call SetColor

	pop af
	ld b, 4 ; Количество знакомест по горизонтали
	ld c, 24 ; Количество знакомест по вертикали
	ld hl, #5800 ; адрес начала атрибутной области
	jp SetColor

transition0	call setColorsMiniBalls
	module t0
	include "transition0.asm"
	endmodule

transition1	call setColorsMiniBalls
	module t1
	include "transition1.asm"
	endmodule

transition2	call setColorsMiniBalls
	module t2
	include "transition2.asm"
	endmodule

transition3	call setColorsMiniBalls
	module t3
	include "transition3.asm"
	endmodule

transition4	call setColorsMiniBalls
	module t4
	include "transition4.asm"
	endmodule

transition5	call setColorsMiniBalls
	module t5
	include "transition5.asm"
	endmodule	