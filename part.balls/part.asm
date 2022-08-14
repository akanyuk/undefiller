	jp NextFrame
	jp DisplayFrame ; $+3 play frame 

	; $+6 miniballs
	module transition
	include "miniballs/transition.asm"
	endmodule	

	module miniballs
	include "miniballs/miniballs_player.asm"
	endmodule

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