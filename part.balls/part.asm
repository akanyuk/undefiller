	jp preBalls
	jp NextFrame
	jp DisplayFrame 
	jp miniBalls

	; screen after balls
	ld hl,AFTER_SCR
	jp lib.dispBinScrWithHalts
AFTER_SCR	incbin "res/afterballs.scr.bin"


preBalls	module preballs
	call DisplayFrame
	jr NextFrame
	include "preballs/player.asm"
	endmodule

miniBalls	module miniballs
	include "miniballs/miniballs.asm"
	include "miniballs/miniballs_player.asm"
	endmodule

	; balls player
	include "balls/player.asm"
