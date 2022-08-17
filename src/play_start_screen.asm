                ld a, #44 : call lib.SetScreenAttr

	ld de,#4001 : call lib.PrintCursor
	ld b,20 : halt : djnz $-1
	ld hl,DEMO_NAME1
	ld de,#4002
	call PrintHuman

	ld b,30 : halt : djnz $-1

	ld hl,DEMO_NAME1_BACK
	ld de,#4022
	call lib.PrintCpu

	ld de,#4061 : call lib.PrintCursor
	ld b,20 : halt : djnz $-1
	ld hl,DEMO_NAME2
	ld de,#4062
	call PrintHuman

	ld b,30 : halt : djnz $-1

	ld hl,DEMO_NAME2_BACK
	ld de,#4082
	call lib.PrintCpu

	ld de,#40c1 : call lib.PrintCursor
	ld b,20 : halt : djnz $-1
	ld hl,DEMO_NAME3
	ld de,#40c2
	call PrintHuman

                ld b, 50 : halt : djnz $-1

	ld a, P_START_SCR : call lib.SetPage
	ld hl,START_SCR
	call lib.DispBinOnInterrupts

                jp _playStartEnd
DEMO_NAME1      db "UNDEFINED", 0                
DEMO_NAME1_BACK db "Bad command", 0                
DEMO_NAME2      db "UNDEFILIN", 0                
DEMO_NAME2_BACK db "Bad command", 0                
DEMO_NAME3      db "UNDEFILLER", 0                

_playStartEnd

