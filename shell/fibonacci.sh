#!/bin/bash
a=0
b=1
count=0

while [ "$count" -lt 10 ]
do
    printf '%s ' "$a"
    let "next = a + b"
    a=$b
    b=$next
    let "count = count + 1"
done

echo
