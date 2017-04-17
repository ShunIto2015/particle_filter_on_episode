#!/bin/bash
#coding:utf-8

#引数にセンサ値の入ったテキストファイルを取る

#センサ値がいくつあるか
input_num=$(cat $1 | wc -l)
past=$(cat $1 | tr '\n' ',' | sed -e 's/,$//')

for n in $(seq 1 $input_num)
do
    sen=$(sed -n "$n"p sensor_val.txt)
    echo ===
    echo sensor: "$sen"
    echo past: "$past"
    echo likelihood:
    echo "$sen",[ "$past" ] | python ../PFoE_module/likelihood_function.py
done