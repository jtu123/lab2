#!/bin/bash
dan=2

until [ "$dan" -gt 9 ]
do
    n=1

    until [ "$n" -gt 9 ]
    do
        echo "$dan x $n = $((dan * n))"
        n=$((n + 1))
    done

    echo
    dan=$((dan + 1))
done

