#!/bin/bash

#  递归扫描目录，在包含*.c的目录下生成Makefile文件，该makefile包含/tools/Makefile     #
#  生成的Makefile将最后的目录做为库名，将目录下的所有.c编译成.o添加到库里
#


###########    生成库  ###############
#常常将Makefile写成Makfile，弄个变量保存，防止出现这样低级的错误
mf=Makefile
function spitMakefile()
{
    #目录切换
    cd 
    local src=`ls *.c 2>/dev/null`
    if [ ! -z "$src" ];then
        echo "在生成Makfile文件"
        echo "#    静态库的编译，该Makefile由脚本自动生成" > $mf
        echo "">>$mf
        echo "">>$mf
        echo "# 下面是将要被添加进库的文件" >> $mf
        echo ".PHONY:all" >> $mf
        echo "sources=\\" >> $mf
        for file in $src;do
            if [ -f "$file" ];then
                echo "    $file\\" >> $mf
            fi
        done
        echo "" >> $mf
        echo "# 最终生成文件,使用隐含规则" >> $mf
        echo "all:\$r/lib/lib.a" >> $mf
        echo "" >> $mf
        echo "\$r/lib/lib.a:\$(sources:%.c=%.o)" >> $mf
        echo "" >> $mf
        echo "include \$r/tools/Makefile" >> $mf
        echo "-include \$(sources:%.c=%.d)" >> $mf
    fi
    cd ..       # 回到上层目录
}

## 递归扫描目录
# 听说不推荐使用递归，我讨厌那些允许你做，却极力不推荐你做的语言，听说lisp就是鼓励你怎么想就怎么做，不要做语言的奴隶
# 不推荐递归的语言不是好语言
function rEachDir()
{
    if [ ! -z "" ];then
        cd 
    fi
    local dirs=`ls -d */ 2>/dev/null`
    if [ ! -z "$dirs" ];then
        for i in $dirs;do
            rEachDir $i
        done
    fi
    if [ ! -z "" ];then
        cd ..
    fi
    spitMakefile `echo |tr -d '/'`
}

if [ ! -z "" ];then
    rEachDir 
else
    echo "Uase $0 path"
fi
