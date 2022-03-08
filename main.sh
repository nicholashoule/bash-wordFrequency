#!/bin/bash
# In the given file named input, find the frequency of all 
# the words and print as per the following format.
#
# Group
printf "\nExample 1:\n"
tr ' ' '\n' < input | sort -n | uniq -c | awk '{if(a[$1])a[$1]=a[$1]" "$2; else a[$1]=$2;}END{for (i in a)print i, a[i];}' | sort -n | awk '{$1=$1;print}'

# Decending by number
printf "\nExample 2:\n"
awk '{ w[$1]+=1 } END {for(i in w){ print w[i], i} }' RS="[ \n]+" input | sort -r

# Decending by number, colums reversed
printf "\nExample 3:\n"
sed -e 's/\\n/ /g' -e 's/  */ /g' < input2 | xargs | tr ' ' '\n' | sort | uniq -c | sort -hr | awk '{print $2,$1}'
