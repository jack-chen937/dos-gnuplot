# coding=utf-8
import xlrd
import os
import xlwt
from xlutils.copy import copy
from time import sleep

# ============================================
# 是否删除xls文件
delxls=True  #True删除；  #False;不删除
# d为NDOS值
d=501
# 态密度要缩小倍值
apart = 1
# 文件名
path = 'CeFe4f1'
# 降低几列的态密度
count = 1
# ==============================================
c = 0
# 创建workbook对象
workbook = xlwt.Workbook(encoding="utf-8", style_compression=0)
# 创建工作表
worksheet = workbook.add_sheet('data', cell_overwrite_ok=True)

# 打开文件
file = open(path+'.txt', "r")
row = 0
col = 0
# 按行读取数据，并将数据字符串转成需要的数组,每行两个数据
for line in file.readlines():
    data = []
    i = 0
    datastr = ''
    # 按行读取数据
    mystr = line.replace(' ', ' ').replace('\n', '').strip()
    for item in mystr:
        if item == ' ':
            if i < 1:
                i += 1
                datastr += item
            continue
        datastr += item
    data = datastr.split(' ')
    for j in range(0, len(data)):
        m = data[j]
        if m == '':
            continue
        val = str(float(m)/apart)
        # y轴数据除以想要的倍数
        if j == 1 and c < count:
            worksheet.write(row, col+j, val)
        else:
            worksheet.write(row, col+j, m)
    row += 1
    # 每d行自动换行

    if row % d == 0:
        row = 0
        c += 1
        col += 2
workbook.save(path+'.xls')
sleep(2)
# 读取文件
read_file = xlrd.open_workbook(path+'.xls', formatting_info=True)
# 将文件复制到内存
write_data = copy(read_file)
# 读取复制后文件的sheet1
write_save = write_data.get_sheet(0)
# 写入数据
n = 0
table1 = read_file.sheets()[0]
l = len(table1.col_values(0))
for j in range(0, l):
    linestr = ''
    for itemstr in table1.row_values(j):
        linestr += str(itemstr)+' '
    with open(path+str(apart)+str(count)+'.txt', "a") as f:
        f.write(linestr+'\n')
    # print('总共有'+str(int(len(table1.row_values(0))-1)/4)+'条轨道')
    f.close()

# 检查数据是否写入正确
# file1 = open(path+str(apart)+'1.txt', "r")
# for line1 in file1.readlines():
#     print(line1)
if delxls:
   os.remove(path+'.xls')
print('数据已保存到:'+path+str(apart)+str(count)+'.txt')


# gnuplot = Popen('gnuplot', stdin=PIPE, stderr=PIPE, stdout=PIPE)
# #gnuplot.stdin .write(b"set terminal jpeg \n")
# # gnuplot.stdin .write(b"set output 'plot.jpg' \n")  #存到图片时候不会跳出gnuplot界面
# gnuplot.stdin .write(
#     b'set terminal postscript eps color solid linewidth 1 font "Times New Roman,20" \n')
# gnuplot.stdin .write(
#     b'set terminal pngcairo linewidth 1 font "Times New Roman, 14"\n')
# gnuplot.stdin .write(b'set output "dos.eps";set output "dos.png"\n')
# gnuplot.stdin .write(b'set xtics nomirror ;set ytics nomirror"\n')
# gnuplot.stdin .write(
#     b"set xlabel 'Energy(eV)';set xrange [-10:5];set xtics -10,1,5 ;set ylabel 'Density of states(1/eV)';set  yrange [-1.5:1.5];set ytics -1.5,0.5,1.5\n")
# gnuplot.stdin .write(
#     b"set arrow 1 from 0,-1.5 to 0,1.5 linestyle 0 linecolor '#00000' linewidth 3 nohead ;set arrow 2 from -10,0 to 5,0 linestyle 1 linecolor '#00000' linewidth 2 nohead\n")
# gnuplot.stdin .write(
#     b"plot '2a1.txt' using 5:6 linecolor '#FF0000' linewidth 1 with lines title 'd_{xy}','2a1.txt' using 7:8 linecolor '#FF0000' linewidth 1 with lines \n")
# gnuplot.stdin .flush()

# input('Press the Return key to quit: ')  # 暂停一下，防止gnuplot界面自动关闭
# gnuplot.stdin .close()
