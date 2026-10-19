#!/bin/bash 
count=$(command ls -lA -- . | grep -c '^-') 
echo "Regular files: $count"

