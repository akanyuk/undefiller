SCENE_CYCLES 	equ 80

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

DATA	
	db 0, 32, 48 : dw #4004
	db 0, 32, 32 : dw #4000
	db 0, 32, 16 : dw #4080
	db 0, 32, 00 : dw #4800
	db 0, 32, 00 : dw #4880
	db 0, 32, 16 : dw #5000
	db 0, 32, 32 : dw #5080
	db 0, 32, 48 : dw #5084

	db 0, 32, 48 : dw #4018
	db 0, 32, 32 : dw #401c
	db 0, 32, 16 : dw #409c
	db 0, 32, 00 : dw #481c
	db 0, 32, 00 : dw #489c
	db 0, 32, 16 : dw #501c
	db 0, 32, 32 : dw #509c
	db 0, 32, 48 : dw #5098
DATA_END
