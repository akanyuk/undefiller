	jp preBalls
	jp NextFrame
	jp DisplayFrame ; $+3 play frame 

	; $+6 miniballs
	module miniballs
	include "miniballs/miniballs.asm"
	include "miniballs/miniballs_player.asm"
	endmodule

	; balls player
	include "player.asm"

preBalls	module preballs
	call DisplayFrame
	jr NextFrame
	include "preballs/player.asm"
	endmodule