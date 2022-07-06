set terminal wxt # 输出到电脑屏幕
filename=ARG1
# 数据文件名
path=filename.'.txt'

title1='{/:Italic d}_{/:Italic xy}'
title2='{/:Italic d}_{/:Italic yz}'
title3='{/:Italic d}_{/:Italic xz}'
title4='{/:Italic d}_{/:Italic z}^2'
title5='{/:Italic d}_{/:Italic x}^2-_{/:Italic y}^2'
title6='Fe_{/:Italic 3d}'

set terminal pngcairo size 1200,1200 linewidth 2
# 文件保存格式与文件名
# set output filename.'1nocolor.eps'
set output filename.'dopedatom.png'
set key samplen -1
set lmargin at screen 0.15
set rmargin at screen 0.96
# 取消xy轴边上锯齿镜像
set xtics nomirror ;set ytics nomirror
# 去掉没有特别声明的title标注
set key font "Times New Roman, 22"
set key noautotitles
set arrow 1 from -7.75,0 to 2.5,0 linecolor '#00000' dashtype 1 linewidth 1 nohead ;
# set key horizontal width -3 height 1 maxrows 1 spacing 1
set xrange [-7.75:2.5] ;set xtics -7,1,2;set mxtics 2
set ytics font "Times New Roman, 24" 
set xtics font "Times New Roman, 24"
# set key at graph 0.95,0.98

# # 多图操作
# 顶部间距控制
Top=0.96
Dy=0.14
seam=0.05
n=20
set multiplot
set key at graph 1,0.95
# 设置xy轴名称、范围、刻度增量2/0.5
set xlabel 'Energy(eV)' font "Times New Roman, 30" offset 0,-0.8;
set ylabel 'Density of states(electrons/eV formula unit)' font "Times New Roman, 30" offset -4,16;
# set  yrange [-2:2];set ytics -1.6,0.8,1.6;set mytics 1
set  yrange [-2:2];set ytics -1.6,1.6,1.6;set mytics 4
set tmargin at screen Top -5*Dy
set bmargin at screen Top -6*Dy
set parametric
plot [-3:3] 0,t linecolor '#000000' linewidth 1.5 dashtype "-.-",\
path using 25:26 linecolor '#000000' linewidth 2 title title5 smooth mcsplines ,\
path using 27:28 linecolor '#000000' linewidth 2 smooth mcsplines 
# ###########最顶上的图##################
# 设置xy轴名称、范围、刻度增量2/0.5
unset xlabel
unset ylabel

set xtics format ''
set  yrange [-6:6];set ytics -5,5,5;set mytics 5
set tmargin at screen Top 
set bmargin at screen Top -Dy 
set parametric
plot [-8:8] 0,t linecolor '#000000' linewidth 1.5 dashtype "-.-",\
path using 5:6 linecolor '#000000' linewidth 2 title title6 smooth mcsplines ,\
path using 7:8 linecolor '#000000' linewidth 2 smooth mcsplines

# set  yrange [-2:2];set ytics -1.6,0.8,1.6;set mytics 1
set  yrange [-2:2];set ytics -1.6,1.6,1.6;set mytics 1
set tmargin at screen Top -1*Dy
set bmargin at screen Top -2*Dy
set parametric
plot [-3:3] 0,t linecolor '#000000' linewidth 1.5 dashtype "-.-",\
path using 9:10 linecolor '#000000' linewidth 2 title title1 smooth mcsplines ,\
path using 11:12 linecolor '#000000' linewidth 2 smooth mcsplines
 
set tmargin at screen Top -2*Dy
set bmargin at screen Top -3*Dy
set parametric
plot [-3:3] 0,t linecolor '#000000' linewidth 1.5 dashtype "-.-",\
path using 13:14 linecolor '#000000' linewidth 2 title title2 smooth mcsplines ,\
path using 15:16 linecolor '#000000' linewidth 2 smooth mcsplines 

set tmargin at screen Top -3*Dy
set bmargin at screen Top -4*Dy
set parametric
plot [-3:3] 0,t linecolor '#000000' linewidth 1.5 dashtype "-.-",\
path using 17:18 linecolor '#000000' linewidth 2 title title3 smooth mcsplines ,\
path using 19:20 linecolor '#000000' linewidth 2 smooth mcsplines 

# set  yrange [-3.6:3.6];set ytics -3,3,3;set mytics 5
set tmargin at screen Top -4*Dy
set bmargin at screen Top -5*Dy
set parametric
plot [-3:3] 0,t linecolor '#000000' linewidth 1.5 dashtype "-.-",\
path using 21:22 linecolor '#000000' linewidth 2 title title4 smooth mcsplines ,\
path using 23:24 linecolor '#000000' linewidth 2 smooth mcsplines 
unset multiplot
set output
exit
!
