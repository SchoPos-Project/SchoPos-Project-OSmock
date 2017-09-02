#module
#deffunc boxfa int ax, int ay, int bx, int by
pdx = ax, bx, bx, ax
pdy = ay, ay, by, by
gsquare -1,pdx, pdy
return
#global