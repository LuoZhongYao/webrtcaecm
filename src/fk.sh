#!/bin/bash
sed -i 's/\(#include\s*"\).*\/\(.*"\)/\1\2/g' *.[ch]
files=`grep "#include\s*\".*\"" -h *.[ch] | sed 's/#include\s*\"\(.*\)\"/\1/g'`
for i in $files;do
    if [ ! -f "$i" ];then
        find ../../webrtc -name "$i" -exec cp {} ./ \;
    fi
done

