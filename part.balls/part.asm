	jp NextFrame
	jp DisplayFrame ; $+3 play frame 

	; $+6 miniballs
	module miniballs
	include "miniballs/miniballs.asm"
	include "miniballs/miniballs_player.asm"
	endmodule

	include "player.asm"
