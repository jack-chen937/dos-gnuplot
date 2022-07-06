set terminal wxt # 输出到电脑屏幕
filename=ARG1
specialname=ARG2
# 数据文件名
path=filename.'total26.txt'

# title0='Ca'
title1='Fe_{3{/:Italic d}}'
title2='O_{2{/:Italic p}}'
title3='TDOS'

set terminal pngcairo size 1200,1200 linewidth 2
# 文件保存格式与文件名
# set output filename.'1nocolor.eps'
set output filename.specialname.'.png'
set key samplen -1
set lmargin at screen 0.15
set rmargin at screen 0.96
# 取消xy轴边上锯齿镜像
set xtics nomirror ;set ytics nomirror
# 去掉没有特别声明的title标注
set key font "Times New Roman, 22"
set key noautotitles
set arrow 1 from -10.5,0 to 5,0 linecolor '#00000' dashtype 1 linewidth 2 nohead ;
# set key horizontal width -3 height 1 maxrows 1 spacing 1
set xrange [-10.5:5] ;set xtics -10,2,5;set mxtics 2
set ytics font "Times New Roman, 20" 
set xtics font "Times New Roman, 20"
# set key at graph 0.95,0.98

# # 多图操作
# 顶部间距控制
Top=0.96
Dy=0.285
seam=0.04
set multiplot
set key at graph 0.99,0.96
# 设置xy轴名称、范围、刻度增量2/0.5
set xlabel 'Energy (eV)' font "Times New Roman, 28" offset 0,-0.8;
set ylabel 'Density of states (states/eV)' font "Times New Roman, 30" offset -4,15;
set  yrange [-18:18];set ytics -16,4,16;set mytics 2
set tmargin at screen Top -2*Dy  
set bmargin at screen Top -3*Dy  
set parametric
plot [-36:30] 0,t linecolor '#000000' linewidth 1.5 dashtype "-.-",\
path using 1:2 linecolor '#000000' linewidth 2 title title3 smooth mcsplines ,\
path using 3:4 linecolor '#000000' linewidth 2 smooth mcsplines 
# ###########最顶上的图##################
# 设置xy轴名称、范围、刻度增量2/0.5
unset xlabel
unset ylabel
set key at graph 1,0.99
set xtics format ''

# set tmargin at screen Top 
# set bmargin at screen Top -Dy -seam
# set parametric
# plot [-3:3] 0,t linecolor '#000000' linewidth 1.5 dashtype "-.-",\
# path using 5:6 linecolor '#000000' linewidth 2 title title0 smooth mcsplines ,\
# path using 7:8 linecolor '#000000' linewidth 2 smooth mcsplines

set  yrange [-14:14];set ytics -12,4,12;set mytics 2
set tmargin at screen Top
set bmargin at screen Top -1*Dy 
# set  yrange [-30:30];set ytics -30,30,30;set mytics 6
set parametric
plot [-30:26] 0,t linecolor '#000000' linewidth 1.5 dashtype "-.-",\
path using 5:6 linecolor '#000000' linewidth 2 title title1 smooth mcsplines ,\
path using 7:8 linecolor '#000000' linewidth 2 smooth mcsplines


set  yrange [-10:10];set ytics -8,4,8;set mytics 2
set tmargin at screen Top -1*Dy 
set bmargin at screen Top -2*Dy 
set parametric
plot [-22:22] 0,t linecolor '#000000' linewidth 1.5 dashtype "-.-",\
path using 9:10 linecolor '#000000' linewidth 2 title title2 smooth mcsplines ,\
path using 11:12 linecolor '#000000' linewidth 2 smooth mcsplines 

# set tmargin at screen Top -2*Dy 
# set bmargin at screen Top -3*Dy 
# set parametric
# plot [-3:3] 0,t linecolor '#000000' linewidth 1.5 dashtype "-.-",\
# path using 29:30 linecolor '#000000' linewidth 2 title title2 smooth mcsplines ,\
# path using 31:32 linecolor '#000000' linewidth 2 smooth mcsplines 

# set tmargin at screen Top -3*Dy 
# set bmargin at screen Top -4*Dy 
# set parametric
# plot [-3:3] 0,t linecolor '#000000' linewidth 1.5 dashtype "-.-",\
# path using 33:34 linecolor '#000000' linewidth 2 title title3 smooth mcsplines ,\
# path using 35:36 linecolor '#000000' linewidth 2 smooth mcsplines 

# set key at graph 0.9,0.99
# set tmargin at screen Top -4*Dy 
# set bmargin at screen Top -5*Dy 
# set parametric
# plot [-3:3] 0,t linecolor '#000000' linewidth 1.5 dashtype "-.-",\
# path using 37:38 linecolor '#000000' linewidth 2 title title4 smooth mcsplines ,\
# path using 39:40 linecolor '#000000' linewidth 2 smooth mcsplines 



unset multiplot
set output
exit
!
