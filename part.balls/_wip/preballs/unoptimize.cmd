gifsicle.exe --colors 256 %1 -o _1.gif
gifsicle.exe --unoptimize _1.gif -o _2.gif
gifsicle.exe --colors 2 _2.gif -o _3.gif

del _1.gif
del _2.gif

rename _3.gif %~n1-unoptimized.gif