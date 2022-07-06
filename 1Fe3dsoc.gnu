set terminal wxt # 输出到电脑屏幕
filename="pure2bsoc"
path001=filename.'00111.txt'
path100=filename.'10011.txt'
# title1='001'
# title2='100'
# 数据文件名
# path=filename.'.txt'

# title1='Co3d'
# title2='Sr'
# title3='Fe_{near^6}'
# title4='Fe_{near^{17}}'
# title5='Fe_{far^1}'
# title6='TDOS'
# title8='Co'

# title0='Co'
title1='Fe_{2{/:Italic a}}'
title2='Fe_{2{/:Italic b}}'
title3='Fe_{4{/:Italic f}_1}'
title4='Fe_{4{/:Italic f}_2}'
title5='Fe_{12{/:Italic k}}'
# title7='TDOS'

# title0='Ca'
# title1='Fe_{3d}'
# title2='O_{2p}'
# title7='TDOS'

# title1='Fe_{2a-{/Times-New-Roman near}}'
# title2='Fe_{2a-{/Times-New-Roman far}}'
# title3='Fe_{2b-{/Times-New-Roman near}}'
# title4='Fe_{2b-{/Times-New-Roman far}}'
# title5='Fe_{4f1-{/Times-New-Roman near}}'
# title6='Fe_{4f1-{/Times-New-Roman far}}'
# title7='Fe_{4f2-{/Times-New-Roman near}}'
# title8='Fe_{4f2-{/Times-New-Roman far}}'
# title9='Fe_{12k-{/Times-New-Roman near}}'
# title10='Fe_{12k-{/Times-New-Roman far}}'

title1='d_{/:Italic xy}'
title2='d_{/:Italic yz}'
title3='d_{/:Italic xz}'
title4='d_{{/:Italic z}^2}'
title5='d_{{/:Italic x}^2-{/:Italic y}^2}'
# title6='Co_{3d}'

set terminal pngcairo size 1200,1200 linewidth 2 # 文件保存格式与文件名
# set output filename.'1nocolor.eps'
set output filename.'pure2bsoc.png'
set key samplen -1
set lmargin at screen 0.15
set rmargin at screen 0.96
# 取消xy轴边上锯齿镜像
set xtics nomirror ;set ytics nomirror
# 去掉没有特别声明的title标注
set key font "Times New Roman, 26"
set key noautotitles
# set arrow 1 from -9,0 to 4,0 linecolor '#00000' dashtype 1 linewidth 1 nohead ;
# set key horizontal width -3 height 1 maxrows 1 spacing 1
set xrange [-9:4] ;set xtics -9,1,4;set mxtics 2
set ytics font "Times New Roman, 26" 
set xtics font "Times New Roman, 26"
# set key at graph 0.95,0.98

# # 多图操作
# 顶部间距控制
Top=0.96
Dy=0.167
seam=0.05
n=20
set multiplot
set key at graph 1,0.9
# 设置xy轴名称、范围、刻度增量2/0.5 

set xlabel 'Energy(eV)' font "Times New Roman, 30" offset 0,-0.8;
set ylabel 'Density of states(electrons/eV formula unit)' font "Times New Roman, 30" offset -4,17;
set  yrange [0:2.25];set ytics 0,0.5,2;set mytics 2

set xtics font "Times New Roman, 24"
set ytics font "Times New Roman, 24"

set tmargin at screen Top -4*Dy
set bmargin at screen Top -5*Dy
set parametric
plot path001 using 11:12 linecolor '#000000' linewidth 2 title title5 smooth mcsplines ,\
path100 using 11:12 linecolor '#ff0000' linewidth 2 smooth mcsplines 
# ###########最顶上的图##################
# 设置xy轴名称、范围、刻度增量2/0.5
unset xlabel
unset ylabel
set key at graph 1,0.9
set xtics format ''

set  yrange [-0.25:1.75];set ytics 0,0.5,1.5;set mytics 2
set tmargin at screen Top 
set bmargin at screen Top -Dy 
set parametric
plot path001 using 3:4 linecolor '#000000' linewidth 2 title title1 with lines ,\
path100 using 3:4 linecolor '#ff0000' linewidth 2 with lines

set  yrange [-0.25:2.75];set ytics 0,0.5,2.5;set mytics 2
set tmargin at screen Top -1*Dy
set bmargin at screen Top -2*Dy
set parametric
plot path001 using 5:6 linecolor '#000000' linewidth 2 title title2 with lines ,\
path100 using 5:6 linecolor '#ff0000' linewidth 2 with lines

set  yrange [-0.25:2.75];set ytics 0,0.5,2.5;set mytics 2
set tmargin at screen Top -2*Dy
set bmargin at screen Top -3*Dy
set parametric
plot path001 using 7:8 linecolor '#000000' linewidth 2 title title3 with lines ,\
path100 using 7:8 linecolor '#ff0000' linewidth 2 with lines 

set  yrange [-0.25:1.75];set ytics 0,0.5,1.5;set mytics 2
set tmargin at screen Top -3*Dy
set bmargin at screen Top -4*Dy
set parametric
plot path001 using 9:10 linecolor '#000000' linewidth 2 title title4 with lines ,\
path100 using 9:10 linecolor '#ff0000' linewidth 2 with lines 


unset multiplot
set output
exit
!




#v
