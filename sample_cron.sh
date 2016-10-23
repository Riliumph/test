#!/bin/bash

#set -u	# detect undefined variable
#set -e	# abort as soon as error

get_date=`date +%y-%m%d_%H%M`
root_path=$HOME/Documents/sample_code/$get_date
mkdir -p $root_path
cd $root_path

git clone https://github.com/Riliumph/test.git
cd test
clang++ -g -O0 main.cc
#./a.out

