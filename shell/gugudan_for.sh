#!/bin/bash
for ((dan=2; dan<=9; dan++))
do
    for ((n=1; n<=9; n++))
    do
        echo "$dan x $n = $((dan * n))"
    done
    echo
done
