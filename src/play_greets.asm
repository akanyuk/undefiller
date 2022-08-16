	; depack
	ld a, P_GREETS : call lib.SetPage
	ld hl, A_PART_GREETS_PACKED
	ld de, A_PART_GREETS
	call lib.Depack

	call A_PART_GREETS
                ld b,200 : halt : djnz $-1

	call lib.FadeScreenOnInterrupts
	ld a,#44 : call lib.SetScreenAttr
	
                call A_PART_GREETS + 3
                ld b,100 : halt : djnz $-1
	
                call A_PART_GREETS + 6