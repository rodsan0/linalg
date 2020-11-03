#!/bin/bash

C_FILES=$(find -type f \( -name '*.c' ! -name 'main.c' ! -name 'tests.c' \))
H_FILES=$(find -type f \( -name '*.h' ! -name 'tests.h' \))


echo $C_FILES
echo $H_FILES

mkdir -p single-include
echo "#pragma once" > single-include/linalg.hpp


for file in $H_FILES $C_FILES; do
    cat $file | sed 's/#pragma once//g' | sed 's/#include ".*"//g' >> single-include/linalg.hpp
done


