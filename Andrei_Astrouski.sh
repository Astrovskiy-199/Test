#/bin/bash
AndreiVar="Andrei"
AstrouskiVar="Astrouski"
Fail=$?
Array=(A s t r o u s k i)
if [ $Fail -ne 3 ]; then 
exit 2
elif [$Fail -eq 3 ];then
exit 3
else 
exit 0
  
fi



rm -rf ~/Andrei_Astrouski;
mkdir ~/${AndreiVar}_${AstrouskiVar};
truncate -s 1 kib ~/${AndreiVar}_${AstrouskiVar}/${Array[0]};
truncate -s 1 mib ~/${AndreiVar}_${AstrouskiVar}/${Array[1]};
truncate -s 10 mib ~/${AndreiVar}_${AstrouskiVar}/${Array[2]};
find ~/ -type d -mmin -60 | awk {print} > ~/${AndreiVar}_${AstrouskiVar}/search.log;
cd ~/${AndreiVar}_${AstrouskiVar};
tar -cvf archive.tar ${Array[0]} ${Array[1]} | mv archive.tar ~/
tar -rvf archive.tar ${Array[2]};
cd ~/${AndreiVar}_${AstrouskiVar}/;
rm -rf ${Array[@]};
cd ~/;
tar -xvf archive.tar
