#!/bin/bash
dan=2

while [ "$dan" -le 9 ]
do
    n=1

    while [ "$n" -le 9 ]
    do
        echo "$dan x $n = $((dan * n))"
        n=$((n + 1))
    done

    echo
    dan=$((dan + 1))
done

