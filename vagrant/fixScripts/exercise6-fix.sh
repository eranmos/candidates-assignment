#!/bin/bash
#add fix to exercise6-fix here
 
#!/bin/bash
total_size=0
dest="${@: -1}"
 
if [ $HOSTNAME == "server1" ]; then
for i in $@; do
   if [ $i != $dest ]; then
    size=$(wc -c $i | awk '{print $1}')
    $(scp $i vagrant@server2:/$dest)
    total_size=$((total_size + size))
   fi
done
else
for i in $@; do
   if [ $i != $dest ]; then
    size=$(wc -c $i | awk '{print $1}')
    $(scp $i vagrant@server1:/$dest)
    total_size=$((total_size + size))
   fi
done
fi
echo "$total_size"