	jp preBalls
	jp balls.NextFrame
	jp balls.DisplayFrame 

	; miniballs
miniBalls	include "miniballs/miniballs.asm"

preBalls	module preballs
	call DisplayFrame
	jr NextFrame
	include "preballs/player.asm"
	endmodule

	; balls player
	module balls
	include "balls/player.asm"
	endmodule
