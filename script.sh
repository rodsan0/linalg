#!/bin/bash

C_FILES=$(find linalg/ -type f \( -name '*.c' ! -name 'main.c' ! -name 'tests.c' \))
H_FILES=$(find linalg/ -type f \( -name '*.h' ! -name 'tests.h' \))


echo $C_FILES
echo $H_FILES

echo "#pragma once" > linalg.h

for file in $H_FILES $C_FILES; do
    cat $file | sed 's/#pragma once//g' | sed 's/#include ".*"//g' >> single_include/linalg.hpp
done


