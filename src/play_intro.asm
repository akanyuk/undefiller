	ld a,P_INTRO : call lib.SetPage
	call A_PART_INTRO

	; Play intro on interrupts
	ld hl,A_PART_INTRO + 6
	call interrStart

	call A_PART_INTRO + 3

	call interrStop
	call A_PART_INTRO + 9
