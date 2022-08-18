SCENE_CYCLES 	equ 76

	ld hl, DATA
	ld de, DATA_CURRENT
	ld bc, DATA_END - DATA
	ldir

	ld b,SCENE_CYCLES
mainLoop	push bc
	ld b, (DATA_END - DATA)/CUBE_DATA_LEN ; количество шаров в сцене
	ld iy, DATA_CURRENT
	call PlayCubes
	halt
	pop bc
	djnz mainLoop
	ret

DATA_CURRENT	block DATA_END - DATA

DATA	db 0, 32, 20 : dw #4000
	db 0, 32, 16 : dw #4080
	db 0, 32, 12 : dw #4800
	db 0, 32, 08 : dw #4880
	db 0, 32, 04 : dw #5000
	db 0, 32, 00 : dw #5080

	db 0, 32, 24 : dw #401c
	db 0, 32, 28 : dw #409c
	db 0, 32, 32 : dw #481c
	db 0, 32, 36 : dw #489c
	db 0, 32, 40 : dw #501c
	db 0, 32, 44 : dw #509c
DATA_END
