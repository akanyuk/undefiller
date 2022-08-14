TRANSITION_FRAMES	equ 88 ; продолжительность части во фреймах, 16bit
TRANSITION_SCENES_CNT	equ 3   ; количество сцен этой части

; Общие константы сцен
SCENE_SETUP_BLOCK_LEN 	equ 5

; Содержимое блока настройки сцены
SETUP_BEFORE_START	equ 0 ; Количество фреймов, пропускаемых перед стартом сцены, dw
SETUP_FRAMES_CNT	equ 2 ; Общее количество фреймов сцены, db
SETUP_FUNC		equ 3 ; Вызываемая функция, dw

	
mainCycle	ld ix, SCENES
	ld a, TRANSITION_SCENES_CNT
sceneCycle	push af
_transitionFrm	ld hl, 0
	ld e, (ix + SETUP_BEFORE_START)
	ld d, (ix + SETUP_BEFORE_START + 1)
	sbc hl, de : jr c, sceneSkip ; сцене рано начинаться

	ld a, (ix + SETUP_FRAMES_CNT) : or a : jr z, sceneSkip ; сцена закончена
	dec a : ld (ix + SETUP_FRAMES_CNT), a

	call jpHL

sceneSkip	ld de, SCENE_SETUP_BLOCK_LEN : add ix, de
	pop af : dec a : jr nz, sceneCycle
	
	halt
	ld hl, (_transitionFrm + 1)
	inc hl : ld (_transitionFrm + 1), hl
	ld de, TRANSITION_FRAMES : sbc hl, de : ret nc 
	jr mainCycle

jpHL	ld l, (ix + SETUP_FUNC)
	ld h, (ix + SETUP_FUNC + 1)
	jp (hl)

SCENES	
	dw 000 : db 001 : dw SCENE0_COLOR1 	; scene 0 - setup colors1
	dw 000 : db 001 : dw SCENE0_COLOR2 	; scene 0 - setup colors2
	dw 001 : db 087 : dw SCENE0_PLAY 	; scene 0 - play

	include "scenes_data.asm"
