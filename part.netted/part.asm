	jp player1.NextFrame
	jp player1.DisplayFrame
	jp player2.NextFrame
	jr player2.DisplayFrame
	module player1
	include "player.asm"
	endmodule
	module player2
	include "player.asm"
	endmodule
	include "frames.asm"
