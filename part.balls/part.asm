	jp preBalls
	jp NextFrame
	jp DisplayFrame 

	; miniballs
miniBalls	module miniballs
	include "miniballs/miniballs.asm"
	include "miniballs/miniballs_player.asm"
	endmodule

preBalls	module preballs
	call DisplayFrame
	jr NextFrame
	include "preballs/player.asm"
	endmodule

	; balls player
	include "balls/player.asm"
